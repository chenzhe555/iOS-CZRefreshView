//
//  NormalViewController.m
//  CZRefreshView
//
//  Created by yunshan on 2019/4/23.
//  Copyright © 2019 ChenZhe. All rights reserved.
//

#import "NormalViewController.h"

@interface NormalViewController ()

@end

@implementation NormalViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.title = @"Normal测试";
    [self addButtons];
    [self.refreshView updateAll];
}

-(void)addButtons
{
    CGFloat y = 0;
    for(int i = 0; i < 50; ++i) {
        UILabel * label = [[UILabel alloc] init];
        label.frame = CGRectMake(50, y, 200, 20);
        label.text = [NSString stringWithFormat:@"Normal测试(%lu)",(long)i];
        [self.refreshView cz_addSubview:label];
        y = y + 20 + 15;
    }
}

-(void)loadNewData
{
    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(1 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
        [self.refreshView requestEmpty];
    });
}

@end
