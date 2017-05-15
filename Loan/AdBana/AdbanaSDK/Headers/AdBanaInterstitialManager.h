//
//  AdBanaInterstitialManager.h
//  AdBanaSample
//
//  Created by Castiel Chen on 15/10/12.
//  Copyright © 2015年 AdBana. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "AdBanaInterstitial.h"

@interface AdBanaInterstitialManager : NSObject

+ (AdBanaInterstitialManager *)shareInstance;

/**
 *  插屏初始化接口
 *
 *  @param banaId    appID
 *  @param placement 渠道ID
 *
 *  @return 插屏对象
 */
- (AdBanaInterstitial *)adBanaInterstitialByAppKey:(NSString*)banaId  placement:(NSString*)pid;

@end
