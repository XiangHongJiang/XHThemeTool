//
//  AppDelegate.m
//  XHThemeDemo
//
//  Created by JXH on 2022/2/14.
//

#import "AppDelegate.h"

@interface AppDelegate ()

@end

@implementation AppDelegate


- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    //启动皮肤：优先使用之前的配置，未配置使用默认配置+类型
    [XHThemeManager sharedThemeManager].isShowLog = NO;
    BOOL flag = [[XHThemeManager sharedThemeManager] startThemeWithBaseFileName:@"ThemeClass0.plist" andThemeType:0];
    NSLog(@"加载皮肤-----%@-----",flag?@"成功":@"失败");
        
    // Override point for customization after application launch.
    return YES;
}


#pragma mark - UISceneSession lifecycle


- (UISceneConfiguration *)application:(UIApplication *)application configurationForConnectingSceneSession:(UISceneSession *)connectingSceneSession options:(UISceneConnectionOptions *)options {
    // Called when a new scene session is being created.
    // Use this method to select a configuration to create the new scene with.
    return [[UISceneConfiguration alloc] initWithName:@"Default Configuration" sessionRole:connectingSceneSession.role];
}


- (void)application:(UIApplication *)application didDiscardSceneSessions:(NSSet<UISceneSession *> *)sceneSessions {
    // Called when the user discards a scene session.
    // If any sessions were discarded while the application was not running, this will be called shortly after application:didFinishLaunchingWithOptions.
    // Use this method to release any resources that were specific to the discarded scenes, as they will not return.
}


@end
