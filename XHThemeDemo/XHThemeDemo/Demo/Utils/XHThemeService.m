//
//  XHThemeService.m
//  iOS_ThemeForOC
//
//  Created by mryel on 2022/10/24.
//

#import "XHThemeService.h"

#import "SSZipArchive.h"


@implementation XHThemeService

/** 获取当前支持的主题列表*/
+ (NSMutableArray <ThemeClassInfoModel *> *)getLocalThemeClassInfoArray {
    
    //1.本地
    NSMutableArray *mA = [NSMutableArray array];
    NSArray *themeInfoA = @[
                        @{@"fileName":@"",@"title":@"无主题"},
                        @{@"fileName":themeClassFile0,@"title":@"系统主题"},
                        @{@"fileName":themeClassFile1,@"title":@"其他主题"},
    ];
    for (NSDictionary *dataDict in themeInfoA) {
        ThemeClassInfoModel *model = [ThemeClassInfoModel modelWithDict:dataDict];
        [mA addObject:model];
    }
    
    //2.沙盒
    NSString *sandPath = DocumentThemePath;
    NSFileManager *fm = [NSFileManager defaultManager];
    NSArray *dirA = [fm contentsOfDirectoryAtPath:sandPath error:nil];
    for (NSString *themeClassName in dirA) {
        if([themeClassName hasSuffix:@".DS_Store"]) continue;
        ThemeClassInfoModel *model = [ThemeClassInfoModel new];
        model.fileName = themeClassName;
        model.title = [@"沙盒主题-" stringByAppendingString:themeClassName];
        [mA addObject:model];
    }
    
    return mA;
    
}
/** 模拟下载皮肤*/
+ (void)downLoadThemeZipFile {
    
    NSString *unzipFile = [[NSBundle mainBundle] pathForResource:@"ThemeSandBox0" ofType:@".zip"];
    NSFileManager *fm = [NSFileManager defaultManager];
    if(![fm fileExistsAtPath:[DocumentThemePath stringByAppendingString:@"ThemeSandBox0"]]){

        BOOL flag = [SSZipArchive unzipFileAtPath:unzipFile toDestination:DocumentThemePath];
        NSLog(@"ThemeSandBox0.zip--- 下载到沙盒---%@---",flag?@"成功":@"失败");

    }else {
        NSLog(@"ThemeSandBox0.zip--- 已存在---");
    }
    
}
@end


@implementation ThemeClassInfoModel

+ (instancetype)modelWithDict:(NSDictionary *)dict {
    ThemeClassInfoModel *model = [self new];
    model.fileName = dict[@"fileName"];
    model.title = dict[@"title"];
    return model;
}
- (void)setFileName:(NSString *)fileName {
    _fileName = fileName;
    self.themeInfoModelArray = [XHThemeManager getThemInfoModelArrayWithThemeFileName:fileName];
}

@end

