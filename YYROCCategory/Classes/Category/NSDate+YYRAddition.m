//
//  NSDate+YYRAddition.m
//  test
//
//  Created by 袁应荣 on 2017/3/11.
//  Copyright © 2017年 袁应荣. All rights reserved.
//

#import "NSDate+YYRAddition.h"
#import "NSString+YYRAddition.h"

@implementation NSDate (YYRAddition)

#pragma mark - 单例
+ (NSDateFormatter *)yyr_sharedDateFormatter {
    static NSDateFormatter *dateFormatter;
    
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        dateFormatter = [[NSDateFormatter alloc] init];
        dateFormatter.locale = [NSLocale localeWithLocaleIdentifier:@"en"];
    });
    
    return dateFormatter;
}

+ (NSCalendar *)yyr_sharedCalendar {
    static NSCalendar *calendar;
    
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        calendar = [NSCalendar currentCalendar];
    });
    
    return calendar;
}

- (NSString *)yyr_stringWithFormat:(NSString *)format timeZone:(NSTimeZone *)timeZone locale:(NSLocale *)locale {
    NSDateFormatter *formatter = [[NSDateFormatter alloc] init];
    [formatter setDateFormat:format];
    if (timeZone) [formatter setTimeZone:timeZone];
    if (locale) [formatter setLocale:locale];
    
    return [formatter stringFromDate:self];
}

#pragma mark - 日期方法
+ (NSString *)yyr_dateStringWithDelta:(NSTimeInterval)delta {
    [self yyr_sharedDateFormatter].dateFormat = @"yyyy-MM-dd HH:mm:ss";
    
    NSDate *date = [NSDate dateWithTimeIntervalSinceNow:delta];
    
    return [[self yyr_sharedDateFormatter] stringFromDate:date];
}

+ (NSString *)yyr_dateCurrentTimeString {
    
    [self yyr_sharedDateFormatter].dateFormat = @"yyyy.MM.dd HH:mm:ss";
    
    NSDate *date = [NSDate dateWithTimeIntervalSinceNow:0];
    
    return [[self yyr_sharedDateFormatter] stringFromDate:date];
}

- (NSString *)yyr_dateDescription {
    
    NSUInteger units = NSCalendarUnitYear | NSCalendarUnitMonth | NSCalendarUnitDay;
    NSDateComponents *dateComponents = [[NSDate yyr_sharedCalendar] components:units fromDate:self];
    NSDateComponents *thisComponents = [[NSDate yyr_sharedCalendar] components:units fromDate:[NSDate date]];
    
    // 今天
    if (dateComponents.year == thisComponents.year
        && dateComponents.month == thisComponents.month
        && dateComponents.day == thisComponents.day) {
        
        NSInteger delta = (NSInteger)[[NSDate date] timeIntervalSinceDate:self];
        
        if (delta < 60) {
            return @"刚刚";
        }
        if (delta < 3600) {
            return [NSString stringWithFormat:@"%zd 分钟前", delta / 60];
        }
        return [NSString stringWithFormat:@"%zd 小时前", delta / 3600];
    }
    
    NSString *format = @"MM-dd HH:mm";
    
    if (dateComponents.year != thisComponents.year) {
        format = [@"yyyy-" stringByAppendingString:format];
    }
    [NSDate yyr_sharedDateFormatter].dateFormat = format;
    
    return [[NSDate yyr_sharedDateFormatter] stringFromDate:self];
}

+ (NSDate *)dateWithTimeIntervalInMilliSecondSince1970:(double)timeIntervalInMilliSecond {
    NSDate *ret = nil;
    double timeInterval = timeIntervalInMilliSecond;
    // judge if the argument is in secconds(for former data structure).
    if(timeIntervalInMilliSecond > 140000000000) {
        timeInterval = timeIntervalInMilliSecond / 1000;
    }
    ret = [NSDate dateWithTimeIntervalSince1970:timeInterval];
    
    return ret;
}

+ (NSString *)yyr_timeStampToWeChatString:(long long)timeStamp {
    
//    NSString *timeString = [[NSString alloc]init];
    
    //当前时间的时间戳
//    NSTimeInterval  timeNow=[[NSDate date] timeIntervalSince1970];
    
    //将传来的时间戳转为标准时间格式
    NSTimeInterval time = timeStamp;
    NSDate *date = [NSDate dateWithTimeIntervalInMilliSecondSince1970:time];
    NSDateFormatter *dateFormatter = [self yyr_sharedDateFormatter];
//    [dateFormatter setDateFormat:@"yyyy-MM-dd HH:mm:ss"];
//    NSString *tempStr= [dateFormatter stringFromDate:date];
    
//    timeString = [NSString stringWithFormat:@"%@年%@月%@日 %@",[tempStr substringWithRange:NSMakeRange(0,4)],[tempStr substringWithRange:NSMakeRange(5,2)],[tempStr substringWithRange:NSMakeRange(8,2)],[tempStr substringWithRange:NSMakeRange(11,8)]];
//    
//    //当前时间
//    NSDate *nowDate = [NSDate date];
//    NSString *nowDateStr= [dateFormatter stringFromDate:nowDate];
    
    NSArray *weekday = [NSArray arrayWithObjects: [NSNull null], @"周日", @"周一", @"周二", @"周三", @"周四", @"周五", @"周六", nil];
    
    NSCalendar *calendar = [self yyr_sharedCalendar];
    
    
    if ([calendar isDateInToday:date]) { // 今天
        
        dateFormatter.dateFormat = @"HH:mm";
        
    } else if([calendar isDateInYesterday:date]) { // 昨天
        
        dateFormatter.dateFormat = @"昨天";
    } else if ([calendar isDateInWeekend:date]) {
        
        NSDateComponents *components = [calendar components:NSCalendarUnitWeekday fromDate:date];
        return [weekday objectAtIndex:components.weekday];
    } else {
        
        dateFormatter.dateFormat = @"yyyy/MM/dd";
    }
    return [dateFormatter stringFromDate:date];
}

// 日期格式转字符串
+ (NSString *)yyr_dateToString:(NSDate *)date withDateFormat:(NSString *)format {
    NSDateFormatter *dateFormatter = [[NSDateFormatter alloc] init];
    [dateFormatter setDateFormat:format];
    NSString *strDate = [dateFormatter stringFromDate:date];
    return strDate;
}

/// 字符串yyyy-MM-dd HH:mm:SS转yyyy-MM-dd
+ (NSString *)yyr_stringToString:(NSString *)dateString {
    if ([dateString isBlankString]) {
        return @"";
    }
    NSDateFormatter *fromFormatter = [[NSDateFormatter alloc] init];
    if ([dateString hasSuffix:@".0"]) {
        [fromFormatter setDateFormat:@"yyyy-MM-dd HH:mm:SS.s"];
    } else {
        [fromFormatter setDateFormat:@"yyyy-MM-dd HH:mm:SS"];
    }

    NSDate *date = [fromFormatter dateFromString:dateString];
    NSDateFormatter *dateFormatter = [[NSDateFormatter alloc] init];
    [dateFormatter setDateFormat:@"yyyy-MM-dd"];
    NSString *strDate = [dateFormatter stringFromDate:date];
    return strDate;
}

// 字符串转日期格式
+ (NSDate *)yyr_stringToDate:(NSString *)dateString withDateFormat:(NSString *)format {
    
    NSDateFormatter *dateFormatter = [[NSDateFormatter alloc] init];
    [dateFormatter setDateFormat:format];
    
    NSDate *date = [dateFormatter dateFromString:dateString];
    return [self yyr_worldTimeToChinaTime:date];
}

//将世界时间转化为中国区时间
+ (NSDate *)yyr_worldTimeToChinaTime:(NSDate *)date {
    NSTimeZone *timeZone = [NSTimeZone systemTimeZone];
    NSInteger interval = [timeZone secondsFromGMTForDate:date];
    NSDate *localeDate = [date  dateByAddingTimeInterval:interval];
    return localeDate;
}

#pragma mark - 比较两个日期
+ (NSComparisonResult)compareDateWithDateA:(NSDate *)dateA withDateB:(NSDate *)dateB {
    NSDateFormatter *dateFormatter = [self yyr_sharedDateFormatter];
    [dateFormatter setDateFormat:@"dd-MM-yyyy HH:mm:ss"];
    NSString *oneDayStr = [dateFormatter stringFromDate:dateA];
    NSString *anotherDayStr = [dateFormatter stringFromDate:dateB];
    NSDate *dateAa = [dateFormatter dateFromString:oneDayStr];
    NSDate *dateBb = [dateFormatter dateFromString:anotherDayStr];
    NSComparisonResult result = [dateAa compare:dateBb];
    NSLog(@"date1 : %@, date2 : %@", dateA, dateB);
    return result;
//    if (result == NSOrderedDescending) {
//        //NSLog(@"Date1  is in the future");
//        return 1;
//    }
//    else if (result == NSOrderedAscending){
//        //NSLog(@"Date1 is in the past");
//        return -1;
//    }
//    //NSLog(@"Both dates are the same");
//    return 0;
    
}

+ (NSComparisonResult)compareDateWithOneDateStr:(NSString *)oneDateStr anotherDateStr:(NSString *)anotherDateStr {
    
    NSDateFormatter *dateFormatter = [self yyr_sharedDateFormatter];
    [dateFormatter setDateFormat:@"yyyy-MM-dd HH:mm:ss"];
//    NSDate *dateOne = [[NSDate alloc] init];
//    NSDate *dateTwo = [[NSDate alloc] init];
    NSDate *dateOne = [dateFormatter dateFromString:oneDateStr];
    NSDate *dateTwo = [dateFormatter dateFromString:anotherDateStr];
    NSComparisonResult result = [dateOne compare:dateTwo];
    
//    int ci;
//    switch (result)
//    {
//            //date02比date01大
//        caseNSOrderedAscending: ci=1;break;
//            //date02比date01小
//        caseNSOrderedDescending: ci=-1;break;
//            //date02=date01
//        case NSOrderedSame: ci=0;break;
//        default: NSLog(@"erorr dates %@, %@", dateTwo, dateOne);break;
//    }
    return result;
}


@end
