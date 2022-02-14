//
//  XHThemeManager.h
//  XHThemeTool
//
//  Created by JXH on 2022/1/24.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

#pragma mark - -------------- define -----------------
#define TColor(name) [XHThemeManager theme_ColorWithColorKey:name]
#define TImage(name) [XHThemeManager theme_ImageWithName:name]

@interface XHThemeManager : NSObject
#pragma mark - -------------- Debug -----------------
/** 是否显示图片加载成功与否log*/
@property (nonatomic, assign) BOOL showLog;
#pragma mark - -------------- 启动 -----------------
/** 单例对象*/
+ (instancetype)sharedThemeManager;
/** ⚠️启动皮肤：必须，传空默认使用内置示例皮肤设置:XHThemeInfo.plist*/
- (BOOL)startThemeWithThemeInfo:(NSString *_Nullable)themeInfoName;
#pragma mark - -------------- Property:属性 -----------------
/** 配置文件名：默认使用内置XHThemeInfo.plist,需可自定义配置文件：例如：ThemeInfo（==ThemeInfo.plist）*/
@property (nonatomic, copy, readonly) NSString * _Nullable themeInfoName;
/** 皮肤列表数组*/
@property (nonatomic, copy ,readonly) NSArray * _Nullable themeInfoModelArray;
/** 当前皮肤模式*/
@property (nonatomic, assign, readonly) NSInteger currentThemeType;
#pragma mark - -------------- Method:方法接口 -----------------
/** 更换皮肤*/
+ (void)changeSkinWithSkinType:(NSInteger)type;
/** 获取皮肤颜色*/
+ (UIColor *_Nullable)theme_ColorWithColorKey:(NSString *_Nonnull)colorKey;
/** 获取皮肤图片*/
+ (UIImage *_Nullable)theme_ImageWithName:(NSString *_Nonnull)imageName;
@end

@interface XHThemeInfoModel : NSObject
/** name*/
@property (nonatomic, copy) NSString * _Nullable name;
/** address*/
@property (nonatomic, copy) NSString * _Nullable address;
/** type*/
@property (nonatomic, copy) NSString * _Nullable type;
/** bundlePath(Image、color.plist)*/
@property (nonatomic, copy) NSString * _Nullable bundlePath;
/** bundleSkin_Color*/
@property (nonatomic, copy) NSDictionary * _Nullable skinColorDict;
@end
