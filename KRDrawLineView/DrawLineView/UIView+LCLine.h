//
//  UIView+LCLine.h
//  OneGo
//
//  Created by RK on 2017/5/29.
//  Copyright © 2017年 顾荣康. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIView (LCLine)

/**
 添加顶部线条

 @param view 视图
 @param left 左边距
 @param right 右边距
 @param color 颜色
 */
+ (void)lc_addTopLineToView:(UIView *)view
              offsetLeft:(CGFloat)left
             offsetRight:(CGFloat)right
                   color:(UIColor *)color;

/**
 添加底部线条

 @param view 视图
 @param left 左边距
 @param right 右边距
 @param color 颜色
 */
+ (void)lc_addBottomLineToView:(UIView *)view
                 offsetLeft:(CGFloat)left
                offsetRight:(CGFloat)right
                      color:(UIColor *)color;

/**
 添加顶部线条

 @param view 视图
 @param color 颜色
 */
+ (void)lc_addTopLineToView:(UIView *)view color:(UIColor *)color;

/**
 添加底部底部线条

 @param view 视图
 @param color 颜色
 */
+ (void)lc_addBottomLineToView:(UIView *)view color:(UIColor *)color;

/**
 添加底部底部线条
 
 @param view 视图
 @param color 颜色
 */
+ (void)lc_addRightLineToView:(UIView *)view color:(UIColor *)color;

+ (void)lc_addRightLineToView:(UIView *)view
                offsetLeft:(CGFloat)x
               offsetRight:(CGFloat)y
                     color:(UIColor *)color;

@end
