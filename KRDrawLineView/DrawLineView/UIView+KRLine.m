//
//  UIView+LCLine.m
//  OneGo
//
//  Created by RK on 2017/5/29.
//  Copyright © 2017年 顾荣康. All rights reserved.
//

#import "UIView+KRLine.h"
#import "KRDrawLineView.h"


static float kKRLinePx = 1;

@implementation UIView (KRLine)

+ (void)kr_addTopLineToView:(UIView *)view
                 offsetLeft:(CGFloat)left
                offsetRight:(CGFloat)right
                      color:(UIColor *)color {
    [self addTopLineToView:view offsetLeft:left offsetRight:right color:color];
}

+ (void)kr_addBottomLineToView:(UIView *)view
                    offsetLeft:(CGFloat)left
                   offsetRight:(CGFloat)right
                         color:(UIColor *)color {
    [self addBottomLineToView:view offsetLeft:left offsetRight:right color:color];
}

+ (void)kr_addTopLineToView:(UIView *)view color:(UIColor *)color {
    [self addTopLineToView:view offsetLeft:0 offsetRight:0 color:color];
}

+ (void)kr_addBottomLineToView:(UIView *)view color:(UIColor *)color {
    [self addBottomLineToView:view offsetLeft:0 offsetRight:0 color:color];
}

+ (void)kr_addRightLineToView:(UIView *)view color:(UIColor *)color {
    [self kr_addRightLineToView:view offsetLeft:0 offsetRight:0 color:color];
}

+ (void)delTopLine:(UIView *)view {
    UIView *v = [view viewWithTag:54321];
    
    if ([v isKindOfClass:[KRDrawLineView class]] && 54321 == v.tag) {
        [v removeFromSuperview];
    }
}

+ (void)delBottomLine:(UIView *)view {
    UIView *v = [view viewWithTag:12345];
    
    if ([v isKindOfClass:[KRDrawLineView class]] && 12345 == v.tag) {
        [v removeFromSuperview];
    }
}

+ (void)delRightLine:(UIView *)view {
    UIView *v = [view viewWithTag:15457];
    
    if ([v isKindOfClass:[KRDrawLineView class]] && 15457 == v.tag) {
        [v removeFromSuperview];
    }
}


+ (void)addTopLineToView:(UIView *)view
              offsetLeft:(CGFloat)x
             offsetRight:(CGFloat)y
                   color:(UIColor *)color {
    [self delTopLine:view];
    KRDrawLineView *v =
    [[KRDrawLineView alloc] initWithFrame:CGRectMake(0, 0, view.frame.size.width, kKRLinePx)];
    v.lineWidth = kKRLinePx;
    v.lineColor = color;
    v.tag = 54321;
    v.paddingStart = x;
    v.paddingEnd = y;
    v.autoresizingMask = UIViewAutoresizingFlexibleWidth | UIViewAutoresizingFlexibleBottomMargin;
    [view addSubview:v];
}

+ (void)lc_addRightLineToView:(UIView *)view
                 offsetLeft:(CGFloat)x
                offsetRight:(CGFloat)y
                      color:(UIColor *)color {
    [self delRightLine:view];
    
    KRDrawLineView *v =
    [[KRDrawLineView alloc] initWithFrame:CGRectMake(view.frame.size.width-kKRLinePx, x,
                                                 kKRLinePx, view.frame.size.height-x-y)];
    v.lineWidth = kKRLinePx;
    v.lineColor = color;
    v.tag = 15457;
    v.paddingStart = x;
    v.paddingEnd = y;
    v.autoresizingMask = UIViewAutoresizingFlexibleWidth | UIViewAutoresizingFlexibleTopMargin;
    [view addSubview:v];

}

+ (void)addBottomLineToView:(UIView *)view
                 offsetLeft:(CGFloat)x
                offsetRight:(CGFloat)y
                      color:(UIColor *)color {
    [self delBottomLine:view];
    
    KRDrawLineView *v =
    [[KRDrawLineView alloc] initWithFrame:CGRectMake(0, view.frame.size.height - kKRLinePx,
                                                  view.frame.size.width, kKRLinePx)];
    v.lineWidth = kKRLinePx;
    v.lineColor = color;
    v.tag = 12345;
    v.paddingStart = x;
    v.paddingEnd = y;
    v.isBottomLine = YES;
    v.autoresizingMask = UIViewAutoresizingFlexibleWidth | UIViewAutoresizingFlexibleTopMargin;
    [view addSubview:v];
}


@end
