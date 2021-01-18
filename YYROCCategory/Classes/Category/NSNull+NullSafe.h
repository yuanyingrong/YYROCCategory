//
//  NSNull+safeSetter.h
//  BaiMiZhangGui
//
//  Created by 郭景元 on 16/8/29.
//  Copyright © 2016年 钟磊. All rights reserved.
//

//从后台接收到<null>时给属性赋值为"000",避免程序崩溃
#import <Foundation/Foundation.h>

@interface NSNull (NullSafe)


@end
