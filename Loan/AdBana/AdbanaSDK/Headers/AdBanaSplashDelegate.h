//
//  AdBanaSplashDelegate.h
//  AdBanaSample
//
//  Created by chenzhangtao on 2016/11/17.
//  Copyright © 2016年 CastielChen. All rights reserved.
//

#import <Foundation/Foundation.h>

@class AdBanaSplash;

@protocol AdBanaSplashDelegate <NSObject>
/**
 *  广告展示成功
 */
- (void)adbanaSplashSuccessPresentScreen:(AdBanaSplash *)splash;

/**
 *  广告展示失败
 */
- (void)adbanaSplashlFailPresentScreen:(AdBanaSplash *)splash withError:(NSError*) reason;

/**
 *  广告被点击
 */
- (void)adbanaSplashDidClicked:(AdBanaSplash *)splash;

/**
 *  广告展示结束
 */
- (void)adbanaSplashDidDismissScreen:(AdBanaSplash *)splash;



@end
