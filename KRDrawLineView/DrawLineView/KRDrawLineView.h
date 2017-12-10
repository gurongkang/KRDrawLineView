//
//  KROnePixelView.h
//  KROnePixelView
//
//  Created by RK on 2017/12/2.
//  Copyright © 2017年 KR. All rights reserved.
//

#import <UIKit/UIKit.h>

typedef NS_ENUM(NSInteger, KRDrawLineViewStyle) {
    KRDrawLineViewStyleSolidLine,//实线
    KRDrawLineViewStyleDashLine //点线
};

@interface KRDrawLineView : UIView

@property (nonatomic, assign) KRDrawLineViewStyle lineStyle;

/**
 线宽 px
 */
@property (nonatomic, assign) IBInspectable  CGFloat lineWidth;

/**
 线的颜色
 */
@property (nonatomic, strong) IBInspectable  UIColor *lineColor;

/**
 线起点边距
 */
@property (nonatomic, assign) IBInspectable CGFloat paddingStart;

/**
 线结束边距
 */
@property (nonatomic, assign) IBInspectable CGFloat paddingEnd;

/**
 是否是底部
 */
@property (nonatomic, assign) IBInspectable BOOL isBottomLine;

@end
