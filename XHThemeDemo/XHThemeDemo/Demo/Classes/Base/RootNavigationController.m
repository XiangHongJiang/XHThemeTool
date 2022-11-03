//
//  RootNavigationController.m
//  iOS_ThemeForOC
//
//  Created by mryel on 2022/10/18.
//

#import "RootNavigationController.h"

@interface RootNavigationController ()

@end

@implementation RootNavigationController

- (void)pushViewController:(UIViewController *)viewController animated:(BOOL)animated {
    if (self.childViewControllers.count) {
        viewController.hidesBottomBarWhenPushed = YES;
        viewController.view.theme_backGroundColor = ThemeColor_AppMainColor_Exam;
    }
    [super pushViewController:viewController animated:animated];
}



@end
