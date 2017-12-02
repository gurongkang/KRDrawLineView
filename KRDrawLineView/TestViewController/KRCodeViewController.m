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

@end

@implementation KRCodeViewController

#pragma mark life

- (void)viewDidLoad {
    [super viewDidLoad];
    
    //------------------1.基本使用-----------------------------
    [self.view addSubview:self.baseLabel];
    [self.view addSubview:self.baseDrawLineView];
}


- (void)viewWillLayoutSubviews {
    [super viewWillLayoutSubviews];
    
    //------------------1.基本使用-----------------------------
    self.baseLabel.frame = CGRectMake(8 , 64, self.view.bounds.size.width, 40);
    self.baseDrawLineView.frame = CGRectMake(0, 100, self.view.bounds.size.width, 20);
    
    
}

#pragma mark lazy

//------------------1.基本使用-----------------------------
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
    }
    return _baseDrawLineView;
}

@end
