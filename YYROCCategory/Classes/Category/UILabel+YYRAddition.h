//
//  UILabel+YYRAddition.h
//  test
//
//  Created by 袁应荣 on 2017/3/11.
//  Copyright © 2017年 袁应荣. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UILabel (YYRAddition)


/**
 实例化 UILabel

 @param text text
 @return UILabel 默认字体 14，默认颜色 [UIColor darkGrayColor]，默认对齐方式 Left
 */
+ (nonnull instancetype)yyr_labelWithText:(nullable NSString *)text;

/**
 实例化 UILabel

 @param text text
 @param fontSize fontSize
 @return UILabel 默认颜色 [UIColor darkGrayColor]，默认对齐方式 Left
 */
+ (nonnull instancetype)yyr_labelWithText:(nullable NSString *)text fontSize:(CGFloat)fontSize;


/**
 实例化 UILabel

 @param text text
 @param fontSize fontSize
 @param textColor textColor
 @return UILabel 默认对齐方式 Left
 */
+ (nonnull instancetype)yyr_labelWithText:(nullable NSString *)text
                                fontSize:(CGFloat)fontSize
                               textColor:(nonnull UIColor *)textColor;

/**
 实例化 UILabel

 @param text text
 @param fontSize fontSize
 @param textColor textColor
 @param alignment alignment
 @return UILabel
 */
+ (nonnull instancetype)yyr_labelWithText:(nullable NSString *)text
                                fontSize:(CGFloat)fontSize
                               textColor:(nonnull UIColor *)textColor
                               alignment:(NSTextAlignment)alignment;

+ (CGFloat)getWidthWithTitle:(NSString *_Nullable)title font:(UIFont *_Nonnull)font;

@end
