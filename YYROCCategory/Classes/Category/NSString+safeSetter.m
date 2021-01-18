//
//  NSString+YYRAddition.h
//  test
//
//  Created by 袁应荣 on 2017/3/11.
//  Copyright © 2017年 袁应荣. All rights reserved.
//

#import "NSString+safeSetter.h"

@implementation NSString (safeSetter)

- (NSString *)safeSetValue {

    if (!self || [self isEqual:[NSNull null]] || [self isEqualToString:@"<null>"]) {
        
        return @"";
    } else {
        
        return self;
    }
}

///处理字符串
- (NSString *)replaceNullValue{
    
    NSString * newStr = [NSString stringWithFormat:@"%@",self];
    if ([newStr isKindOfClass:[NSNull class]] ||
        newStr == nil ||
        [newStr isEqualToString:@"(null)"]||
        [newStr isEqualToString:@""] ||
        [newStr isEqualToString:@"null"] ||
        [newStr isEqualToString:@"<null>"] ||
        newStr.length == 0) {
        newStr = @"";
    }
    return newStr;
}

@end
