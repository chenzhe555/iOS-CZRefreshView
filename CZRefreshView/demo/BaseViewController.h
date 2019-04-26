//
//  BaseViewController.h
//  CZRefreshView
//
//  Created by yunshan on 2019/4/23.
//  Copyright © 2019 ChenZhe. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "ProjectRefreshView.h"

NS_ASSUME_NONNULL_BEGIN

@interface BaseViewController : UIViewController<CZRefreshViewDelegate>
@property (nonatomic, strong) ProjectRefreshView * refreshView;
@end

NS_ASSUME_NONNULL_END
