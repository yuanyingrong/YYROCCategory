//
//  NSObject+YYRAddition.m
//  test
//
//  Created by 袁应荣 on 2017/3/11.
//  Copyright © 2017年 袁应荣. All rights reserved.
//

#import "NSObject+YYRAddition.h"

@implementation NSObject (YYRAddition)

/**
 使用字典创建模型对象
 
 @param dict 字典
 @return 模型对象
 */
+ (instancetype)yyr_objectWithDict:(NSDictionary *)dict {
    
    id obj = [[self alloc] init];
    
    [obj setValuesForKeysWithDictionary:dict];
    
    return obj;
}

@end
