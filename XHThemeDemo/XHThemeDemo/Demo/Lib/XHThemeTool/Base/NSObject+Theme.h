//
//  NSObject+Theme.h
//  ChangeSkin_Demo
//
//  Created by JXH on 2021/1/5.
//

#import <Foundation/Foundation.h>
#import "XHThemeManager.h"
/**
 换肤通知的Key
 */
FOUNDATION_EXPORT NSString * _Nonnull const NotiSkinChangedKey;

@interface NSObject (Theme)
/**注册换肤监听，不会重复监听 */
- (void)theme_registChangedNotification;
/** 子类重写，收到换肤通知会调用本方法*/
- (void)theme_didChanged;
@end

