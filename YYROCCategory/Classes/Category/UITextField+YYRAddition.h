//
//  UITextField+YYRAddition.h
//  test
//
//  Created by 袁应荣 on 2017/3/11.
//  Copyright © 2017年 袁应荣. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UITextField (YYRAddition)

/**
 实例化 UITextField

 @param placeHolder 占位文本
 @return UITextField
 */
+ (nonnull instancetype)yyr_textFieldWithPlaceHolder:(nonnull NSString *)placeHolder;

@end
