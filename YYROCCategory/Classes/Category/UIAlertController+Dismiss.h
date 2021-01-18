//
//  UIAlertController+Dismiss.h
//  FangTong
//
//  Created by 优房网 on 2017/6/6.
//  Copyright © 2017年 优房网. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIAlertController (Dismiss)<UIGestureRecognizerDelegate>

@property (nonatomic,strong) UITapGestureRecognizer *yyr_tap;


/**
 点击屏幕其他地方消失
 */
- (void)addTapDisMissAction;

@end
