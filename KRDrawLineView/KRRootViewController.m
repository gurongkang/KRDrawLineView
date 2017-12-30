//
//  ViewController.m
//  KRDrawLineView
//
//  Created by RK on 2017/12/2.
//  Copyright © 2017年 KR. All rights reserved.
//

#import "KRRootViewController.h"
#import "KRCodeViewController.h"
#import "KRXibViewController.h"
#import "KRAddLineViewController.h"

static  NSString *kKRTestViewCell = @"UITableViewCell";


@interface KRRootViewController () <UITableViewDataSource, UITableViewDelegate>

@property (nonatomic, strong) UITableView *tableView;

@end

@implementation KRRootViewController

#pragma mark life

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self.view addSubview:self.tableView];
    
    [self registerCell];
}

- (void)viewWillLayoutSubviews {
    [super viewWillLayoutSubviews];
    self.tableView.frame = self.view.bounds;
}

#pragma mark UITableViewDataSource

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return 3;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    UITableViewCell *cell = [self.tableView dequeueReusableCellWithIdentifier:kKRTestViewCell forIndexPath:indexPath];
    if (indexPath.row == 0) {
        cell.textLabel.text = @"代码中用 KRDrawLineView";
    }
    
    if (indexPath.row == 1) {
        cell.textLabel.text = @"xib中用 KRDrawLineView";
    }
    
    if (indexPath.row == 2) {
        cell.textLabel.text = @"添加分割线类Demo";
    }
    
    return cell;
}

#pragma mark UITableViewDelegate

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    if (indexPath.row == 0) {
        KRCodeViewController *codeVC = [[KRCodeViewController alloc]init];
        [self.navigationController pushViewController:codeVC animated:YES];
    }
    
    if (indexPath.row == 1) {
        KRXibViewController *xibVC = [[KRXibViewController alloc]init];
        [self.navigationController pushViewController:xibVC animated:YES];
    }
    
    if (indexPath.row == 2) {
        KRAddLineViewController *addLineVC = [[KRAddLineViewController alloc]init];
        [self.navigationController pushViewController:addLineVC animated:YES];
    }
}

#pragma mark tableView

- (void)registerCell {
    [self.tableView registerClass:[UITableViewCell class] forCellReuseIdentifier:kKRTestViewCell];
}

- (UITableView *)tableView {
    if (_tableView == nil) {
        _tableView = [[UITableView alloc]init];
        _tableView.rowHeight = 44;
        _tableView.dataSource = self;
        _tableView.delegate = self;
    }
    
    return _tableView;
}

@end
