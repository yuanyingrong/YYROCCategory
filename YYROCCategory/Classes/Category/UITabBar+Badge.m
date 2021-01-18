//
//  UITabBar+Badge.m
//  FangTong
//
//  Created by 袁应荣 on 2017/12/21.
//  Copyright © 2017年 优房网. All rights reserved.
//

#import "UITabBar+Badge.h"
#import <objc/runtime.h>

static NSString *badgeKey = @"badgeKey";
#define tabrbarItemNumbers 5

#define badgeTag(index) (1000 + index)
static NSString *kBadgeSize = @"kBadgeSize";
static NSString *kBadgeColor = @"kBadgeColor";
static NSString *kBadgeImage = @"kBadgeImage";


@implementation UITabBar (Badge)

- (void)setBadge:(NSInteger)badge {
    /*
     objc_AssociationPolicy参数使用的策略：
     OBJC_ASSOCIATION_ASSIGN;            //assign策略
     OBJC_ASSOCIATION_COPY_NONATOMIC;    //copy策略
     OBJC_ASSOCIATION_RETAIN_NONATOMIC;  // retain策略
     
     OBJC_ASSOCIATION_RETAIN;
     OBJC_ASSOCIATION_COPY;
     */
    /*
     关联方法：
     objc_setAssociatedObject(id object, const void *key, id value, objc_AssociationPolicy policy);
     
     参数：
     * id object 给哪个对象的属性赋值
     const void *key 属性对应的key
     id value  设置属性值为value
     objc_AssociationPolicy policy  使用的策略，是一个枚举值，和copy，retain，assign是一样的，手机开发一般都选择NONATOMIC
     */
    NSString *s = [NSString stringWithFormat:@"%zd",badge];
    objc_setAssociatedObject(self, &badgeKey, s, OBJC_ASSOCIATION_COPY_NONATOMIC);
}



- (NSInteger)badge {
    
    return [objc_getAssociatedObject(self, &badgeKey) integerValue];
}

- (void)showBadgeOnMessage {
    [self showBadgeOnIndex:2 badgeCount:self.badge];
//    NSInteger index = 3;
//
//    [self removeBadgeOnitemIndex:index];
//    [self removeRedPointOnIndex:index animation:YES];
//
//    UIButton * badgeView = [[UIButton alloc]init];
//    badgeView.tag = badgeTag(index);
//    badgeView.layer.cornerRadius = 8;
//    badgeView.titleLabel.font = [UIFont systemFontOfSize:10];
//
//    NSString * stringX = [NSString stringWithFormat:@"%zd",self.badge];
//    if (self.badge > 99) stringX = @"99+";
//
//    [badgeView setTitle:stringX forState:UIControlStateNormal];
//
//    badgeView.backgroundColor = [UIColor redColor];
//
//    CGRect tabFram = self.frame;
//
//    float percentX = (index+0.55) / tabrbarItemNumbers;
//
//    CGFloat x = ceil(percentX * tabFram.size.width);
//
//    CGFloat y = ceil(0.2 * tabFram.size.height);
//
//    // barButtonView(里面包含文字和图片)
//    UIView *barButtonView = [self getBarButttonViewWithIndex:index];
//    //（图片的imageView）
//    UIView *iconView = nil;
//    for (UIView *swappableImageView in barButtonView.subviews) {
//        if ([swappableImageView isKindOfClass:[UIImageView class]]) {
//            iconView = swappableImageView;
//            break;
//        }
//    }
//
//    //badgeView(小红点)
//    if (iconView) {
//        CGSize iconViewSize = iconView.frame.size;
//        if (CGSizeEqualToSize(self.badgeSize, CGSizeZero)) {
//            self.badgeSize = CGSizeMake(16, 16);
//        }
//        if (!self.badgeColor) {
//            self.badgeColor = [UIColor redColor];
//        }
//        CGSize badgeSize = self.badgeSize;
//        badgeView.frame = CGRectMake(iconViewSize.width - badgeSize.width / 2, -badgeSize.width / 3, badgeSize.width, badgeSize.height);
//        [iconView addSubview:badgeView];
//    } else {
//         badgeView.frame = CGRectMake(x, y, 12, 12);
//        [self addSubview:badgeView];
//    }
//
    
    //    [UIView animateWithDuration:0.15 animations:^{
    //
    //        badgeView.transform = CGAffineTransformScale(badgeView.transform, 1.5, 1.5);
    //
    //    } completion:^(BOOL finished) {
    //
    //
    //        [UIView animateWithDuration:0.15 animations:^{
    //
    //            badgeView.transform = CGAffineTransformScale(badgeView.transform, 0.666666, 0.666666);
    //        }];
    //
    //
    //    }];
    
}

- (void)showBadgeOnIndex:(NSInteger)index badgeCount:(NSInteger)bagdeCount {
    
    [self removeBadgeOnitemIndex:index];
    [self removeRedPointOnIndex:index animation:YES];
    
    UIButton * badgeView = [[UIButton alloc]init];
    badgeView.tag = badgeTag(index);
    badgeView.layer.cornerRadius = 8;
    badgeView.titleLabel.font = [UIFont systemFontOfSize:10];
    
    NSString * stringX = [NSString stringWithFormat:@"%zd",bagdeCount];
    if (bagdeCount > 99) stringX = @"99+";
    
    [badgeView setTitle:stringX forState:UIControlStateNormal];
    
    badgeView.backgroundColor = [UIColor redColor];
    
    CGRect tabFram = self.frame;
    
    float percentX = (index+0.55) / tabrbarItemNumbers;
    
    CGFloat x = ceil(percentX * tabFram.size.width);
    
    CGFloat y = ceil(0.2 * tabFram.size.height);
    
    // barButtonView(里面包含文字和图片)
    UIView *barButtonView = [self getBarButttonViewWithIndex:index];
    //（图片的imageView）
    UIView *iconView = nil;
    for (UIView *swappableImageView in barButtonView.subviews) {
        if ([swappableImageView isKindOfClass:[UIImageView class]]) {
            iconView = swappableImageView;
            break;
        }
    }
    
    //badgeView(小红点)
    if (iconView) {
        CGSize iconViewSize = iconView.frame.size;
//        if (CGSizeEqualToSize(self.badgeSize, CGSizeZero)) {
//            if (bagdeCount > 99) {
//                self.badgeSize = CGSizeMake(20, 20);
//            } else {
//                self.badgeSize = CGSizeMake(16, 16);
//            }
//        }
        if (bagdeCount > 99) {
            self.badgeSize = CGSizeMake(24, 16);
        } else {
            self.badgeSize = CGSizeMake(16, 16);
        }
        if (!self.badgeColor) {
            self.badgeColor = [UIColor redColor];
        }
        CGSize badgeSize = self.badgeSize;
        badgeView.frame = CGRectMake(iconViewSize.width - badgeSize.width / 2, -badgeSize.width / 3, badgeSize.width, badgeSize.height);
        [iconView addSubview:badgeView];
    } else {
        badgeView.frame = CGRectMake(x, y, 12, 12);
        [self addSubview:badgeView];
    }
    
    
    //    [UIView animateWithDuration:0.15 animations:^{
    //
    //        badgeView.transform = CGAffineTransformScale(badgeView.transform, 1.5, 1.5);
    //
    //    } completion:^(BOOL finished) {
    //
    //
    //        [UIView animateWithDuration:0.15 animations:^{
    //
    //            badgeView.transform = CGAffineTransformScale(badgeView.transform, 0.666666, 0.666666);
    //        }];
    //
    //
    //    }];
    
}

- (void)hideBadgeOnMessage {
    
    [self hideBadgeOnIndex:2];
}

- (void)hideBadgeOnIndex:(NSInteger)index {
    
    [self removeBadgeOnitemIndex:index];
    [self removeRedPointOnIndex:index animation:YES];
}

- (void)removeBadgeOnitemIndex:(NSInteger)index {
    
    for (UIView * subView  in self.subviews) {
        
        if (subView.tag == 888 + index) {
            
            [subView removeFromSuperview];
            
        }
    }
}

#pragma mark - lll
// 运行时处理分类属性
- (void)setBadgeSize:(CGSize)badgeSize{
    objc_setAssociatedObject(self, &kBadgeSize,[NSValue valueWithCGSize:badgeSize], OBJC_ASSOCIATION_RETAIN_NONATOMIC);
}
- (CGSize)badgeSize{
    return [objc_getAssociatedObject(self, &kBadgeSize) CGSizeValue];
}

- (void)setBadgeImage:(UIImage *)badgeImage{
    objc_setAssociatedObject(self, &kBadgeImage, badgeImage, OBJC_ASSOCIATION_RETAIN_NONATOMIC);
}
- (UIImage *)badgeImage{
    return objc_getAssociatedObject(self, &kBadgeImage);
}

- (void)setBadgeColor:(UIColor *)badgeColor{
    objc_setAssociatedObject(self, &kBadgeColor, badgeColor, OBJC_ASSOCIATION_RETAIN_NONATOMIC);
}
- (UIColor *)badgeColor{
    return objc_getAssociatedObject(self, &kBadgeColor);
}

//显示小红点
- (void)showBadgeOnItemIndex:(NSUInteger )index{
    // 移除
    [self removeRedPointOnIndex:index animation:NO];
    // 默认值设置
    if (CGSizeEqualToSize(self.badgeSize, CGSizeZero)) {
        self.badgeSize = CGSizeMake(12, 12);
    }
    if (!self.badgeColor) {
        self.badgeColor = [UIColor redColor];
    }
    //badgeView(小红点)
    CGSize badgeSize = self.badgeSize;
    UIView *badgeView = [[UIView alloc]init];
    badgeView.backgroundColor = self.badgeColor;
    badgeView.layer.cornerRadius = badgeSize.width / 2;
    badgeView.tag = badgeTag(index);
    // barButtonView(里面包含文字和图片)
    UIView *barButtonView = [self getBarButttonViewWithIndex:index];
    //（图片的imageView）
    UIView *iconView = nil;
    for (UIView *swappableImageView in barButtonView.subviews) {
        if ([swappableImageView isKindOfClass:[UIImageView class]]) {
            iconView = swappableImageView;
            break;
        }
    }
    CGSize iconViewSize = iconView.frame.size;
    badgeView.frame = CGRectMake(iconViewSize.width - badgeSize.width / 2, - badgeSize.width / 2, badgeSize.width, badgeSize.height);
    //添加图片到小红点上
    UIImageView *imageview = [[UIImageView alloc]initWithFrame:badgeView.bounds];
    imageview.image = self.badgeImage;
    if (self.badgeImage) {
        self.badgeColor = [UIColor clearColor];
    }
    [badgeView addSubview:imageview];
    //添加小红点到系统图层上
    [iconView addSubview:badgeView];
    
}

//隐藏小红点
- (void)hiddenRedPointOnIndex:(NSUInteger )index animation:(BOOL )animation {
    [self removeRedPointOnIndex:index animation:animation];
}
- (void)removeRedPointOnIndex:(NSUInteger )index animation:(BOOL )animation {
    //获取对应的barButtonView（里面包含文字和图片）
    UIView *barButtonView = [self getBarButttonViewWithIndex:index];
    for (UIView *swapView in barButtonView.subviews) {
        if ([swapView isKindOfClass:[UIImageView class]]) { //遍历出图片类的uiview图层_iconView
            for (UIView *view in swapView.subviews){
                if (view.tag == badgeTag(index)) { //找到了小红点
                    if (animation) {
                        [UIView animateWithDuration:0.2 animations:^{
                            view.transform = CGAffineTransformScale(view.transform, 2, 2);
                            view.alpha = 0;
                        } completion:^(BOOL finished) {
                            [view removeFromSuperview];
                        }
                         ];
                        
                    } else {
                        [view removeFromSuperview];
                        }
                }
            }
        }
    }
}
//获取barButtonView
- (UIView *)getBarButttonViewWithIndex:(NSUInteger )index {
    UIBarButtonItem *item = (UIBarButtonItem *)[self.items objectAtIndex:index];
    //通过runtime和KVC找到UIBarBottunItem的View，至于为什么是“view”，可在 viewController中使用【self test】方法进行调试打印
    UIView *barButtonView = [item valueForKey:@"view"];
    return barButtonView;
}


@end
