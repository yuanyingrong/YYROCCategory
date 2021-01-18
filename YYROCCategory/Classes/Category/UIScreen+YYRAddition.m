//
//  UIScreen+YYRAddition.m
//  test
//
//  Created by 袁应荣 on 2017/3/11.
//  Copyright © 2017年 袁应荣. All rights reserved.
//

#import "UIScreen+YYRAddition.h"

@implementation UIScreen (YYRAddition)

+ (CGFloat)yyr_screenWidth {
    return [UIScreen mainScreen].bounds.size.width;
}

+ (CGFloat)yyr_screenHeight {
    return [UIScreen mainScreen].bounds.size.height;
}

+ (CGFloat)yyr_scale {
    return [UIScreen mainScreen].scale;
}

@end
