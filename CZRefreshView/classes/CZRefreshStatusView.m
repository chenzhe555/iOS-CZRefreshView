//
//  CZRefreshStatusView.m
//  CZRefreshView
//
//  Created by yunshan on 2019/4/23.
//  Copyright © 2019 ChenZhe. All rights reserved.
//

#import "CZRefreshStatusView.h"

@implementation CZRefreshStatusView

-(UIImage *)loadBundleImage:(NSString *)imageName
{
    return [UIImage imageWithContentsOfFile:[[NSBundle bundleWithPath:[[NSBundle mainBundle] pathForResource:@"CZRefreshViewResource" ofType:@"bundle"]] pathForResource:imageName ofType:@"png"]];
}

-(void)badRequest
{
    [self updateTitle:@"网络加载失败，请重试" content:nil image:[self loadBundleImage:@"cz_img_default_error"] imgUrl:nil imgSize:CGSizeMake(200, 200) btnText:@"重新加载"];
}

-(void)requestFail
{
    [self badRequest];
}

-(void)requestEmpty
{
    [self updateTitle:@"数据为空" content:nil image:[self loadBundleImage:@"cz_img_default_empty"] imgUrl:nil imgSize:CGSizeMake(200, 200) btnText:@"刷新"];
}

@end
