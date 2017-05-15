//
//  AdBanaInterstitial.h
//  AdBanaSample
//
//  Created by Castiel Chen on 15/8/25.
//  Copyright (c) 2015年 AdBana. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>
#import "AdBanaInterstitialDelegate.h"

@interface AdBanaInterstitial : NSObject

@property (nonatomic, weak) id<AdBanaInterstitialDelegate> delegate;

/**
 *  进入展示时机
 *
 *  @param isWait 如果没有广告展示是否等待
 */
- (void)interstitialShow:(BOOL)isWait;

/**
 *  离开展示时机
 */
- (void)interstitialCancel;


@end
