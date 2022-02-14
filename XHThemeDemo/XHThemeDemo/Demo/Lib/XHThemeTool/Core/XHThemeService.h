//
//  XHThemeService.h
//  XHThemeTool
//
//  Created by JXH on 2022/1/24.
//

#import <Foundation/Foundation.h>
#import "XHThemeHeader.h"


@interface XHThemeService : NSObject
#pragma mark - -------------- 服务相关 -----------------
#warning 必须先设置启动，才可使用自定义皮肤，否则设置皮肤将不生效
/**
 ⚠️启动 必须先设置此功能才
 启用自定义皮肤功能
 @param themeInfoName 需要使用的皮肤配置，传空，默认使用内置配置
 @param isNeedShowLog 是否显示Log （默认显示）
 */
+ (void)startThemeWithThemeInfo:(NSString *_Nullable)themeInfoName withLog:(BOOL)isNeedShowLog;
/**
 ⚠️修改
 根据配置中的类型，修改当前使用的皮肤
 @param themeType 皮肤类型（根据与配置*.plist 中的设置对应）
 */
+ (void)changeSkinWithSkinType:(NSInteger)themeType;
#pragma mark - -------------- 数据相关-----------------
/**
 ⚠️获取当前配置所有的皮肤数据
 @return 对象数组(XHThemeInfoModel)
 */
+ (NSArray <XHThemeInfoModel *>*_Nullable)getThemeInfoModelArray;
/**
 ⚠️获取当前的皮肤配置名
 @return 字符串，皮肤配置文件名
 */
+ (NSString *_Nullable)getThemeInfoName;
/**
 ⚠️获取当前的皮肤类型
 @return 皮肤类型（与皮肤配置对应）
 */
+ (NSInteger)getCurrentThemeType;

@end


