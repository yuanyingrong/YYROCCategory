//
//  NSArray+YYRAddition.m
//  test
//
//  Created by 袁应荣 on 2017/3/11.
//  Copyright © 2017年 袁应荣. All rights reserved.
//

#import "NSArray+YYRAddition.h"
#import "NSObject+YYRAddition.h"

@implementation NSArray (YYRAddition)

+ (NSArray *)yyr_objectListWithPlistName:(NSString *)plistName clsName:(NSString *)clsName {
    //获取plist的url
    NSURL *url = [[NSBundle mainBundle]URLForResource:plistName withExtension:nil];
    //加载plist文件
    NSArray *a = [NSArray arrayWithContentsOfURL:url];
    //保存模型的数组
    NSMutableArray *aM = [NSMutableArray array];
    //获取模型对象类
    Class cls = NSClassFromString(clsName);
    
    for (NSArray *aModel in a) {
        NSMutableArray *arrayM = [NSMutableArray array];
        for (NSDictionary *dict in aModel) {
            [arrayM addObject:[cls yyr_objectWithDict:dict]];
        }
        [aM addObject:arrayM];
        
    }
    return aM.copy;
}

+ (NSArray *)yyr_objectListOfCVWithPlistName:(NSString *)plistName clsName:(NSString *)clsName{
    //获取plist的url
    NSURL *url = [[NSBundle mainBundle] URLForResource:plistName withExtension:nil];
    //加载plist文件
    NSArray *list = [NSArray arrayWithContentsOfURL:url];
    //保存模型的数组
    NSMutableArray *arrayM = [NSMutableArray array];
    //获取模型对象类
    Class cls = NSClassFromString(clsName);
    
    //字典转模型对象
    for (NSDictionary *dict in list) {
        [arrayM addObject:[cls yyr_objectWithDict:dict]];
    }
    
    return arrayM.copy;
}

@end
