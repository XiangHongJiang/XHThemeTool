//
//  RootTabViewController.m
//  iOS_ThemeForOC
//
//  Created by mryel on 2022/10/17.
//

#import "RootTabViewController.h"
#import "RootNavigationController.h"

#import "HomeViewController.h"
#import "MineViewController.h"

@interface RootTabViewController ()

@end

@implementation RootTabViewController
#pragma mark - LazyLoad 懒加载

#pragma mark - System Method 系统方法

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    /** 配置 */
    [self configNavi];
    [self configSubItems];
    
    
}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
#pragma mark - Custom Method 自定义方法
- (void)configNavi {
    
    if (@available(iOS 13.0, *) ) {
        UINavigationBarAppearance * appearance = [[UINavigationBarAppearance alloc] init];
        [appearance configureWithTransparentBackground];// 去除横线
        appearance.titleTextAttributes = @{NSForegroundColorAttributeName:UIColor.blackColor};// 导航栏标题颜色
        [UINavigationBar appearance].standardAppearance = appearance;
        [UINavigationBar appearance].scrollEdgeAppearance = appearance;
        [[UINavigationBar appearance] setScrollEdgeAppearance:appearance];
        [[UINavigationBar appearance] setStandardAppearance:appearance];
        [UINavigationBar appearance].theme_backGroundColor = ThemeColor_AppMainColor_Exam;
    }
    
    if (@available(iOS 13.0, *)) {
        UITabBarAppearance * appearance = [[UITabBarAppearance alloc] init];
        appearance.backgroundColor = TColor(ThemeColor_AppMainColor_Exam);
        appearance.stackedLayoutAppearance.normal.titleTextAttributes = @{NSForegroundColorAttributeName:UIColor.blackColor};// tabbar未选中字体颜色
        appearance.stackedLayoutAppearance.selected.titleTextAttributes = @{NSForegroundColorAttributeName:UIColor.blueColor};// tabbar选中字体颜色
        appearance.stackedLayoutAppearance.normal.iconColor = UIColor.blackColor;// tabbar未选中图片颜色
        [UITabBar appearance].scrollEdgeAppearance = appearance;
        [UITabBar appearance].standardAppearance = appearance;
//        [UITabBar appearance].theme_backGroundColor = ThemeColor_AppMainColor_Exam;
//        [UITabBar appearance].theme_tintColor = ThemeColor_AppMainColor_Exam;
//        [UITabBar appearance].theme_barTintColor = ThemeColor_AppMainColor_Exam;
        
        
    }
    
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(themeChange) name:NotiSkinChangedKey object:nil];
    
    
}
- (void)themeChange {
    NSLog(@"themeChange---皮肤改变----");
    if (@available(iOS 13.0, *)) {
        UITabBarAppearance * appearance = [UITabBar appearance].standardAppearance;
        appearance.backgroundColor = TColor(ThemeColor_AppMainColor_Exam);
        [UITabBar appearance].standardAppearance = appearance;
    }
}
- (void)configSubItems {
    
    UIViewController *homeVc = [self naviItemWithCtrl:HomeViewController.new withTitle:@"首页"];
    UIViewController *mineVc = [self naviItemWithCtrl:MineViewController.new withTitle:@"我的"];
    
    self.viewControllers = @[homeVc,mineVc];
    
}

- (UIViewController *)naviItemWithCtrl:(UIViewController *)ctrl withTitle:(NSString *)title{
    
    RootNavigationController *navI = [[RootNavigationController alloc] initWithRootViewController:ctrl];
    ctrl.title = title;
    return navI;
}



@end
