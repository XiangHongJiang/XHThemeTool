//
//  XHThemeConfigExam.h
//  ChangeSkin_Demo
//
//  Created by JXH on 2021/1/5.
//
#import <Foundation/Foundation.h>
/**
 颜色示例：
 1、可设置颜色对应的 key，与*.plist 里的颜色key一致。（建议这么做）
 2、如果嫌麻烦不设置key，使用时保证与 *.plist里的颜色key一致即可。（不建议这么做）
 
 关于多语言：
 1、内置的就自己适配翻译吧。
 2、服务器下发的，下发给字段吧(需要支持的多语言列表，主要是皮肤名称)。
 */
#pragma mark - -------------- 背景色 -----------------
/**
 皮肤主色: #FFFFFF>#ef5b9c
 */
FOUNDATION_EXPORT NSString * _Nonnull const ThemeColor_AppMainColor_Exam;
/**
 线条色:   #1d953f>#5f3c23
 */
FOUNDATION_EXPORT NSString * _Nonnull const ThemeColor_LineColor_Exam;
#pragma mark - -------------- 文字颜色 -----------------
/**
 文字颜色：#333333 >#999999
 */
FOUNDATION_EXPORT NSString * _Nonnull const ThemeColor_Text_Color_Default_Exam;



