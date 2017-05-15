//
//  AdBanaViewDelegate.h
//  AdBana
//
//  Created by Castiel Chen on 16/8/18.
//  Copyright © 2016年 CastielChen. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "AdBanaError.h"

@protocol AdBanaViewDelegate <NSObject>
/**
 *  横幅广告加载完成
 *
 *  @param _adapter 适配器
 *  @param view     广告视图
 */
-(void)didAdBanaReceiveAdView;
/**
 *  横幅广告加载失败
 *
 *  @param _adapter 适配器
 *  @param error    错误信息
 */
-(void)didAdBanaFailAd:(AdBanaError*)error;
/**
 *  横幅广告点击事件
 */
-(void)didAdBanaClickAd;




@end
