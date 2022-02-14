//
//  UIView+Theme.h
//  ChangeSkin_Demo
//
//  Created by JXH on 2021/1/7.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface UIView (Theme)
/** 背景色*/
@property (nonatomic, copy) NSString *theme_backGroundColor;
/** tintColor色*/
@property (nonatomic, copy) NSString *theme_tintColor;

@end

NS_ASSUME_NONNULL_END
