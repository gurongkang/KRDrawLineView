//
//  KRCodeViewController.m
//  KRDrawLineView
//
//  Created by RK on 2017/12/2.
//  Copyright © 2017年 KR. All rights reserved.
//

#import "KRCodeViewController.h"
#import "KRDrawLineView.h"

@interface KRCodeViewController ()

@property (nonatomic, strong) UILabel *baseLabel;
@property (nonatomic, strong) KRDrawLineView *baseDrawLineView;

@property (nonatomic, strong) UILabel *dashLabel;
@property (nonatomic, strong) KRDrawLineView *dashDrawLineView;

@property (nonatomic, strong) UILabel *vLabel;
@property (nonatomic, strong) KRDrawLineView *vDrawLineView;

@end

@implementation KRCodeViewController

#pragma mark life

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self.view addSubview:self.baseLabel];
    [self.view addSubview:self.baseDrawLineView];
    
    [self.view addSubview:self.dashLabel];
    [self.view addSubview:self.dashDrawLineView];
    
    [self.view addSubview:self.vLabel];
    [self.view addSubview:self.vDrawLineView];
}


- (void)viewWillLayoutSubviews {
    [super viewWillLayoutSubviews];
    
    self.baseLabel.frame = CGRectMake(8 , 64, self.view.bounds.size.width, 40);
    self.baseDrawLineView.frame = CGRectMake(0, 100, self.view.bounds.size.width, 20);
    
    self.dashLabel.frame = CGRectMake(8 , 124, self.view.bounds.size.width, 40);
    self.dashDrawLineView.frame = CGRectMake(0, 164, self.view.bounds.size.width, 20);
    

    self.vLabel.frame = CGRectMake(8 , 184, self.view.bounds.size.width, 40);
    //当高>宽时候认为竖线，否则认为画横线
    self.vDrawLineView.frame = CGRectMake(60, 224, 20, 200);
}

#pragma mark lazy

- (UILabel *)baseLabel {
    if (_baseLabel == nil) {
        _baseLabel = [[UILabel alloc]init];
        _baseLabel.text = @"1.基本使用";
    }
    return _baseLabel;
}

- (KRDrawLineView *)baseDrawLineView {
    if (_baseDrawLineView == nil) {
        _baseDrawLineView = [[KRDrawLineView alloc]init];
        _baseDrawLineView.lineWidth = 1;
        _baseDrawLineView.backgroundColor = [UIColor yellowColor];
        //默认线居中，开启在view的底部，一般用在花分割线，比如UITableView的cell中
        _baseDrawLineView.isBottomLine = YES;
    }
    return _baseDrawLineView;
}

- (UILabel *)dashLabel {
    if (_dashLabel == nil) {
        _dashLabel = [[UILabel alloc]init];
        _dashLabel.text = @"2.虚线使用";
    }
    return _dashLabel;
}

- (KRDrawLineView *)dashDrawLineView {
    if (_dashDrawLineView == nil) {
        _dashDrawLineView = [[KRDrawLineView alloc]init];
        //线宽度，pixel单位
        _dashDrawLineView.lineWidth = 1;
        //线样式
        _dashDrawLineView.lineStyle = KRDrawLineViewStyleDashLine;
        //线颜色
        _dashDrawLineView.lineColor = [UIColor redColor];
        //起点内边距
        _dashDrawLineView.paddingStart = 10;
        //结束点内边距
        _dashDrawLineView.paddingEnd = 40;
    }
    return _dashDrawLineView;
}

- (UILabel *)vLabel {
    if (_vLabel == nil) {
        _vLabel = [[UILabel alloc]init];
        _vLabel.text = @"3.竖线使用";
    }
    return _vLabel;
}

- (KRDrawLineView *)vDrawLineView {
    if (_vDrawLineView == nil) {
        _vDrawLineView = [[KRDrawLineView alloc]init];
        _vDrawLineView.lineWidth = 1;
        _vDrawLineView.backgroundColor = [UIColor yellowColor];
    }
    return _vDrawLineView;
}

@end
