//
//  UINavigationBar+Theme.h
//  ChangeSkin_Demo
//
//  Created by JXH on 2021/1/8.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface UINavigationBar (Theme)
/** barTintColor*/
@property (nonatomic, copy) NSString *theme_barTintColor;
/** backIndicateImage*/
@property (nonatomic, copy) NSString *theme_backIndicatorImage;
/** backIndicateImage*/
@property (nonatomic, copy) NSString *theme_backIndicatorTransitionMaskImage;

/** backgrouimage*/
- (void)setTheme_BackgroundImage:(NSString *)imageName forBarMetrics:(UIBarMetrics)barMetrics;

@end

NS_ASSUME_NONNULL_END
