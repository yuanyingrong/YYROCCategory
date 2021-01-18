//
//  NSBundle+YYRAddition.h
//  test
//
//  Created by 袁应荣 on 2017/3/11.
//  Copyright © 2017年 袁应荣. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface NSBundle (YYRAddition)

/// 当前版本号字符串
+ (nullable NSString *)yyr_currentVersion;

/// 与当前屏幕尺寸匹配的启动图像
+ (nullable UIImage *)yyr_launchImage;

@end
