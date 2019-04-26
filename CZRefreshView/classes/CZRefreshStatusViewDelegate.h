//
//  CZRefreshStatusViewDelegate.h
//  CZRefreshView
//
//  Created by yunshan on 2019/4/23.
//  Copyright © 2019 ChenZhe. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@protocol CZRefreshStatusViewDelegate <NSObject>
@required
-(void)badRequest;
-(void)requestFail;
-(void)requestEmpty;
@end

NS_ASSUME_NONNULL_END
