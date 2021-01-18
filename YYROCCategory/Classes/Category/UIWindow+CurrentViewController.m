//
//  UIWindow+CurrentViewController.m
//  FangTong
//
//  Created by 袁应荣 on 2019/7/3.
//  Copyright © 2019 优房网. All rights reserved.
//

#import "UIWindow+CurrentViewController.h"

@implementation UIWindow (CurrentViewController)

+ (UIViewController*)yyr_currentViewController {
    UIWindow *window = [[UIApplication sharedApplication].delegate window];
    UIViewController *topViewController = [window rootViewController];
    while (true) {
        if (topViewController.presentedViewController) {
            topViewController = topViewController.presentedViewController;
        } else if ([topViewController isKindOfClass:[UINavigationController class]] && [(UINavigationController*)topViewController topViewController]) {
            topViewController = [(UINavigationController *)topViewController topViewController];
        } else if ([topViewController isKindOfClass:[UITabBarController class]]) {
            UITabBarController *tab = (UITabBarController *)topViewController;
            topViewController = tab.selectedViewController;
        } else {
            break;
        }
    }
    return topViewController;
}

@end
