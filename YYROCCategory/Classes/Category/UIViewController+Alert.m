//
//  UIViewController+Alert.m
//  FangTong
//
//  Created by 优房网 on 2017/7/17.
//  Copyright © 2017年 优房网. All rights reserved.
//

#import "UIViewController+Alert.h"
#import "NSString+YYRAddition.h"
#import "UIAlertController+Dismiss.h"

#define COLOR(hex) [UIColor colorWithRed:((hex&0xff0000)>>16)/255.0 green:((hex&0x00ff00)>>8)/255.0 blue:((hex&0xff)>>0)/255.0 alpha:1]
@implementation UIViewController (Alert)

- (void)alertWithMessage:(NSString *)message {
    NSMutableAttributedString *attr = [[NSMutableAttributedString alloc] initWithString:message ? message : @"" attributes:@{NSFontAttributeName : [UIFont boldSystemFontOfSize:18], NSForegroundColorAttributeName: COLOR(0xFFFFFF)}];
    //初始化提示框
    UIAlertController *alertController = [UIAlertController alertControllerWithTitle:nil message:message preferredStyle:UIAlertControllerStyleAlert];
    [alertController setValue:attr forKey:@"attributedMessage"];
    UIView *subView = alertController.view.subviews.firstObject.subviews.firstObject;
    subView.backgroundColor = [UIColor darkGrayColor];
    UIView *alertContentView = subView.subviews.firstObject;
    alertContentView.backgroundColor = [UIColor darkGrayColor];
    [self presentViewController:alertController animated:YES completion:nil];
    
    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(1.5 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
        
        [self dismissViewControllerAnimated:YES completion:nil];
    });
}

- (void)alertWithMessage:(NSString *)message confirmTitle:(NSString * _Nullable)confirmTitle confirmBlock:(void (^ _Nullable)())confirmBlock {
    
     NSMutableAttributedString *attr = [[NSMutableAttributedString alloc] initWithString:message attributes:@{NSFontAttributeName : [UIFont systemFontOfSize:16], NSForegroundColorAttributeName: COLOR(0x334A60)}];
    //初始化提示框
    UIAlertController *alertController = [UIAlertController alertControllerWithTitle:nil message:message preferredStyle:UIAlertControllerStyleAlert];
    [alertController setValue:attr forKey:@"attributedMessage"];
    UIAlertAction *confirmAction = [UIAlertAction actionWithTitle:confirmTitle style:UIAlertActionStyleDefault handler:^(UIAlertAction * _Nonnull action) {
        if (confirmBlock) {
            confirmBlock();
        }
    }];
    [alertController addAction:confirmAction];
    [self presentViewController:alertController animated:YES completion:nil];
}

- (void)alertActionAlertMessage:(NSString *)message {
    [self alertActionAlertWithTitle:@"提示" message:message];
}

- (void)alertActionAlertCenterMessage:(NSString *)message {
    [self alertActionAlertWithTitle:@"提示" message:message confirmTitle:@"我知道了" alignment:NSTextAlignmentCenter];
}

- (void)alertActionAlertWithTitle:(NSString *)title message:(NSString *)message {
    
    [self alertActionAlertWithTitle:title message:message confirmTitle:@"我知道了"];
}

- (void)alertActionAlertWithTitle:(NSString *)title message:(NSString *)message confirmTitle:(NSString *)confirmTitle {
    
    [self alertActionAlertWithTitle:title message:message confirmTitle:confirmTitle alignment:NSTextAlignmentLeft];
}

- (void)alertActionAlertWithTitle:(NSString *)title message:(NSString *)message confirmTitle:(NSString *)confirmTitle alignment:(NSTextAlignment)alignment {
    
    NSMutableParagraphStyle *paragraphStyle = [[NSMutableParagraphStyle alloc] init];
    paragraphStyle.alignment = alignment;
    NSMutableAttributedString *attr = [[NSMutableAttributedString alloc] initWithString:message ? message : @"" attributes:@{NSFontAttributeName : [UIFont systemFontOfSize:16], NSForegroundColorAttributeName: COLOR(0x334A60),NSParagraphStyleAttributeName : paragraphStyle}];
    //初始化提示框
    UIAlertController *alertController = [UIAlertController alertControllerWithTitle:title message:message preferredStyle:UIAlertControllerStyleAlert];
    [alertController setValue:attr forKey:@"attributedMessage"];
    UIAlertAction *confirmAction = [UIAlertAction actionWithTitle:confirmTitle style:UIAlertActionStyleDefault handler:^(UIAlertAction * _Nonnull action) {
    }];
    [alertController addAction:confirmAction];
    [self presentViewController:alertController animated:YES completion:nil];
}

- (void)alertActionAlertWithTitle:(NSString *)title message:(NSString *)message confirmTitle:(NSString *)confirmTitle confirmBlock:(void (^ _Nullable)())confirmBlock {
    
    NSMutableParagraphStyle *paragraphStyle = [[NSMutableParagraphStyle alloc] init];
    paragraphStyle.alignment = NSTextAlignmentLeft;
    NSMutableAttributedString *attr = [[NSMutableAttributedString alloc] initWithString:message ? message : @"" attributes:@{NSFontAttributeName : [UIFont systemFontOfSize:16], NSForegroundColorAttributeName: COLOR(0x334A60),NSParagraphStyleAttributeName : paragraphStyle}];
    //初始化提示框
    UIAlertController *alertController = [UIAlertController alertControllerWithTitle:title message:message preferredStyle:UIAlertControllerStyleAlert];
    [alertController setValue:attr forKey:@"attributedMessage"];
    UIAlertAction *confirmAction = [UIAlertAction actionWithTitle:confirmTitle style:UIAlertActionStyleDefault handler:^(UIAlertAction * _Nonnull action) {
        if (confirmBlock) {
            confirmBlock();
        }
    }];
    [alertController addAction:confirmAction];
    [self presentViewController:alertController animated:YES completion:nil];
}

- (void)alertConfirmCacellActionAlertWithTitle:(NSString *)title message:(NSString *)message {
    [self alertConfirmCacellActionAlertWithTitle:title message:message leftConfirmTitle:@"取消" rightConfirmTitle:@"确定" selectLeftBlock:^{
        
    } selectRightBlock:^{
        [self dismissViewControllerAnimated:YES completion:nil];
        [self.navigationController popViewControllerAnimated:YES];
    }];
}

- (void)alertConfirmCacellActionAlertWithTitle:(NSString *_Nullable)title message:(NSString *_Nullable)message leftConfirmTitle:(NSString *_Nullable)leftConfirmTitle rightConfirmTitle:(NSString *_Nullable)rightConfirmTitle selectLeftBlock:(void (^_Nullable)())leftBlock selectRightBlock:(void (^_Nullable)())rightBlock {
    
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
   
    [self presentViewController:alertController animated:YES completion:nil];
}


- (void)alertWithActionSheetTitles:(NSArray *)titles cancelStr:(NSString *)cancelStr selectBlock:(void (^)(NSInteger, NSString * _Nullable))selectBlock {
    UIAlertController *alertController = [UIAlertController alertControllerWithTitle:nil message:nil preferredStyle:UIAlertControllerStyleActionSheet];
    alertController.view.tintColor = COLOR(0x334A60);
    [alertController addTapDisMissAction];
    
    for (NSInteger i = 0; i < titles.count; i++) {
        UIAlertAction *action = [UIAlertAction actionWithTitle:titles[i] style:UIAlertActionStyleDefault handler:^(UIAlertAction * _Nonnull action) {
            
            if (selectBlock) {
                selectBlock(i,action.title);
            }
        }];
        
        [alertController addAction:action];
    }
    
    if (cancelStr) {
        UIAlertAction *action = [UIAlertAction actionWithTitle:cancelStr style:UIAlertActionStyleDestructive handler:nil];
        [alertController addAction:action];
    }
    
    [self presentViewController:alertController animated:YES completion:nil];
}

- (void)alertWithActionSheetWithTitle:(NSString *)title titles:(NSArray *)titles cancelStr:(NSString *)cancelStr selectBlock:(void (^)(NSInteger, NSString * _Nullable))selectBlock {
    UIAlertController *alertController = [UIAlertController alertControllerWithTitle:title message:nil preferredStyle:UIAlertControllerStyleActionSheet];
    alertController.view.tintColor = COLOR(0x334A60);
    [alertController addTapDisMissAction];
    
    for (NSInteger i = 0; i < titles.count; i++) {
        UIAlertAction *action = [UIAlertAction actionWithTitle:titles[i] style:UIAlertActionStyleDefault handler:^(UIAlertAction * _Nonnull action) {
            
            if (selectBlock) {
                selectBlock(i,action.title);
            }
        }];
        
        [alertController addAction:action];
    }
    
    if (cancelStr) {
        UIAlertAction *action = [UIAlertAction actionWithTitle:cancelStr style:UIAlertActionStyleCancel handler:nil];
        [alertController addAction:action];
    }
    
    [self presentViewController:alertController animated:YES completion:nil];
}

@end
