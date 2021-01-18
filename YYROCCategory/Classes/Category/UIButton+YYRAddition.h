//
//  UIButton+YYRAddition.h
//  test
//
//  Created by 袁应荣 on 2017/3/11.
//  Copyright © 2017年 袁应荣. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIButton (YYRAddition)

/**
 * 快速创建一个没有图片的按钮
 */
+ (nonnull instancetype)yyr_buttonWithTitle:(nonnull NSString *)title textColor:(nonnull UIColor *)color andSize:(CGFloat)fontsize;

/**
 * 快速创建带有图片的按钮
 */
+ (nonnull instancetype)yyr_buttonWithTitle:(nonnull NSString *)title image:(nonnull UIImage *)normalImage andHighLight:(nonnull UIImage *)highLightImage;

/**
 实例化 UIButton

 @param title title
 @param fontSize fontSize
 @param textColor textColor
 @return UIButton
 */
+ (nonnull instancetype)yyr_buttonWithTitle:(nullable NSString *)title
                                  fontSize:(CGFloat)fontSize
                                 textColor:(nonnull UIColor *)textColor;


/**
 实例化 UIButton

 @param attributedText attributedText
 @return UIButton
 */
+ (nonnull instancetype)yyr_buttonWithAttributedText:(nullable NSAttributedString *)attributedText;


/**
 实例化 UIButton

 @param imageName imageName
 @param highlightSuffix highlightSuffix
 @return UIButton
 */
+ (nonnull instancetype)yyr_buttonWithImageName:(nullable NSString *)imageName
                               highlightSuffix:(nullable NSString *)highlightSuffix;

/**
 实例化 UIButton

 @param imageName imageName
 @param backImageName backImageName
 @param highlightSuffix highlightSuffix
 @return UIButton
 */
+ (nonnull instancetype)yyr_buttonWithImageName:(nullable NSString *)imageName
                                 backImageName:(nullable NSString *)backImageName
                               highlightSuffix:(nullable NSString *)highlightSuffix;


/**
 实例化 UIButton

 @param title title
 @param fontSize fontSize
 @param textColor textColor
 @param imageName imageName
 @param backImageName backImageName
 @param highlightSuffix highlightSuffix
 @return UIButton
 */
+ (nonnull instancetype)yyr_buttonWithTitle:(nullable NSString *)title
                                  fontSize:(CGFloat)fontSize
                                 textColor:(nonnull UIColor *)textColor
                                 imageName:(nullable NSString *)imageName
                             backImageName:(nullable NSString *)backImageName
                           highlightSuffix:(nullable NSString *)highlightSuffix;

/**
 实例化 UIButton

 @param attributedText attributedText
 @param imageName imageName
 @param backImageName backImageName
 @param highlightSuffix highlightSuffix
 @return UIButton
 */
+ (nonnull instancetype)yyr_buttonWithAttributedText:(nullable NSAttributedString *)attributedText
                                          imageName:(nullable NSString *)imageName
                                      backImageName:(nullable NSString *)backImageName
                                    highlightSuffix:(nullable NSString *)highlightSuffix;


@end
