//
//  NSString+YYRAddition.h
//  test
//
//  Created by 袁应荣 on 2017/3/11.
//  Copyright © 2017年 袁应荣. All rights reserved.
//

//从后台接收到<null>时给属性赋值为"000",避免程序崩溃
#import <Foundation/Foundation.h>

@interface NSString (safeSetter)

- (NSString *)safeSetValue;
- (NSString *)replaceNullValue;

@end
