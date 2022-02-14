//
//  UITabBarItem+Theme.h
//  ChangeSkin_Demo
//
//  Created by JXH on 2021/1/20.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface UITabBarItem (Theme)
/** 图片*/
@property (nonatomic, copy) NSString *theme_image;
/** 图片选中*/
@property (nonatomic, copy) NSString *theme_selectedImage;
/** 设置item图片*/
- (instancetype)initWithTitle:(nullable NSString *)title theme_image:(nullable NSString *)imageName theme_selectedImage:(nullable NSString *)selectedImageName API_AVAILABLE(ios(7.0));
/** 设置文字颜色*/
- (void)setTitleText_ThemeForegroundColor:(nullable NSString*)foregroundColorStr forState:(UIControlState)state API_AVAILABLE(ios(5.0)) UI_APPEARANCE_SELECTOR;


@end

NS_ASSUME_NONNULL_END
