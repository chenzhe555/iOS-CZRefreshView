//
//  CZRefreshView.h
//  CZRefreshView
//
//  Created by yunshan on 2019/4/23.
//  Copyright © 2019 ChenZhe. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "CZRefreshViewDelegate.h"
// 如果没有实现自定义的statusView，则会有个默认的CZRefreshStatusView
#import "CZRefreshStatusView.h"

typedef NS_ENUM(NSInteger, CZRefreshViewType) {
    CZRefreshViewNone = 100,
    CZRefreshViewNormal,
    CZRefreshViewTableView,
    CZRefreshViewCollectionView
};

NS_ASSUME_NONNULL_BEGIN

@interface CZRefreshView : UIView<CZStatusViewDelegate>
/**
 @brief 刷新视图
 */
@property (nonatomic, assign) CZRefreshViewType type;

/**
 @brief 代理
 */
@property (nonatomic, weak) id<CZRefreshViewDelegate> delegate;

/**
 @brief 状态视图
 */
@property (nonatomic, strong) UIView<CZRefreshStatusViewDelegate> * statusView;

/**
 @brief 添加视图

 @param view 需要添加在容器中的视图
 */
-(void)cz_addSubview:(UIView *)view;

/**
 @brief 更新视图显示
 */
-(void)updateAll;

-(void)badRequest;
-(void)requestFail;
-(void)requestEmpty;
-(void)requestMore;
-(void)requestAll;
@end

NS_ASSUME_NONNULL_END
