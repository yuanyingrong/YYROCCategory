//
//  NSDate+YYRAddition.h
//  test
//
//  Created by 袁应荣 on 2017/3/11.
//  Copyright © 2017年 袁应荣. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSDate (YYRAddition)

#pragma mark - 单例
+ (nonnull NSDateFormatter *)yyr_sharedDateFormatter;
+ (nonnull NSCalendar *)yyr_sharedCalendar;

/**
 根据时间格式等返回时间字符串
 */
- (nullable NSString *)yyr_stringWithFormat:(NSString *_Nullable)format
                                   timeZone:(nullable NSTimeZone *)timeZone
                                     locale:(nullable NSLocale *)locale;

#pragma mark - 日期方法
/**
 返回指定时间差值的日期字符串

 @param delta 时间差值
 @return 日期字符串，格式：yyyy-MM-dd HH:mm:ss
 */
+ (nonnull NSString *)yyr_dateStringWithDelta:(NSTimeInterval)delta;

/**
 返回指定时间差值的日期字符串

 @return 日期字符串，格式：yyyy.MM.dd
 */
+ (nonnull NSString *)yyr_dateCurrentTimeString;

// 由时间戳转为时间格式：微信
+(NSString *_Nullable)yyr_timeStampToWeChatString:(long long)timeStamp;

/**
 返回日期格式字符串
 
 具体格式如下：
    - 刚刚(一分钟内)
    - X分钟前(一小时内)
    - X小时前(当天)
    - MM-dd HH:mm(一年内)
    - yyyy-MM-dd HH:mm(更早期)
 */
@property (nonnull, nonatomic, readonly) NSString *yyr_dateDescription;

/// 日期格式转字符串
+ (NSString *_Nullable)yyr_dateToString:(NSDate *_Nullable)date withDateFormat:(NSString *_Nullable)format;

/// 字符串yyyy-MM-dd HH:mm:SS转yyyy-MM-dd
+ (NSString *_Nullable)yyr_stringToString:(NSString *_Nullable)dateString;

/// 字符串转日期格式
+ (NSDate *_Nullable)yyr_stringToDate:(NSString *_Nullable)dateString withDateFormat:(NSString *_Nullable)format;

/// 将世界时间转化为中国区时间
+ (NSDate *_Nullable)yyr_worldTimeToChinaTime:(NSDate *_Nullable)date;

#pragma mark - 比较两个日期
+ (NSComparisonResult)compareDateWithDateA:(NSDate *_Nullable)dateA withDateB:(NSDate *_Nullable)dateB;

/**
 日期格式请传入：2013-08-05 12:12:12

 @param oneDateStr oneDateStr
 @param anotherDateStr anotherDateStr
 @return 返回结果
 */
+ (NSComparisonResult)compareDateWithOneDateStr:(NSString*_Nullable)oneDateStr anotherDateStr:(NSString*_Nullable)anotherDateStr;

@end
