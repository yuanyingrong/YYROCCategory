//
//  UIImageView+YYRAddition.h
//  FangTong
//
//  Created by 袁应荣 on 2020/7/6.
//  Copyright © 2020 优房网. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface UIImageView (YYRAddition)

- (void)yyr_setImageWithUrlStr:(NSString *)urlStr;

- (void)yyr_setImageWithUrlStr:(NSString *)urlStr placeholder:(nullable NSString *)placeholder;

@end

NS_ASSUME_NONNULL_END
