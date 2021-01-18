//
//  UIViewController+Alert.h
//  FangTong
//
//  Created by 优房网 on 2017/7/17.
//  Copyright © 2017年 优房网. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIViewController (Alert)

/// 只有中间有提示文字，1.5s后消失
- (void)alertWithMessage:(NSString *_Nullable)message;

/// message confirmTitle confirmBlock
- (void)alertWithMessage:(NSString *_Nullable)message confirmTitle:(NSString *_Nullable)confirmTitle confirmBlock:(void (^_Nullable)())confirmBlock;

/// 提示 我知道了
- (void)alertActionAlertMessage:(NSString *_Nullable)message;
- (void)alertActionAlertCenterMessage:(NSString *_Nullable)message;
/// 默认 我知道了 确认问题
- (void)alertActionAlertWithTitle:(NSString *_Nullable)title message:(NSString *_Nullable)message;

/// title message confirmTitle
- (void)alertActionAlertWithTitle:(NSString *_Nullable)title message:(NSString *_Nullable)message confirmTitle:(NSString *_Nullable)confirmTitle;

/// title message confirmTitle confirmBlock
- (void)alertActionAlertWithTitle:(NSString *_Nullable)title message:(NSString *_Nullable)message confirmTitle:(NSString *_Nullable)confirmTitle confirmBlock:(void (^_Nullable)())confirmBlock;

/// title message 默认确定、取消
- (void)alertConfirmCacellActionAlertWithTitle:(NSString *_Nullable)title message:(NSString *_Nullable)message;

- (void)alertWithActionSheetTitles:(NSArray *_Nullable)titles cancelStr:(NSString *_Nullable)cancelStr selectBlock:(void (^_Nullable)(NSInteger index, NSString * _Nullable selectStr))selectBlock;

- (void)alertWithActionSheetWithTitle:(NSString *)title titles:(NSArray *_Nullable)titles cancelStr:(NSString *_Nullable)cancelStr selectBlock:(void (^_Nullable)(NSInteger index, NSString * _Nullable selectStr))selectBlock;

- (void)alertConfirmCacellActionAlertWithTitle:(NSString *_Nullable)title
                                       message:(NSString *_Nullable)message
                              leftConfirmTitle:(NSString *_Nullable)leftConfirmTitle
                             rightConfirmTitle:(NSString *_Nullable)rightConfirmTitle
                               selectLeftBlock:(void (^_Nullable)())leftBlock
                              selectRightBlock:(void (^_Nullable)())rightBlock;

@end
