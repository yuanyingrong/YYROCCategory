//
//  UIView+Alert.m
//  FangTong
//
//  Created by 袁应荣 on 2018/4/9.
//  Copyright © 2018年 优房网. All rights reserved.
//

#import "UIView+Alert.h"

#define COLOR(hex) [UIColor colorWithRed:((hex&0xff0000)>>16)/255.0 green:((hex&0x00ff00)>>8)/255.0 blue:((hex&0xff)>>0)/255.0 alpha:1]
@implementation UIView (Alert)

- (void)alertActionAlertWithTitle:(NSString *)title message:(NSString *)message {
    
    [self alertActionAlertWithTitle:title message:message confirmTitle:@"我知道了"];
}

- (void)alertActionAlertWithTitle:(NSString *)title message:(NSString *)message confirmTitle:(NSString *)confirmTitle {
    
    NSMutableAttributedString *attr = [[NSMutableAttributedString alloc] initWithString:message ? message : @"" attributes:@{NSFontAttributeName : [UIFont systemFontOfSize:16], NSForegroundColorAttributeName: COLOR(0x334A60)}];
    //初始化提示框
    UIAlertController *alertController = [UIAlertController alertControllerWithTitle:title message:message preferredStyle:UIAlertControllerStyleAlert];
    [alertController setValue:attr forKey:@"attributedMessage"];
    UIAlertAction *confirmAction = [UIAlertAction actionWithTitle:confirmTitle style:UIAlertActionStyleDefault handler:^(UIAlertAction * _Nonnull action) {
    }];
    [alertController addAction:confirmAction];
    UIResponder *responder = self;
    UIViewController *viewController;
    while ((responder = [responder nextResponder]))
        if ([responder isKindOfClass: [UIViewController class]])
            viewController = (UIViewController *)responder;
    [viewController presentViewController:alertController animated:YES completion:nil];
}

- (void)alertConfirmCacellActionAlertWithTitle:(NSString *)title message:(NSString *)message leftConfirmTitle:(NSString *)leftConfirmTitle rightConfirmTitle:(NSString *)rightConfirmTitle selectLeftBlock:(void (^)())leftBlock selectRightBlock:(void (^)())rightBlock {
    
    UIAlertController *alertController = [UIAlertController alertControllerWithTitle:nil message:nil preferredStyle:UIAlertControllerStyleAlert];
    
    // 改变title的大小和颜色
    NSMutableAttributedString *titleAttr = [[NSMutableAttributedString alloc] initWithString:title];
    [titleAttr addAttribute:NSFontAttributeName value:[UIFont systemFontOfSize:16] range:NSMakeRange(0, title.length)];
    [titleAttr addAttribute:NSForegroundColorAttributeName value:COLOR(0x334A60) range:NSMakeRange(0, title.length)];
    [alertController setValue:titleAttr forKey:@"attributedTitle"];
    
    // 改变message的大小和颜色
    NSMutableParagraphStyle *paragraphStyle = [[NSMutableParagraphStyle alloc] init];
    paragraphStyle.alignment = NSTextAlignmentCenter;
    
    NSMutableAttributedString *messageAttr = [[NSMutableAttributedString alloc]
                                              initWithString:[NSString stringWithFormat:@"\n%@",message]
                                              attributes:@{
                                                  NSFontAttributeName : [UIFont systemFontOfSize:14],
                                                  NSForegroundColorAttributeName: COLOR(0x334A60),
                                                  NSParagraphStyleAttributeName: paragraphStyle}];
    [alertController setValue:messageAttr forKey:@"attributedMessage"];
    
    UIAlertAction *leftAction = [UIAlertAction actionWithTitle:leftConfirmTitle style:UIAlertActionStyleDefault handler:^(UIAlertAction * _Nonnull action) {
        
        if (leftBlock) leftBlock();
    }];
    //    if (iOS9Later) { // 适配iOS8
    //        // 修改按钮
    //        [leftAction setValue:COLOR(0x74A4FE) forKey:@"titleTextColor"];
    //    }
    
    [alertController addAction:leftAction];
    
    UIAlertAction *rightAction = [UIAlertAction actionWithTitle:rightConfirmTitle style:UIAlertActionStyleDefault handler:^(UIAlertAction * _Nonnull action) {
        
        if (rightBlock) rightBlock();
        
    }];
    [alertController addAction:rightAction];
    UIResponder *responder = self;
    UIViewController *viewController;
    while ((responder = [responder nextResponder]))
        if ([responder isKindOfClass: [UIViewController class]])
            viewController = (UIViewController *)responder;
    [viewController presentViewController:alertController animated:YES completion:nil];
}

@end
