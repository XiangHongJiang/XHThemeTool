//
//  CAShapeLayer+Theme.h
//  ChangeSkin_Demo
//
//  Created by JXH on 2021/1/8.
//

#import <QuartzCore/QuartzCore.h>

NS_ASSUME_NONNULL_BEGIN

@interface CAShapeLayer (Theme)

/** fillColor色*/
@property (nonatomic, copy) NSString *theme_fillColor;
/** strokeColor色*/
@property (nonatomic, copy) NSString *theme_strokeColor;

@end

NS_ASSUME_NONNULL_END
