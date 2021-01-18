//
//  UIImage+YYRAddition.m
//  test
//
//  Created by 袁应荣 on 2017/3/11.
//  Copyright © 2017年 袁应荣. All rights reserved.
//

#import "UIImage+YYRAddition.h"

@implementation UIImage (YYRAddition)

+ (UIImage *)yyr_singleDotImageWithColor:(UIColor *)color {
    
    UIGraphicsBeginImageContextWithOptions(CGSizeMake(1, 1), YES, 0);
    
    [color setFill];
    UIRectFill(CGRectMake(0, 0, 1, 1));
    
    UIImage *result = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    
    return result;
}

@end
