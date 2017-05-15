//
//  AdBanaError.h
//  TestFrameWork
//
//   Created by Castiel Chen  on 15/8/6.
//  Copyright (c) 2015年 AdBana. All rights reserved.
//

#import <Foundation/Foundation.h>

enum {
    /**
     *  初始化失败
     */
     AdBanaRequestService_InitFail  =0xAB1,
    /**
     *  数据解析失败
     */
    AdBanaRequestService_JsonError  =0xAB2,
    /**
     *  第三方没广告返回
     */
     AdBanaRequestAdapterAd_NotAd =0xAB3,
    
    /**
     *  第三方没对应尺寸广告
     */
    AdBanaRequestAdapterAd_NotAdSize =0xAB4,
    /**
     *  第三方请求超时
     */
     AdBanaRequestAdapterAd_TimeOut =0xAB5,
    /**
     *  第三方其他原因
     */
     AdBanaRequestAdapterAd_Other =0xAB6,
};



@interface AdBanaError : NSError

+ (AdBanaError *)errorWithCode:(NSInteger)code;
+ (AdBanaError *)errorWithCode:(NSInteger)code userInfo:(NSDictionary *)dict;
+ (AdBanaError *)errorWithCode:(NSInteger)code description:(NSString *)desc;
+ (AdBanaError *)errorWithCode:(NSInteger)code description:(NSString *)desc underlyingError:(NSError *)uError;

- (id)initWithCode:(NSInteger)code userInfo:(NSDictionary *)dict;
- (id)initWithCode:(NSInteger)code description:(NSString *)desc;
- (id)initWithCode:(NSInteger)code description:(NSString *)desc underlyingError:(NSError *)uError;

@end
