//
//  CZRefreshViewDelegate.h
//  CZRefreshView
//
//  Created by yunshan on 2019/4/23.
//  Copyright © 2019 ChenZhe. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@protocol CZRefreshViewDelegate <NSObject>

@optional
-(UIView *)cz_freshViewWithHeader;
-(UIView *)cz_freshViewWithFooter;

@optional
-(void)loadNewData;
-(void)loadMoreData;

@end

NS_ASSUME_NONNULL_END
