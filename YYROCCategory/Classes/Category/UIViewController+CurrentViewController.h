//
//  UIViewController+CurrentViewController.h
//  FangTong
//
//  Created by 袁应荣 on 2017/9/21.
//  Copyright © 2017年 优房网. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIViewController (CurrentViewController)


/**
 获取Window当前显示的ViewController

 @return VC
 */
+ (UIViewController *)currentViewController;


/**
 根据控制器名pop回指定页面

 @param ctrlClassName 控制器类名
 @param animated animated
 */
- (void)backToController:(NSString *)ctrlClassName animated:(BOOL)animated;

@end
