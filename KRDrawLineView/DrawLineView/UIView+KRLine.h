//
//  UIView+LCLine.h
//  OneGo
//
//  Created by RK on 2017/5/29.
//  Copyright © 2017年 顾荣康. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIView (KRLine)

/**
 添加顶部线条
 
 @param view 视图
 @param color 颜色
 */
+ (void)kr_addTopLineToView:(UIView *)view color:(UIColor *)color;

/**
 添加顶部线条

 @param view 视图
 @param left 左边距
 @param right 右边距
 @param color 颜色
 */
+ (void)kr_addTopLineToView:(UIView *)view
              offsetLeft:(CGFloat)left
             offsetRight:(CGFloat)right
                   color:(UIColor *)color;

/**
 添加底部线条
 
 @param view 视图
 @param color 颜色
 */
+ (void)kr_addBottomLineToView:(UIView *)view color:(UIColor *)color;

/**
 添加底部线条

 @param view 视图
 @param left 左边距
 @param right 右边距
 @param color 颜色
 */
+ (void)kr_addBottomLineToView:(UIView *)view
                 offsetLeft:(CGFloat)left
                offsetRight:(CGFloat)right
                      color:(UIColor *)color;

/**
 添加右边线条
 
 @param view 视图
 @param color 颜色
 */
+ (void)kr_addRightLineToView:(UIView *)view color:(UIColor *)color;


/**
 添加右边线条

 @param view 视图
 @param x 上边距
 @param y 下边距
 @param color 颜色
 */
+ (void)kr_addRightLineToView:(UIView *)view
                offsetTop:(CGFloat)x
               offsetBottom:(CGFloat)y
                     color:(UIColor *)color;



/**
 添加中间任意位置的横线

 @param view 添加的视图
 @param left 左边距
 @param right 右边距
 @param top 上边距
 @param color 颜色
 */
+ (void)kr_addMiddleLineToView:(UIView *)view
                    offsetLeft:(CGFloat)left
                   offsetRigth:(CGFloat)right
                     offsetTop:(CGFloat)top
                         color:(UIColor *)color;

@end
