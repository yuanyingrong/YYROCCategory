//
//  NSString+Regular.h
//  test
//
//  Created by 袁应荣 on 2017/3/11.
//  Copyright © 2017年 袁应荣. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSString (Regular)

/** 正则匹配手机号 */
+ (BOOL)checkTelNumber:(NSString *)telNumber;

/** 正则匹配用户密码6-18位数字和字母组合 */
+ (BOOL)checkPassword:(NSString *)password;

/** 正则匹配用户姓名,6位的中文或英文 */
+ (BOOL)checkUserName:(NSString *)userName;

/** 正则匹配用户身份证号 */
+ (BOOL)checkUserIdCard:(NSString *)idCard;


/**
 精确的身份证号码有效性检测

 @param value 身份证号码
 @return 是否有效
 */
+ (BOOL)accurateVerifyIDCardNumber:(NSString *)value;

@end
