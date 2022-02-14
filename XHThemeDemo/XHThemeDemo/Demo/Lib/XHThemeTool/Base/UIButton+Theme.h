//
//  UIButton+Theme.h
//  ChangeSkin_Demo
//
//  Created by JXH on 2021/1/7.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface UIButton (Theme)

- (void)setTheme_BackgroundImage:(NSString *)imageName forState:(UIControlState)state;
- (void)setTheme_TitleColor:(NSString *)colorKey forState:(UIControlState)state;
- (void)setTheme_Image:(NSString *)imageName forState:(UIControlState)state;

@end

NS_ASSUME_NONNULL_END
