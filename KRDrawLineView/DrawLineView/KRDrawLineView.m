//
//  KROnePixelView.m
//  KROnePixelView
//
//  Created by RK on 2017/12/2.
//  Copyright © 2017年 KR. All rights reserved.
//

#import "KRDrawLineView.h"

#define SINGLE_LINE_WIDTH (1 / [UIScreen mainScreen].scale)
#define SINGLE_LINE_ADJUST_OFFSET ((1 / [UIScreen mainScreen].scale) / 2)
#define VIEW_WIDTH self.bounds.size.width
#define VIEW_HEIGHT self.bounds.size.height

@implementation KRDrawLineView

- (instancetype)init {
    self = [super init];
    if (self) {
      [self setUpUI];
    }
    return self;
}

- (instancetype)initWithCoder:(NSCoder *)coder {
    if (self = [super initWithCoder:coder]) {
         [self setUpUI];
    }
    return self;
}

- (instancetype)initWithFrame:(CGRect)frame {
    self = [super initWithFrame:frame];
    if (self) {
        [self setUpUI];
    }
    return self;
}


- (void)setUpUI {
    self.backgroundColor = [UIColor clearColor];
    _lineStyle = KRDrawLineViewStyleSolidLine;
}

- (void)drawRect:(CGRect)rect {
    CGContextRef context = UIGraphicsGetCurrentContext();
    
    if (_lineColor == nil) {
        _lineColor = [UIColor lightGrayColor];
    }
    
    CGContextSetStrokeColorWithColor(context, self.lineColor.CGColor);
    CGContextSetShouldAntialias(context, NO);
    
    if (_lineStyle == KRDrawLineViewStyleDashLine) {
        CGFloat dasg[] = {1.0, 1.0};
        CGContextSetLineDash(context, 0, dasg, 2);
    }
    
    CGFloat width = _lineWidth;
    CGFloat adjustPixelOffset = 0;
    //画1像素线
    if (width < 1.1) {
        width = SINGLE_LINE_WIDTH;
        if (((int)(width * [UIScreen mainScreen].scale) + 1) % 2 == 0) {
            adjustPixelOffset = SINGLE_LINE_ADJUST_OFFSET;
        }
    }
    
    CGContextSetLineWidth(context, width);

    CGPoint startPoint, endPoint;
    
    if (VIEW_HEIGHT > VIEW_WIDTH) {
        //竖线
        startPoint = CGPointMake(VIEW_WIDTH / 2 - adjustPixelOffset, _paddingStart);
        endPoint = CGPointMake(VIEW_WIDTH / 2 - adjustPixelOffset, VIEW_HEIGHT - _paddingEnd);
    } else {
        //横线
        if (_isBottomLine) {
            startPoint = CGPointMake(_paddingStart, VIEW_HEIGHT - adjustPixelOffset);
            endPoint = CGPointMake(VIEW_WIDTH - _paddingEnd, VIEW_HEIGHT - adjustPixelOffset);
        } else {
            startPoint = CGPointMake(_paddingStart, VIEW_HEIGHT / 2 - adjustPixelOffset);
            endPoint = CGPointMake(VIEW_WIDTH - _paddingEnd, VIEW_HEIGHT / 2 - adjustPixelOffset);
        }
    }
    
    CGContextMoveToPoint(context, startPoint.x,startPoint.y);
    CGContextAddLineToPoint(context, endPoint.x, endPoint.y);
    
    CGContextStrokePath(context);
}

@end
