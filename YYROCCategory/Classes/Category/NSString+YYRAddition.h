//
//  NSString+YYRAddition.h
//  test
//
//  Created by 袁应荣 on 2017/3/11.
//  Copyright © 2017年 袁应荣. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSString (YYRAddition)

///  判断字符串是否为空
- (BOOL)isBlankString;

///  判断字符串是否为空
- (BOOL)isNotBlankString;

- (NSString *)yyr_substringToIndex:(NSInteger)index;

@end

@interface NSString (YYRPath)

/**
 拼接了`文档目录`的全路径
 */
@property (nullable, nonatomic, readonly) NSString *yyr_documentDirectory;
/**
 拼接了`缓存目录`的全路径
 */
@property (nullable, nonatomic, readonly) NSString *yyr_cacheDirecotry;
/**
 拼接了临时目录的全路径
 */
@property (nullable, nonatomic, readonly) NSString *yyr_tmpDirectory;

/// 通过url.query获取参数字符 再分成字典
- (NSMutableDictionary *)getURLParameters;

@end

@interface NSString (YYRBase64)

/**
 BASE 64 编码的字符串内容
 */
@property(nullable, nonatomic, readonly) NSString *yyr_base64encode;
/**
 BASE 64 解码的字符串内容
 */
@property(nullable, nonatomic, readonly) NSString *yyr_base64decode;


@end

@interface NSString (YYRTranscoding)


/**
 字符串转码 --> IOS-8859-1

 @param string 字符串
 @return 转码后的字符串
 */
+ (NSString *_Nullable)unicodeToISO88591:(NSString *_Nullable)string;


/**
 url文字转码

 @return 转码后的文字
 */
- (NSString *_Nullable)URLEncodeString;

// 判断是否有emoji
+ (BOOL)stringContainsEmoji:(NSString *_Nullable)string;

@end

@interface NSString (YYRPinyin)


/**
 汉字转出拼音
 
 @param aString 字符串
 @return 转码换后字符串
 */
+ (NSString *_Nullable)transformToPinyin:(NSString *_Nullable)aString;

@end
