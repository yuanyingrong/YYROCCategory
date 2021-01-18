//
//  UIView+YYRAddition.m
//  FangTong
//
//  Created by 袁应荣 on 2017/12/20.
//  Copyright © 2017年 优房网. All rights reserved.
//

#import "UIView+YYRAddition.h"

@implementation UIView (YYRAddition)

// 可以获取到父容器的控制器的方法,就是这个黑科技.
- (UIViewController *)getCurrentViewController {
    UIResponder *responder = self;
    // 循环获取下一个响应者,直到响应者是一个UIViewController类的一个对象为止,然后返回该对象.
    while ((responder = [responder nextResponder])) {
        if ([responder isKindOfClass:[UIViewController class]]) {
            return (UIViewController *)responder;
        }
    }
    return nil;
}

// 可以获取到父容器的控制器的方法,就是这个黑科技.
- (UINavigationController *)getCurrentNavigationViewController {
    UIResponder *responder = self;
    // 循环获取下一个响应者,直到响应者是一个UIViewController类的一个对象为止,然后返回该对象.
    while ((responder = [responder nextResponder])) {
        if ([responder isKindOfClass:[UINavigationController class]]) {
            return (UINavigationController *)responder;
        }
    }
    return nil;
}

@end
