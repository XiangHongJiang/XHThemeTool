//
//  CALayer+Theme.h
//  ChangeSkin_Demo
//
//  Created by JXH on 2021/1/7.
//

#import <QuartzCore/QuartzCore.h>

NS_ASSUME_NONNULL_BEGIN

@interface CALayer (Theme)
/** 背景色*/
@property (nonatomic, copy) NSString *theme_backGroundColor;
/** boreder色*/
@property (nonatomic, copy) NSString *theme_borderColor;
/** shadowColor色*/
@property (nonatomic, copy) NSString *theme_shadowColor;


@end

NS_ASSUME_NONNULL_END
