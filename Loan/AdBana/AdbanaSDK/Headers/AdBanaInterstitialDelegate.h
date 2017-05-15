//
//  AdBanaInterstitialDelegate.h
//  AdsAdBanaSample
//
//  Created by Castiel Chen on 15/10/12.
//  Copyright © 2015年 AdsAdBana. All rights reserved.
//

#import <Foundation/Foundation.h>

@class AdBanaInterstitial;
@protocol AdBanaInterstitialDelegate <NSObject>
@optional


/*
 返回广告rootViewController
 */
- (UIViewController *)viewControllerForPresentingInterstitialModalView;

/**
 *  Description         插屏加载成功
 *
 *  @param ad           返回一个插屏的实例
 */
- (void)AdBanaInterstitialDidReceiveAd:(AdBanaInterstitial *)ad;
/**
 *  Description         插屏加载失败
 *
 *  @param ad           返回一个插屏实例
 *  @param error        返回错误信息
 */
- (void)AdBanaInterstitial:(AdBanaInterstitial *)ad didFailToReceiveAdWithError:(NSError *)error;
/**
 *  Description         插屏已经消失
 *
 *  @param ad           返回一个插屏的实例
 */
- (void)AdBanaInterstitialDidDismissScreen:(AdBanaInterstitial *)ad;


@end
