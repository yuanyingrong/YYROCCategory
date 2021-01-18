//
//  UIImage+YYRAddition.h
//  test
//
//  Created by 袁应荣 on 2017/3/11.
//  Copyright © 2017年 袁应荣. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIImage (YYRAddition)

/**
 生成指定颜色的一个`点`的图像

 @param color 颜色
 @return 1 * 1 图像
 */
+ (nonnull UIImage *)yyr_singleDotImageWithColor:(nonnull UIColor *)color;


@end
