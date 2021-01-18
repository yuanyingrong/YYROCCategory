//
//  UIViewController+PrivacyAlert.m
//  FangTong
//
//  Created by 袁应荣 on 2017/11/2.
//  Copyright © 2017年 优房网. All rights reserved.
//

#import "UIViewController+PrivacyAlert.h"
#import <CoreLocation/CLLocationManager.h>
#import <AVKit/AVKit.h>
#import <Photos/Photos.h>

#define iOS10Later ([UIDevice currentDevice].systemVersion.floatValue >= 10.0f)
@implementation UIViewController (PrivacyAlert)

#pragma mark 相机权限
- (void)checkCameraAuthorizationStatusWithGrand:(void(^)(BOOL granted))permissionGranted {
    

    AVAuthorizationStatus videoAuthStatus = [AVCaptureDevice authorizationStatusForMediaType:AVMediaTypeVideo];
    switch (videoAuthStatus) {
           // 已授权
           case AVAuthorizationStatusAuthorized: {
               permissionGranted(YES);
           }
               break;
           // 未询问用户是否授权
           case AVAuthorizationStatusNotDetermined: {
               // 提示用户授权
               [AVCaptureDevice requestAccessForMediaType:AVMediaTypeVideo completionHandler:^(BOOL granted) {
                   permissionGranted(granted);
               }];
           }
               break;
           // 用户拒绝授权或权限受限
           case AVAuthorizationStatusRestricted:
           case AVAuthorizationStatusDenied:  {
               [self goToSettingPrivilegeWithTipMessage:@"相机权限已被禁用，基础功能暂无法使用，是否去开启？"];
               permissionGranted(NO);
           }
               break;
           default:
               break;
       }
}

#pragma mark 相册权限
- (void)checkAlbumAuthorizationStatusWithGrand:(void(^)(BOOL granted))permissionGranted {
    
   PHAuthorizationStatus photoAuthStatus = [PHPhotoLibrary authorizationStatus];
    switch (photoAuthStatus) {
           // 已授权
           case PHAuthorizationStatusAuthorized: {
               permissionGranted(YES);
           }
               break;
           // 未询问用户是否授权
           case PHAuthorizationStatusNotDetermined: {
               // 提示用户授权
               [AVCaptureDevice requestAccessForMediaType:AVMediaTypeVideo completionHandler:^(BOOL granted) {
                   permissionGranted(granted);
               }];
           }
               break;
           // 用户拒绝授权或权限受限
           case PHAuthorizationStatusRestricted:
           case PHAuthorizationStatusDenied: {
               [self goToSettingPrivilegeWithTipMessage:@"相册权限已被禁用，基础功能暂无法使用，是否去开启？"];
               permissionGranted(NO);
           }
               break;
           default:
               break;
       }
}

#pragma mark 提示用户去系统设置修改权限
- (void)goToSettingPrivilegeWithTipMessage:(NSString *)message {
    
    [[NSOperationQueue mainQueue] addOperationWithBlock:^{
        UIAlertController *alertController = [UIAlertController alertControllerWithTitle:@"提示" message:message preferredStyle:UIAlertControllerStyleAlert];
        
        UIAlertAction *confirm = [UIAlertAction actionWithTitle:@"去开启" style:UIAlertActionStyleDefault handler:^(UIAlertAction * _Nonnull action) {
            if (iOS10Later) {
                NSURL *settingsURL = [NSURL URLWithString:UIApplicationOpenSettingsURLString];
                
                if ([[UIApplication sharedApplication] canOpenURL:settingsURL]) {
                    [[UIApplication sharedApplication] openURL:settingsURL options:@{} completionHandler:nil];
                }
                
            } else {
                if ([[UIApplication sharedApplication] canOpenURL:[NSURL URLWithString:UIApplicationOpenSettingsURLString]]) {
                    [[UIApplication sharedApplication] openURL:[NSURL URLWithString:UIApplicationOpenSettingsURLString]];
                }
            }
        }];
        UIAlertAction *cancel = [UIAlertAction actionWithTitle:@"暂不开启" style:UIAlertActionStyleCancel handler:^(UIAlertAction * _Nonnull action) {
            
        }];
        [alertController addAction:confirm];
        [alertController addAction:cancel];
        [self presentViewController:alertController animated:YES completion:nil];
    }];
}


#pragma mark 定位权限
- (void)locationPrivilege {
    
    if([CLLocationManager locationServicesEnabled] && [CLLocationManager authorizationStatus] == kCLAuthorizationStatusNotDetermined) { // 用户还没有处理权限请求
        
        NSLog(@"Restricted");
    } else if([CLLocationManager locationServicesEnabled] && [CLLocationManager authorizationStatus] == kCLAuthorizationStatusDenied) { // 定位不能用
        
        [self goToSettingLocationPrivilege];
        return;
    } else if([CLLocationManager locationServicesEnabled] && ([CLLocationManager authorizationStatus] == kCLAuthorizationStatusAuthorizedWhenInUse || [CLLocationManager authorizationStatus] == kCLAuthorizationStatusAuthorizedAlways)) { // 定位功能可用
        
    } else {
        // 未知的权限状态
    }
}

#pragma mark 提示用户去系统设置修改相机权限
- (void)goToSettingLocationPrivilege {
    
    [[NSOperationQueue mainQueue] addOperationWithBlock:^{
        UIAlertController *alertController = [UIAlertController alertControllerWithTitle:@"提示" message:@"定位权限已被禁用，基础功能暂无法使用，是否去开启？" preferredStyle:UIAlertControllerStyleAlert];
        
        UIAlertAction *confirm = [UIAlertAction actionWithTitle:@"去开启" style:UIAlertActionStyleDefault handler:^(UIAlertAction * _Nonnull action) {
            if (iOS10Later) {
                NSURL *privacyUrl = [NSURL URLWithString:UIApplicationOpenSettingsURLString];
                //                NSURL *privacyUrl = [NSURL URLWithString:@"prefs:root=Privacy&path=LOCATIONS"];
                if ([[UIApplication sharedApplication] canOpenURL:privacyUrl]) {
                    [[UIApplication sharedApplication] openURL:privacyUrl options:@{} completionHandler:nil];
                }
                
            } else {
                if ([[UIApplication sharedApplication] canOpenURL:[NSURL URLWithString:UIApplicationOpenSettingsURLString]]) {
                    [[UIApplication sharedApplication] openURL:[NSURL URLWithString:UIApplicationOpenSettingsURLString]];
                }
            }

        }];
        UIAlertAction *cancel = [UIAlertAction actionWithTitle:@"暂不开启" style:UIAlertActionStyleCancel handler:^(UIAlertAction * _Nonnull action) {
            
        }];
        [alertController addAction:confirm];
        [alertController addAction:cancel];
        [self presentViewController:alertController animated:YES completion:nil];
    }];
}


/**
 提示用户设置隐私权限

 @param privacyStr 相关权限
 */
- (void)tipPrivacySettingWithPrivacyStr:(NSString *)privacyStr {
    
    NSString *appName = [[NSBundle mainBundle].infoDictionary valueForKey:@"CFBundleDisplayName"];
    if (!appName) appName = [[NSBundle mainBundle].infoDictionary valueForKey:@"CFBundleName"];
    NSString *message = [NSString stringWithFormat:@"请在iPhone的\"设置-隐私-%@\"选项中，\r允许%@访问你的%@",privacyStr,appName,privacyStr];
    
    UIAlertController *alertContr = [UIAlertController alertControllerWithTitle:@"提示" message:message preferredStyle:UIAlertControllerStyleAlert];
    UIAlertAction *confirm = [UIAlertAction actionWithTitle:@"确定" style:UIAlertActionStyleDefault handler:^(UIAlertAction * _Nonnull action) {
        
    }];
    [alertContr addAction:confirm];
    [self presentViewController:alertContr animated:YES completion:nil];
}

@end
