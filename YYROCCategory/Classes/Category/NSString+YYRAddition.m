//
//  NSString+YYRAddition.m
//  test
//
//  Created by 袁应荣 on 2017/3/11.
//  Copyright © 2017年 袁应荣. All rights reserved.
//

#import "NSString+YYRAddition.h"


@implementation NSString (YYRAddition)

- (BOOL)isNotBlankString {
    return ![self isBlankString];
}

///  判断字符串是否为空
- (BOOL)isBlankString {
    if (![self isKindOfClass:[NSString class]] ){
        return  YES;
    }
    if ([self isEqual:[NSNull null]]){
        return  YES;
    }
    if (self == NULL || [self isEqual:nil] || [self isEqual:Nil] || self == nil){
        return  YES;
    }
    if([self isEqualToString:@"(null)"]){
        return  YES;
    }
    if([self isEqualToString:@"<null>"]){
        return  YES;
    }
    if (self.length == 0 || [[self stringByTrimmingCharactersInSet:[NSCharacterSet whitespaceAndNewlineCharacterSet]] length] == 0){
        return  YES;
    }
    return NO;
}

- (NSString *)yyr_substringToIndex:(NSInteger)index {
    if ([self isNotBlankString] && self.length >= index) {
        return [self substringToIndex:index];
    }
    return @"";
}

@end

@implementation NSString (YYRPath)

- (NSString *)yyr_documentDirectory {
    return [NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES).firstObject stringByAppendingPathComponent:self];
}

- (NSString *)yyr_cacheDirecotry {
    return [NSSearchPathForDirectoriesInDomains(NSCachesDirectory, NSUserDomainMask, YES).firstObject stringByAppendingPathComponent:self];
}

- (NSString *)yyr_tmpDirectory {
    return [NSTemporaryDirectory() stringByAppendingPathComponent:self];
}

// 通过url.query获取参数字符 再分成字典
- (NSMutableDictionary *)getURLParameters {
    if (!self.length) {
        return nil;
    }
    NSMutableDictionary *params = [NSMutableDictionary dictionary];
    if ([self containsString:@"&"]) {
        NSArray *urlComponents = [self componentsSeparatedByString:@"&"];
        
        for(NSString *keyValuePair in urlComponents) {
            
            //生成key/value
            NSArray *pairComponents = [keyValuePair componentsSeparatedByString:@"="];
            NSString *key = [pairComponents.firstObject stringByRemovingPercentEncoding];
            NSString*value = [pairComponents.lastObject stringByRemovingPercentEncoding];
            
            //key不能为nil
            if(key == nil|| value == nil) continue;
            
            id existValue = [params valueForKey:key];
            if(existValue != nil) {
                // 已存在的值，生成数组。
                if([existValue isKindOfClass:[NSArray class]]) {
                    // 已存在的值生成数组
                    NSMutableArray *items = [NSMutableArray arrayWithArray:existValue];
                    [items addObject:value];
                    [params setValue:items forKey:key];
                } else {
                    //非数组
                    [params setValue:@[existValue,value]forKey:key];
                }
                
            } else {
                //设置值
                [params setValue:value forKey:key];
            }
            
        }
    } else {
        // 单个参数生成key/value
        NSArray *pairComponents = [self componentsSeparatedByString:@"="];
        if(pairComponents.count == 1) {
            return nil;
        }
        // 分隔值
        NSString *key = [pairComponents.firstObject stringByRemovingPercentEncoding];
        NSString *value = [pairComponents.lastObject stringByRemovingPercentEncoding];
        // key不能为nil
        if(key == nil|| value == nil) return nil;
        // 设置值
        [params setValue:value forKey:key];
        
    }
    return params;
}

@end

@implementation NSString (YYRBase64)

- (NSString *)yyr_base64encode {
    NSData *data = [self dataUsingEncoding:NSUTF8StringEncoding];
    
    return [data base64EncodedStringWithOptions:0];
}

- (NSString *)yyr_base64decode {
    NSData *data = [[NSData alloc] initWithBase64EncodedString:self options:0];
    
    return [[NSString alloc] initWithData:data encoding:NSUTF8StringEncoding];
}



@end

@implementation NSString (YYRTranscoding)

+ (NSString *)unicodeToISO88591:(NSString *)string {
    
    NSStringEncoding enc = CFStringConvertEncodingToNSStringEncoding(kCFStringEncodingISOLatin1);
    
    return [NSString stringWithCString:[string UTF8String] encoding:enc];
}

- (NSString *)URLEncodeString {
    NSCharacterSet *set = [NSCharacterSet URLQueryAllowedCharacterSet];
    NSString *encodedString = [self stringByAddingPercentEncodingWithAllowedCharacters:set];
    return encodedString;
}

// 判断是否有emoji
+ (BOOL)stringContainsEmoji:(NSString *)string {
    __block BOOL returnValue = NO;
    [string enumerateSubstringsInRange:NSMakeRange(0, [string length])
                               options:NSStringEnumerationByComposedCharacterSequences
                            usingBlock:^(NSString *substring, NSRange substringRange, NSRange enclosingRange, BOOL *stop) {
                                const unichar high = [substring characterAtIndex: 0];
                                
                                // Surrogate pair (U+1D000-1F9FF)
                                if (0xD800 <= high && high <= 0xDBFF) {
                                    const unichar low = [substring characterAtIndex: 1];
                                    const int codepoint = ((high - 0xD800) * 0x400) + (low - 0xDC00) + 0x10000;
                                    
                                    if (0x1D000 <= codepoint && codepoint <= 0x1F9FF){
                                        returnValue = YES;
                                    }
                                    
                                    // Not surrogate pair (U+2100-27BF)
                                } else {
                                    if (0x2100 <= high && high <= 0x27BF){
                                        returnValue = YES;
                                    }
                                }
                            }];
    return returnValue;
}

@end

@implementation NSString (YYRPinyin)

+ (NSString *)transformToPinyin:(NSString *)aString {
    //转成了可变字符串
    NSMutableString *str = [NSMutableString stringWithString:aString];
    CFStringTransform((CFMutableStringRef)str,NULL, kCFStringTransformMandarinLatin,NO);
    //再转换为不带声调的拼音
    CFStringTransform((CFMutableStringRef)str,NULL, kCFStringTransformStripDiacritics,NO);
    NSArray *pinyinArray = [str componentsSeparatedByString:@" "];
    NSMutableString *allString = [NSMutableString new];
    
    int count = 0;
    
    for (int  i = 0; i < pinyinArray.count; i++) {
        
        for(int i = 0; i < pinyinArray.count;i++) {
            if (i == count) {
                [allString appendString:@"#"];//区分第几个字母
            }
            [allString appendFormat:@"%@",pinyinArray[i]];
            
        }
        [allString appendString:@","];
        count ++;
        
    }
    
    NSMutableString *initialStr = [NSMutableString new];//拼音首字母
    
    for (NSString *s in pinyinArray) {
        if (s.length > 0) {
            
            [initialStr appendString:  [s substringToIndex:1]];
        }
    }
    
    [allString appendFormat:@"#%@",initialStr];
    [allString appendFormat:@",#%@",aString];
    
    return allString;
}


@end
