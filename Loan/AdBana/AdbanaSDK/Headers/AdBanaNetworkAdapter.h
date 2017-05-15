//
//  AdBanaNetworkAdapter.h
//  AdBanaSample
//
//  Created by Castiel Chen on 16/7/19.
//  Copyright © 2016年 CastielChen. All rights reserved.
//

#import <Foundation/Foundation.h>
//#import "AdBanaDelegate.h"
#import <UIKit/UIKit.h>

#import "AdBanaError.h"
#import "AdBanaViewType.h"
#import "AdBanaAdNetworkRegistry.h"
#import "AdBanaBannerSDKAdNetworkRegistry.h"
#import "AdBanaInterstitialSDKAdNetworkRegistry.h"
#import "AdBanaInterstitialAPIAdNetworkRegistry.h"
#import "AdBanaBannerAPIAdNetworkRegistry.h"
#import "AdBanaSplashSDKAdNetworkRegistry.h"



@class  AdBanaCore;

@class AdBanaPlatform;



@interface AdBanaNetworkAdapter : NSObject

extern  NSString *AdBanaAdNetworkAdAdMob    ;
extern  NSString *AdBanaAdNetworkAdBaidu    ;
extern  NSString *AdBanaAdNetworkAdFaceBook ;
extern  NSString *AdBanaAdNetworkAdFlurry   ;
extern  NSString *AdBanaAdNetworkAdGDT      ;
extern  NSString *AdBanaAdNetworkAdInMobi   ;
extern  NSString *AdBanaAdNetworkAdMMedia   ;
extern  NSString *AdBanaAdNetworkAdMoPub    ;
extern  NSString *AdBanaAdNetworkAdStartApp ;
extern  NSString *AdBanaAdNetworkAdSmatto;
extern  NSString *AdBanaAdNetworkAdIfly;
extern  NSString *AdBanaAdNetworkAdChanceAd;
extern  NSString *AdBanaAdNetworkAdYUMI;
extern  NSString *AdBanaAdNetworkAdAdView;
extern  NSString *AdBanaAdNetworkAdAliMaMa;


@property(weak,nonatomic)AdBanaCore *adCore;
@property(strong,nonatomic)AdBanaPlatform*provider;
@property(assign,nonatomic)NSUInteger  adType;
@property(assign,nonatomic)NSTimeInterval  timeout_Interval;
@property(strong,nonatomic)UIView * adNetworkView;
@property(assign,nonatomic)UIWindow * keyWindow;
@property(strong,nonatomic)UIView * bottomView;
- (id)initWithAdbanaAdapterDelegate:(id)delegate
                                  core:(AdBanaCore *)core
                         networkConfig:(AdBanaPlatform *)provider
                                adType:(NSUInteger)adType;



/**
 *  初始化三方广告
 */
-(void)getThirdAd;
/**
 *  释放三方广告平台
 */
-(void)stopThirdAd;
/**
 *  释放三方超时定时器
 */
-(void)stopThirdTimer;



-(NSString*)getAdapterKey1;
-(NSString*)getAdapterKey2;
-(NSString*)getAdapterKey3;



/**
 *  横幅广告加载完成
 *
 *  @param _adapter 适配器
 *  @param view     广告视图
 */
-(void)adapter:(AdBanaNetworkAdapter*)_adapter didReceiveAdView:(UIView*)view;
/**
 *  横幅广告加载失败
 *
 *  @param _adapter 适配器
 *  @param error    错误信息
 */
-(void)adapter:(AdBanaNetworkAdapter*)_adapter didFailAd:(AdBanaError*)error;

/**
 *  横幅广告超时
 *
 *  @param _adapter 适配器
 *  @param timer    定时器
 */
-(void)adapter:(AdBanaNetworkAdapter*)_adapter didTimeOut:(NSTimer*)timer;

/**
 *  横幅广告点击
 *
 *  @param _adapter 适配器
 *  @param view     点击的广告视图
 */
-(void)adapter:(AdBanaNetworkAdapter *)_adapter didClickAdView:(UIView*)view;

/**
 *  横幅广告点击
 *
 *  @param _adapter 适配器
 *  @param view     点击的广告视图
 */
-(void)adapter:(AdBanaNetworkAdapter *)_adapter didCloseAdView:(UIView*)view;




/**
 *  开发者设置的ViewController
 *
 */
-(UIViewController*)developerViewControllerForPresentingModalView;

/**
 *  广告物料加载成功
 *
 */
-(void)adapterPreloadInterstitialReceiveAd:(AdBanaNetworkAdapter *)_adapter;
/**
 *  广告物料加载失败
 *
 */
- (void)adapter:(AdBanaNetworkAdapter *)_adapter adapterPreloadInterstitialFailAd:(NSError *)error;

/**
 *  插屏广告预加载成功
 *
 */
- (void)adapterDidInterstitialReceiveAd:(AdBanaNetworkAdapter *)_adapter;

/**
 *  插屏预加载失败
 *
 *  @param error    错误信息
 */
- (void)adapter:(AdBanaNetworkAdapter *)_adapter didInterstitialFailAd:(NSError *)error;

/**
 *  插屏点击回调
 *
 *  @param _adapter 适配器
 */
- (void)adapterDidInterstitialClick:(AdBanaNetworkAdapter *)_adapter;

/**
 *  插屏将要展示
 *
 *  @param _adapter 适配器
 */
- (void)adapterInterstitialWillPresentScreen:(AdBanaNetworkAdapter *)_adapter;
/**
 *  插屏展示成功
 *
 *  @param _adapter 适配器
 */
- (void)adapterInterstitialDidPresentScreen:(AdBanaNetworkAdapter *)_adapter;

/**
 *  插屏已经关闭
 *
 *  @param _adapter 适配器
 */
- (void)adapterInterstitialDidDismissScreen:(AdBanaNetworkAdapter *)_adapter;




#pragma  mark ----开屏回调

/**
 *  广告开始请求
 */
- (void)adbanaSplashDidStartRequest:(AdBanaNetworkAdapter *)splash;
/**
 *  广告展示成功
 */
- (void)adbanaSplashSuccessPresentScreen:(AdBanaNetworkAdapter *)splash;

/**
 *  广告展示失败
 */
- (void)adbanaSplashlFailPresentScreen:(AdBanaNetworkAdapter *)splash withError:(NSError*) reason;

/**
 *  广告被点击
 */
- (void)adbanaSplashDidClicked:(AdBanaNetworkAdapter *)splash;

/**
 *  广告展示结束
 */
- (void)adbanaSplashDidDismissScreen:(AdBanaNetworkAdapter *)splash;




@end
