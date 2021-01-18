//
//  UIImageView+YYRAddition.m
//  FangTong
//
//  Created by 袁应荣 on 2020/7/6.
//  Copyright © 2020 优房网. All rights reserved.
//

#import "UIImageView+YYRAddition.h"
#import <UIImageView+WebCache.h>

@implementation UIImageView (YYRAddition)

- (void)yyr_setImageWithUrlStr:(NSString *)urlStr {
    [self yyr_setImageWithUrlStr:urlStr placeholder:nil];
}

- (void)yyr_setImageWithUrlStr:(NSString *)urlStr placeholder:(nullable NSString *)placeholder {
    
    if (placeholder != nil && placeholder.length > 0) {
        [self sd_setImageWithURL:[NSURL URLWithString:urlStr] placeholderImage:[UIImage imageNamed:placeholder]];
    } else {
        [self sd_setImageWithURL:[NSURL URLWithString:urlStr]];
    }
}

@end
