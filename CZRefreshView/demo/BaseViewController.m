//
//  BaseViewController.m
//  CZRefreshView
//
//  Created by yunshan on 2019/4/23.
//  Copyright © 2019 ChenZhe. All rights reserved.
//

#import "BaseViewController.h"
#import <CZCategory/UIView+CZCategory.h>

@interface BaseViewController ()

@end

@implementation BaseViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    [self.view addSubview:self.refreshView];
    self.view.backgroundColor = [UIColor grayColor];
}

-(ProjectRefreshView *)refreshView
{
    if (!_refreshView) {
        _refreshView = [[ProjectRefreshView alloc] initWithFrame:CGRectMake(0, 174, self.view.width, self.view.height - 224)];
        _refreshView.delegate = self;
    }
    return _refreshView;
}

@end
