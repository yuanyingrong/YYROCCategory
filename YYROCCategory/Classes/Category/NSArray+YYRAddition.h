//
//  NSArray+YYRAddition.h
//  test
//
//  Created by 袁应荣 on 2017/3/11.
//  Copyright © 2017年 袁应荣. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSArray (YYRAddition)


+ (NSArray *)yyr_objectListWithPlistName:(NSString *)plistName clsName:(NSString *)clsName;

/**
 从 plist 文件创建指定 clsName 对象数组
 
 @param plistName plist 文件名
 @param clsName 要创建模型的类名
 @return clsName的对象数组
 */
+ (NSArray *)yyr_objectListOfCVWithPlistName:(NSString *)plistName clsName:(NSString *)clsName;

@end
