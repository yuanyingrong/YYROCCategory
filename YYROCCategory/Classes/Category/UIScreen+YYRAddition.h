//
//  UIScreen+YYRAddition.h
//  test
//
//  Created by 袁应荣 on 2017/3/11.
//  Copyright © 2017年 袁应荣. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIScreen (YYRAddition)


/**
 屏幕宽度

 @return 屏幕宽度
 */
+ (CGFloat)yyr_screenWidth;

/**
 屏幕高度

 @return 屏幕高度
 */
+ (CGFloat)yyr_screenHeight;

/**
 分辨率

 @return 分辨率
 */
+ (CGFloat)yyr_scale;


@end
