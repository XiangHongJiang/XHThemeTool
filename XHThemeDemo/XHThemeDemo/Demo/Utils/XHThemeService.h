//
//  XHThemeService.h
//  iOS_ThemeForOC
//
//  Created by mryel on 2022/10/24.
//

#import <Foundation/Foundation.h>

static NSString * const themeClassFile0 = @"ThemeClass0.plist";
static NSString * const themeClassFile1 = @"ThemeClass1.plist";

@class ThemeClassInfoModel;
@interface XHThemeService : NSObject
/** 获取当前支持的主题列表*/
+ (NSMutableArray <ThemeClassInfoModel *> *)getLocalThemeClassInfoArray;
/** 模拟下载皮肤*/
+ (void)downLoadThemeZipFile;

@end


/** 皮肤主题*/
@interface ThemeClassInfoModel : NSObject
/** 主题名*/
@property (nonatomic, copy) NSString *title;
/** 文件名*/
@property (nonatomic, copy) NSString *fileName;
/** 皮肤数据列表*/
@property (nonatomic, copy) NSArray<XHThemeItemModel *> *themeInfoModelArray;

+ (instancetype)modelWithDict:(NSDictionary *)dict;

@end
