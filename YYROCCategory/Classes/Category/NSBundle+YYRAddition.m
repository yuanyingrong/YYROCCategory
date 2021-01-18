//
//  NSBundle+YYRAddition.m
//  test
//
//  Created by 袁应荣 on 2017/3/11.
//  Copyright © 2017年 袁应荣. All rights reserved.
//

#import "NSBundle+YYRAddition.h"

@implementation NSBundle (YYRAddition)

+ (NSString *)yyr_currentVersion {
    return [NSBundle mainBundle].infoDictionary[@"CFBundleShortVersionString"];
}

+ (UIImage *)yyr_launchImage {
    
    NSArray *launchImages = [NSBundle mainBundle].infoDictionary[@"UILaunchImages"];
    
    NSString *sizeString = NSStringFromCGSize([UIScreen mainScreen].bounds.size);
    NSPredicate *predicate = [NSPredicate predicateWithFormat:@"UILaunchImageOrientation = 'Portrait' AND UILaunchImageSize = %@", sizeString];
    NSArray *result = [launchImages filteredArrayUsingPredicate:predicate];
    
    NSString *imageName = result.lastObject[@"UILaunchImageName"];
    
    return [UIImage imageNamed:imageName];
}


@end
