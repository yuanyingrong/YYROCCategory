//
//  UINavigationController+YYRAddition.h
//  test
//
//  Created by 袁应荣 on 2017/3/11.
//  Copyright © 2017年 袁应荣. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UINavigationController (YYRAddition)

/**
 自定义全屏拖拽返回手势
 */
@property (nonatomic, strong, readonly) UIPanGestureRecognizer *yyr_popGestureRecognizer;

@end
