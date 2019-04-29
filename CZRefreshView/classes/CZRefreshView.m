//
//  CZRefreshView.m
//  CZRefreshView
//
//  Created by yunshan on 2019/4/23.
//  Copyright © 2019 ChenZhe. All rights reserved.
//

#import "CZRefreshView.h"
#import <CZCategorys/UIView+CZCategory.h>
#import <MJRefresh/MJRefresh.h>

@interface CZRefreshView ()
/**
 @brief CZRefreshViewNormal 容器视图
 */
@property (nonatomic, strong) UIScrollView * scrollView;
@end

@implementation CZRefreshView

- (instancetype)init
{
    self = [super init];
    if (self) {
        self.type = CZRefreshViewNone;
    }
    return self;
}

#pragma mark 属性
-(UIScrollView *)scrollView
{
    if (!_scrollView) {
        _scrollView = [[UIScrollView alloc] initWithFrame:self.bounds];
    }
    return _scrollView;
}

#pragma mark 方法实现
-(void)updateAll
{
    switch (self.type) {
        case CZRefreshViewNormal:
        {
            if (!self.scrollView.superview) [self addSubview:self.scrollView];
            // 添加头部刷新视图
            if (self.delegate && [self.delegate respondsToSelector:@selector(cz_freshViewWithHeader)]) {
                self.scrollView.mj_header = (MJRefreshHeader *)[self.delegate cz_freshViewWithHeader];
            } else {
                self.scrollView.mj_header = [MJRefreshNormalHeader headerWithRefreshingTarget:self refreshingAction:@selector(loadNewData)];
                ((MJRefreshNormalHeader *)self.scrollView.mj_header).lastUpdatedTimeLabel.hidden = YES;
            }
        }
            break;
            
        default:
            break;
    }
    [self updateFrameContent];
}

-(void)cz_addSubview:(UIView *)view
{
    switch (self.type) {
        case CZRefreshViewNone:
        {
            [self addSubview:view];
        }
            break;
        case CZRefreshViewNormal:
        {
            if (!self.scrollView.superview) [self addSubview:self.scrollView];
            [self.scrollView addSubview:view];
        }
            break;
            
        default:
            break;
    }
}

#pragma mark 自定义方法
/**
 @brief 更新视图坐标等信息
 */
-(void)updateFrameContent
{
    switch (self.type) {
        case CZRefreshViewNormal:
        {
            CGFloat maxYPlusHeight = 0;
            for (UIView * view in self.scrollView.subviews) {
                maxYPlusHeight = MAX(maxYPlusHeight, view.yPlushHeight);
            }
            self.scrollView.contentSize = CGSizeMake(self.scrollView.width, maxYPlusHeight + 20);
        }
            break;
            
        default:
            break;
    }
}

#pragma mark MJRefresh 回调方法
-(void)loadNewData
{
    if (self.delegate && [self.delegate respondsToSelector:@selector(loadNewData)]) {
        [self.delegate loadNewData];
    }
}

#pragma mark 状态视图
/**
 @brief 在显示状态信息前处理的
 */
-(void)handleBeforeShowStatus
{
    if (!self.statusView) {
        // 如果没有赋值statusView视图，则提供默认的状态视图
        self.statusView = [[CZRefreshStatusView alloc] init];
        self.statusView.frame = self.bounds;
        ((CZRefreshStatusView *)self.statusView).delegate = self;
        [self addSubview:self.statusView];
    }
    switch (self.type) {
        case CZRefreshViewNormal:
        {
            [self.scrollView.mj_header endRefreshing];
        }
            break;
        default:
            break;
    }
    self.statusView.hidden = NO;
    [self bringSubviewToFront:self.statusView];
}

-(void)badRequest
{
    [self handleBeforeShowStatus];
    [self.statusView badRequest];
}

-(void)requestFail
{
    [self handleBeforeShowStatus];
    [self.statusView requestFail];
}

-(void)requestEmpty
{
    [self handleBeforeShowStatus];
    [self.statusView requestEmpty];
}

-(void)requestMore
{
    
}

-(void)requestAll
{
    
}

#pragma mark CZRefreshStatusView 回调事件
-(void)dlTapReloadAction
{
    if (self.delegate && [self.delegate respondsToSelector:@selector(loadNewData)]) {
        [self.delegate loadNewData];
    }
}
@end
