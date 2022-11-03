//
//  XHThemeManager.h
//  XHThemeTool
//
//  Created by JXH on 2022/1/24.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>
/**
 换肤通知的Key
 */
FOUNDATION_EXPORT NSString * _Nonnull const NotiSkinChangedKey;

#pragma mark - -------------- define -----------------
#define TColor(name) [XHThemeManager theme_ColorWithColorKey:name]
#define TImage(name) [XHThemeManager theme_ImageWithName:name]

/** 沙盒资源文件夹路径*/
#define DocumentThemePath [NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES).firstObject stringByAppendingString:@"/ThemeSource/"]

/** 配置文件路径：优先取bundle同名，再查沙盒同名(不要修改此宏)*/
#define ThemeConfigPath(fileName) [XHThemeManager themeFilePathWithThemeFileName:fileName andFileType:@".plist"]



NS_ASSUME_NONNULL_BEGIN
@class XHThemeItemModel;
@interface XHThemeManager : NSObject

#pragma mark - -------------- Property -----------------
/** 是否显示Log：debug默认YES，其他默认NO*/
@property (nonatomic, assign) BOOL isShowLog;
/** 当前主题皮肤信息列表*/
@property (nonatomic, copy ,readonly) NSArray * _Nullable currentThemeInfoModelArray;
/** 当前皮肤模式*/
@property (nonatomic, assign, readonly) NSInteger currentThemeType;
/** 皮肤文件信息: xxx.plist*/
@property (nonatomic, copy, readonly) NSString * _Nullable  themeConfigName;
#pragma mark - -------------- init -----------------
/** 单例*/
+ (instancetype _Nullable )sharedThemeManager;
#pragma mark - -------------- ⚠️启动 -----------------
/** 启用定义皮肤：有设置过，取之前设置过，无设置过，使用当下传入的配置*/
- (BOOL)startThemeWithBaseFileName:(NSString *_Nullable)themeFileName andThemeType:(NSInteger)themeType;
/** 关闭皮肤*/
- (void)stopTheme;
#pragma mark - -------------- ⚠️换肤 -----------------
/** 更换皮肤配置与显示类型：一般更换主题*/
+ (BOOL)updateThemeWithThemeFile:(NSString *_Nullable)themeFileName andThemeType:(NSInteger)themeType;
/** 更换当前主题(配置)的皮肤：配置(主题)不变，类型(皮肤)更换*/
+ (BOOL)changeSkinWithSkinType:(NSInteger)themeType;
#pragma mark - -------------- support theme method-----------------
/** 获取皮肤颜色*/
+ (UIColor *_Nullable)theme_ColorWithColorKey:(NSString *_Nonnull)colorKey;
/** 获取皮肤图片*/
+ (UIImage *_Nullable)theme_ImageWithName:(NSString *_Nonnull)imageName;
/** 获取皮肤信息列表*/
#pragma mark - -------------- support getter-----------------
+ (NSArray *_Nullable)getThemInfoModelArrayWithThemeFileName:(NSString *_Nullable)themeFileName;
/** 获取文件所在的路径：bundle 或 沙盒*/
+ (NSString *)themeFilePathWithThemeFileName:(NSString *)themeFileName andFileType:(NSString *)fileType;
/** 获取当前使用的皮肤Item*/
+ (XHThemeItemModel *)getCurrentThemeItemInfoModel;
@end

/** 主题下皮肤Item*/
@interface XHThemeItemModel : NSObject
/** name*/
@property (nonatomic, copy) NSString * _Nullable name;
/** address*/
@property (nonatomic, copy) NSString * _Nullable address;
/** type*/
@property (nonatomic, copy) NSString * _Nullable type;
/** bundlePath or SandBoxPath(Image、color.plist)*/
@property (nonatomic, copy) NSString * _Nullable imgsFilePath;
/** bundleSkin_Color*/
@property (nonatomic, copy) NSDictionary * _Nullable colors;
/** 获取颜色*/
- (UIColor *_Nullable)theme_ColorWithColorKey:(NSString *_Nonnull)colorKey;
@end

NS_ASSUME_NONNULL_END
