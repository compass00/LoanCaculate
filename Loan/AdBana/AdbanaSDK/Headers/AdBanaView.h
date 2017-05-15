//
//  AdBanaView.h
//  AdBana
//
//  Created by Castiel Chen on 16/8/18.
//  Copyright © 2016年 CastielChen. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "AdBanaViewDelegate.h"
#import "AdBanaViewType.h"
@interface AdBanaView : UIView
/**
 *   横幅广告初始化接口
 *
 *  @param banaId   开发者ID
 *  @param pid      广告位ID
 *  @param delegate 代理对象
 *
 *  @return  横幅广告视图
 */
 
-(id)initWithAppKey:(NSString*)banaId  placement:(NSString*)pid adType:(AdBanaViewType)adType delegate:(id<AdBanaViewDelegate>) delegate ;



@end
