//
//  NSArray+Log.m
//  字典和数组中文输出问题
//
//  Created by 袁应荣 on 10/27/16.
//  Copyright © 2016 yyr. All rights reserved.
//

#import "NSArray+Log.h"

@implementation NSArray (Log)

- (NSString *)descriptionWithLocale:(id)locale
{
    // 创建可变字符串
    NSMutableString *stringM = [NSMutableString string];
    
    // 拼接开头
    [stringM appendString:@"(\n"];
    
    // 遍历出元素,拼接中间的内容部分
    [self enumerateObjectsUsingBlock:^(id  _Nonnull obj, NSUInteger idx, BOOL * _Nonnull stop) {
        
        [stringM appendFormat:@"\t%@,\n",obj];
    }];
    
    //拼接结尾
    [stringM appendString:@")\n"];
    
    return stringM;
}

@end


@implementation NSDictionary (Log)

- (NSString *)descriptionWithLocale:(id)locale
{
    // 创建可变字符串
    NSMutableString *stringM = [NSMutableString string];
    
    // 拼接开头
    [stringM appendString:@"{\n"];
    
    // 遍历出元素,拼接中间的内容部分
    [self enumerateKeysAndObjectsUsingBlock:^(id  _Nonnull key, id  _Nonnull obj, BOOL * _Nonnull stop) {
        
        [stringM appendFormat:@"\t%@ = %@;\n",key,obj];
    }];
    
    // 拼接结尾
    [stringM appendString:@"}\n"];
    
    return stringM;
}


@end
