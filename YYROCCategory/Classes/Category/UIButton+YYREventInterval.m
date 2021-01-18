//
//  UIButton+YYREventInterval.m
//  FangTong
//
//  Created by 袁应荣 on 2020/8/26.
//  Copyright © 2020 优房网. All rights reserved.
//

#import "UIButton+YYREventInterval.h"
#import <objc/runtime.h>

//static char * const yyr_eventIntervalKey = "yyr_eventIntervalKey";
//static char * const eventUnavailableKey = "eventUnavailableKey";

@interface UIButton ()

@property (nonatomic, assign) BOOL eventUnavailable;

@end


@implementation UIButton (YYREventInterval)

+ (void)load {
    
    static dispatch_once_t onceToken;
     dispatch_once(&onceToken, ^{
        SEL selA = @selector(sendAction:to:forEvent:);
        SEL selB = @selector(yyr_sendAction:to:forEvent:);
        
        Method methodA = class_getInstanceMethod(self, selA);
        Method methodB = class_getInstanceMethod(self, selB);
        // 将methodB的实现添加到系统方法中也就是说将methodA方法指针添加成方法methodB的返回值表示是否添加成功
        BOOL isAdd = class_addMethod(self, selA,method_getImplementation(methodB),method_getTypeEncoding(methodB));
        // 添加成功了说明本类中不存在methodB所以此时必须将方法b的实现指针换成方法A的，否则b方法将没有实现。
        if(isAdd) {
            
            class_replaceMethod(self, selB,method_getImplementation(methodA),method_getTypeEncoding(methodA));
            
        } else {
            
            //添加失败了说明本类中有methodB的实现，此时只需要将methodA和methodB的IMP互换一下即可。
            
            method_exchangeImplementations(methodA, methodB);
        }
    });
}


#pragma mark - Action functions

//- (void)yyr_sendAction:(SEL)action to:(id)target forEvent:(UIEvent *)event {
    
//    if (self.eventUnavailable == NO) {
//        self.eventUnavailable = YES;
//        [self yyr_sendAction:action to:target forEvent:event];
//        [self performSelector:@selector(setEventUnavailable:) withObject:@(NO) afterDelay:self.yyr_eventInterval];
//    }
//}

- (void)yyr_sendAction:(SEL)action to:(id)target forEvent:(UIEvent *)event {
    if([self isMemberOfClass:[UIButton class]]) {
        if (self.eventUnavailable == NO) {
              self.eventUnavailable = YES;
              [self yyr_sendAction:action to:target forEvent:event];
              [self performSelector:@selector(setEventUnavailable:) withObject:0           afterDelay:self.yyr_eventInterval];
        }
   } else {
        [self yyr_sendAction:action to:target forEvent:event];
    }
}


#pragma mark - Setter & Getter functions

- (NSTimeInterval)yyr_eventInterval {
    
    return [objc_getAssociatedObject(self, _cmd) doubleValue];
//    return [objc_getAssociatedObject(self, yyr_eventIntervalKey) doubleValue];
}

- (void)setYyr_eventInterval:(NSTimeInterval)yyr_eventInterval {
    
    objc_setAssociatedObject(self, @selector(yyr_eventInterval), @(yyr_eventInterval), OBJC_ASSOCIATION_RETAIN_NONATOMIC);
//    objc_setAssociatedObject(self, yyr_eventIntervalKey, @(yyr_eventInterval), OBJC_ASSOCIATION_RETAIN_NONATOMIC);
}

- (BOOL)eventUnavailable {
    
    return [objc_getAssociatedObject(self, _cmd) doubleValue];
//    return [objc_getAssociatedObject(self, eventUnavailableKey) boolValue];
}

- (void)setEventUnavailable:(BOOL)eventUnavailable {
    
    objc_setAssociatedObject(self, @selector(eventUnavailable), @(eventUnavailable), OBJC_ASSOCIATION_RETAIN_NONATOMIC);
//    objc_setAssociatedObject(self, eventUnavailableKey, @(eventUnavailable), OBJC_ASSOCIATION_RETAIN_NONATOMIC);
}


@end
