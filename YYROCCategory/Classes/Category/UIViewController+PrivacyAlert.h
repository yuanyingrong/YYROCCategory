//
//  UIViewController+PrivacyAlert.h
//  FangTong
//
//  Created by 袁应荣 on 2017/11/2.
//  Copyright © 2017年 优房网. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIViewController (PrivacyAlert)


/**
 判断相机权限
 */
- (void)checkCameraAuthorizationStatusWithGrand:(void(^)(BOOL granted))permissionGranted;


/**
 判断相册权限
 */
- (void)checkAlbumAuthorizationStatusWithGrand:(void(^)(BOOL granted))permissionGranted;


/**
 判断定位权限
 */
- (void)locationPrivilege;

@end
