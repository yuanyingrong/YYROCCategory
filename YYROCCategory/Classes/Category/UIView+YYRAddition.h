//
//  UIView+YYRAddition.h
//  FangTong
//
//  Created by 袁应荣 on 2017/12/20.
//  Copyright © 2017年 优房网. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIView (YYRAddition)

// 可以获取到父容器的控制器的方法,就是这个黑科技.
- (UIViewController *)getCurrentViewController;

- (UINavigationController *)getCurrentNavigationViewController;

@end
