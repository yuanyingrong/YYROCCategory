//
//  UITabBar+Badge.h
//  FangTong
//
//  Created by 袁应荣 on 2017/12/21.
//  Copyright © 2017年 优房网. All rights reserved.
//

#import <UIKit/UIKit.h>


@interface UITabBar ()

/** badge */
@property (assign, nonatomic) NSInteger badge;

@end

@interface UITabBar (Badge)

- (void)showBadgeOnMessage;
- (void)showBadgeOnIndex:(NSInteger)index badgeCount:(NSInteger)bagdeCount;

- (void)hideBadgeOnMessage;
- (void)hideBadgeOnIndex:(NSInteger)index;

@property(nonatomic,assign) CGSize badgeSize; //小红点size
@property(nonatomic,strong)UIImage *badgeImage; //小红点图片
@property(nonatomic,strong)UIColor *badgeColor; //小红点颜色
//显示小红点
- (void)showBadgeOnItemIndex:(NSUInteger )index;
//隐藏小红点
- (void)hiddenRedPointOnIndex:(NSUInteger )index animation:(BOOL )animation;


@end
