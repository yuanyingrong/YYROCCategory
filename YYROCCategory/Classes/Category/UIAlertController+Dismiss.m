//
//  UIAlertController+Dismiss.m
//  FangTong
//
//  Created by 优房网 on 2017/6/6.
//  Copyright © 2017年 优房网. All rights reserved.
//

#import "UIAlertController+Dismiss.h"
#import <objc/runtime.h>
static const void *TapKey = &TapKey;

@implementation UIAlertController (Dismiss)

- (void)addTapDisMissAction {
    
    if ([[UIDevice currentDevice].systemVersion floatValue] >= 9.0) {
        [self yyr_findView];
    }
}

- (void)yyr_findView {
    self.yyr_tap = [[UITapGestureRecognizer alloc]initWithTarget:self action:@selector(tapAction:)];
    self.yyr_tap.delegate = self;
    [[UIApplication sharedApplication].keyWindow addGestureRecognizer:self.yyr_tap];
}

- (BOOL)gestureRecognizer:(UIGestureRecognizer *)gestureRecognizer shouldRecognizeSimultaneouslyWithGestureRecognizer:(UIGestureRecognizer *)otherGestureRecognizer {
    return YES;
}

-(void)tapAction:(UITapGestureRecognizer *)tapGesture{
//    [self dismissViewControllerAnimated:YES completion:nil];
    CGRect r = self.view.frame;
    CGPoint p = [self.view convertPoint:[tapGesture locationInView:self.view] toView:[UIApplication sharedApplication].keyWindow];
    if (!CGRectContainsPoint(r,p)) {
        [self dismissViewControllerAnimated:YES completion:nil];
    }
}


- (UITapGestureRecognizer *)yyr_tap {
    return objc_getAssociatedObject(self, TapKey);
}

- (void)setYyr_tap:(UITapGestureRecognizer *)yyr_tap {
    objc_setAssociatedObject(self, TapKey, yyr_tap, OBJC_ASSOCIATION_RETAIN_NONATOMIC);
}



- (void)dealloc {
    [[UIApplication sharedApplication].keyWindow removeGestureRecognizer:self.yyr_tap];
}


@end
