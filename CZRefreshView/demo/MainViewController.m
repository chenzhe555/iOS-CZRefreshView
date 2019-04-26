//
//  MainViewController.m
//  CZRefreshView
//
//  Created by yunshan on 2019/4/23.
//  Copyright © 2019 ChenZhe. All rights reserved.
//

#import "MainViewController.h"
#import "NormalViewController.h"

@interface MainViewController ()
@end

@implementation MainViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    self.title = @"CZFreshView";
}
- (IBAction)normalAction:(id)sender {
    NormalViewController * vc = [[NormalViewController alloc] init];
    [self.navigationController pushViewController:vc animated:YES];
}
- (IBAction)tableViewAction:(id)sender {
    
}

@end
