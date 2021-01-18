//
//  UIColor+YYRAddition.m
//  test
//
//  Created by 袁应荣 on 2017/3/11.
//  Copyright © 2017年 袁应荣. All rights reserved.
//

#import "UIColor+YYRAddition.h"

@implementation UIColor (YYRAddition)

+ (instancetype)yyr_colorWithHex:(uint32_t)hex {
    
    uint8_t r = (hex & 0xff0000) >> 16;
    uint8_t g = (hex & 0x00ff00) >> 8;
    uint8_t b = hex & 0x0000ff;
    
    return [self yyr_colorWithRed:r green:g blue:b];
}

/**
 *  返回随机颜色
 */
+ (instancetype)yyr_randomColor {
    
    return [UIColor yyr_colorWithRed:arc4random_uniform(256) green:arc4random_uniform(256) blue:arc4random_uniform(256)];
}

/**
 *  传入RGB的值返回颜色
 */
+ (instancetype)yyr_colorWithRed:(uint8_t)red green:(uint8_t)green blue:(uint8_t)blue {
    
    return [UIColor colorWithRed:red / 255.0 green:green / 255.0 blue:blue / 255.0 alpha:1.0];
}

+ (instancetype)yyr_colorWithHexString:(NSString *)hexString {
    // 删除字符串中的空格,并转换为大写
    NSString *colorString = [[hexString stringByTrimmingCharactersInSet:[NSCharacterSet whitespaceAndNewlineCharacterSet]] uppercaseString];
    
    if (colorString.length < 6) { // 非法字符串，返回clearColor
        return [UIColor clearColor];
    }
    
    if ([colorString hasPrefix:@"0X"]) { // 以"0X"开头（从下标为2开始截取）
        colorString = [colorString substringFromIndex:2];
    }
    
    if ([colorString hasPrefix:@"#"]) { // 以"#"开头 (下标为1开始截取)
        colorString = [colorString substringFromIndex:1];
    }
    
    // 截取完如果字符串长度不为6(非法)返回clearColor
    if (colorString.length != 6) {
        return [UIColor clearColor];
    }
    
    // 依次取出r/g/b字符串
    NSRange range;
    range.location = 0;
    range.length = 2;
    // r
    NSString *rString = [colorString substringWithRange:range];
    
    // g
    range.location = 2;
    NSString *gString = [colorString substringWithRange:range];
    
    // b
    range.location = 4;
    NSString *bString = [colorString substringWithRange:range];
    
    // 转换为数值
    unsigned int r, g, b;
    [[NSScanner scannerWithString:rString] scanHexInt:&r];
    [[NSScanner scannerWithString:gString] scanHexInt:&g];
    [[NSScanner scannerWithString:bString] scanHexInt:&b];
    
    // 返回对应颜色
    return [UIColor colorWithRed:(float)r / 255.0 green:(float)g / 255.0 blue:(float)b / 255.0 alpha:1.0];
    
}

+ (instancetype)yyr_colorWithHexString:(NSString *)hexString alpha:(CGFloat)alpha {
    
    return [[self yyr_colorWithHexString:hexString] colorWithAlphaComponent:alpha];
}


#pragma mark - 颜色值
- (u_int8_t)yyr_redValue {
    return (u_int8_t)(CGColorGetComponents(self.CGColor)[0] * 255);
}

- (u_int8_t)yyr_greenValue {
    return (u_int8_t)(CGColorGetComponents(self.CGColor)[1] * 255);
}

- (u_int8_t)yyr_blueValue {
    return (u_int8_t)(CGColorGetComponents(self.CGColor)[2] * 255);
}

- (CGFloat)yyr_alphaValue {
    return CGColorGetComponents(self.CGColor)[3];
}



@end
