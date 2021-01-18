//
//  UIViewController+CurrentViewController.m
//  FangTong
//
//  Created by 袁应荣 on 2017/9/21.
//  Copyright © 2017年 优房网. All rights reserved.
//

#import "UIViewController+CurrentViewController.h"

@implementation UIViewController (CurrentViewController)

// 获取Window当前显示的ViewController
+ (UIViewController *)currentViewController {
    //获得当前活动窗口的根视图
    UIViewController* vc = [UIApplication sharedApplication].keyWindow.rootViewController;
    while (1) {
        //根据不同的页面切换方式，逐步取得最上层的viewController
        if ([vc isKindOfClass:[UITabBarController class]]) {
            vc = ((UITabBarController*)vc).selectedViewController;
        }
        if ([vc isKindOfClass:[UINavigationController class]]) {
            vc = ((UINavigationController*)vc).visibleViewController;
        }
        if (vc.presentedViewController) {
            vc = vc.presentedViewController;
        }else{
            break;
        }
    }
    return vc;
}

// pop回指定页面
- (void)backToController:(NSString *)ctrlClassName animated:(BOOL)animated {
    if (self.navigationController) {
        NSArray *controllers = self.navigationController.viewControllers;
        NSArray *result = [controllers filteredArrayUsingPredicate:[NSPredicate predicateWithBlock:^BOOL(id  _Nullable evaluatedObject, NSDictionary<NSString *,id> * _Nullable bindings) {
            return [evaluatedObject isKindOfClass:NSClassFromString(ctrlClassName)];
        }]];
        
        if (result.count > 0) {
            [self.navigationController popToViewController:result[0] animated:animated];
        }
    }
}

@end
