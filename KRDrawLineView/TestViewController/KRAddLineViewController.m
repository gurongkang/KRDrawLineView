//
//  KRAddLineViewController.m
//  KRDrawLineView
//
//  Created by RK on 2017/12/30.
//  Copyright © 2017年 KR. All rights reserved.
//

#import "KRAddLineViewController.h"
#import "UIView+KRLine.h"

@interface KRAddLineViewController ()


@end

@implementation KRAddLineViewController

- (void)viewDidLoad {
    [super viewDidLoad];

    self.view.backgroundColor = [UIColor lightGrayColor];
    
    UIView *testView  = [[UIView alloc]initWithFrame:CGRectMake(50, 100, 200, 200)];
    testView.backgroundColor = [UIColor whiteColor];
    
    [UIView kr_addTopLineToView:testView offsetLeft:10 offsetRight:8 color:[UIColor redColor]];
    
    [UIView kr_addRightLineToView:testView offsetLeft:10 offsetRight:0 color:[UIColor redColor]];
    [self.view addSubview:testView];
    
}

@end
