//
//  AdBanaSplash.h
//  AdBanaSample
//
//  Created by chenzhangtao on 2016/11/17.
//  Copyright © 2016年 CastielChen. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>
@interface AdBanaSplash : NSObject


@property(assign,nonatomic)id delegate;

/**初始化开屏接口
 @param banaId   adbana后台ID
 @param pid     adbana后台广告位id
 @param window <#window description#>
 @param delegate  代理回调
 @return 开屏对象
 */
-(id)initWithAppKey:(NSString*)banaId  placement:(NSString*)pid  showInWindow:(UIWindow*)window  delegate:(id) delegate;

/** 开屏初始化接口（增加开屏logo）
 @param banaId adbana后台ID
 @param pid adbana后台广告位id
 @param window <#window description#>
 @param bottomView  logo视图
 @param delegate  代理回调
 @return 开屏对象
 */
-(id)initWithAppKey:(NSString*)banaId  placement:(NSString*)pid  showInWindow:(UIWindow*)window withBottomView:(UIView*)bottomView delegate:(id) delegate;

@end
