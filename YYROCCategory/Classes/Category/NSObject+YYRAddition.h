//
//  NSObject+YYRAddition.h
//  test
//
//  Created by 袁应荣 on 2017/3/11.
//  Copyright © 2017年 袁应荣. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSObject (YYRAddition)

/**
 使用字典创建模型对象

 @param dict 字典
 @return 模型对象
 */
+ (instancetype)yyr_objectWithDict:(NSDictionary *)dict;

@end
