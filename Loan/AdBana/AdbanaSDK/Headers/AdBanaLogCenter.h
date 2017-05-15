//
//  AdBanaLogCenter.h
//  AdBanaSample
//
//  Created by Castiel Chen on 16/7/18.
//  Copyright © 2016年 CastielChen. All rights reserved.
//

#import <Foundation/Foundation.h>


#ifndef BLog
#define BLog(lv,fmt, ...) \
if([[AdBanaLogCenter shareInstance]canLog:lv]){\
if([[AdBanaLogCenter shareInstance]getLogLeveFlag] == AdBanaLogDebug){\
NSLog((@"AdBana-Debug: " fmt), ##__VA_ARGS__);\
}else{\
NSLog((@"AdBana-" "<FUNCTION:%s>: " fmt),__FUNCTION__, ##__VA_ARGS__);\
}\
}
#endif

typedef enum {
    AdBanaLogProduction = 1<<0,
    AdBanaLogDebug      = 1<<1,
    AdBanaLogNone       = 1<<2,
    AdBanaLogTemp       = 1<<3
}AdBanaLogLeve;

typedef enum {
    /**
     *  生产日志
     */
    BP      = 1<<0,
    /**
     *  调试日志
     */
    BD      = 1<<1,
    /**
     *  临时日志
     */
    BT      = 1<<3
}AdBanaLogLeveAbbre;

@interface AdBanaLogCenter : NSObject


+ (AdBanaLogCenter *)shareInstance;
- (BOOL)canLog:(int)levelFlag;
- (void)setLogLeveFlag:(AdBanaLogLeve)levelFlag;
- (AdBanaLogLeve)getLogLeveFlag;




@end
