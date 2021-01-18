//
//  NSTimer+WeakTimer.h
//  FangTong
//
//  Created by 袁应荣 on 2020/4/16.
//  Copyright © 2020 优房网. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface NSTimer (WeakTimer)

+ (NSTimer *)scheduledWeakTimerWithTimeInterval:(NSTimeInterval)ti target:(id)aTarget selector:(SEL)aSelector userInfo:(id)userInfo repeats:(BOOL)yesOrNo;

@end

NS_ASSUME_NONNULL_END
