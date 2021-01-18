//
//  UIView+Alert.h
//  FangTong
//
//  Created by 袁应荣 on 2018/4/9.
//  Copyright © 2018年 优房网. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIView (Alert)

- (void)alertActionAlertWithTitle:(NSString *)title message:(NSString *)message;

- (void)alertActionAlertWithTitle:(NSString *)title message:(NSString *)message confirmTitle:(NSString *)confirmTitle;

- (void)alertConfirmCacellActionAlertWithTitle:(NSString *_Nullable)title
                                      message:(NSString *_Nullable)message
                             leftConfirmTitle:(NSString *_Nullable)leftConfirmTitle
                            rightConfirmTitle:(NSString *_Nullable)rightConfirmTitle
                              selectLeftBlock:(void (^_Nullable)())leftBlock
                             selectRightBlock:(void (^_Nullable)())rightBlock;

@end
