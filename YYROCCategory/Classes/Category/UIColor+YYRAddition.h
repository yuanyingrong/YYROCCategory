//
//  UIColor+YYRAddition.h
//  test
//
//  Created by 袁应荣 on 2017/3/11.
//  Copyright © 2017年 袁应荣. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIColor (YYRAddition)

/**
 使用 16 进制数字创建颜色，例如 0xFF0000 创建红色

 @param hex 16 进制无符号32位整数
 @return 颜色
 */
+ (instancetype)yyr_colorWithHex:(uint32_t)hex;

/**
 生成随机颜色

 @return 随机颜色
 */
+ (instancetype)yyr_randomColor;

/**
 使用 R / G / B 数值创建颜色
 
 @param red red
 @param green green
 @param blue blue
 @return 颜色
 */
+ (instancetype)yyr_colorWithRed:(uint8_t)red green:(uint8_t)green blue:(uint8_t)blue;


/**
 根据16进制字符串返回对应颜色

 @param hexString 16进制字符串
 @return 颜色
 */
+ (instancetype)yyr_colorWithHexString:(NSString *)hexString;


/**
 根据16进制字符串返回对应颜色 带透明参数

 @param hexString 16进制字符串
 @param alpha 透明参数
 @return 颜色
 */
+ (instancetype)yyr_colorWithHexString:(NSString *)hexString alpha:(CGFloat)alpha;

#pragma mark - 颜色值
/// 返回当前颜色的 red 的 0～255 值
- (u_int8_t)yyr_redValue;
/// 返回当前颜色的 green 的 0～255 值
- (u_int8_t)yyr_greenValue;
/// 返回当前颜色的 blue 的 0～255 值
- (u_int8_t)yyr_blueValue;
/// 返回当前颜色的 alpha 值
- (CGFloat)yyr_alphaValue;

@end
