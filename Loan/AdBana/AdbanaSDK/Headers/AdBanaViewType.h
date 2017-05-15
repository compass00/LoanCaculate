//
//  AdBanaViewType.h
//  AdBana
//
//  Created by Castiel Chen on 16/8/18.
//  Copyright © 2016年 CastielChen. All rights reserved.
//

typedef enum {
    AdBanaViewTypeUnknown          = 0,  //error
    AdBanaViewTypeNormalBanner     = 1,  //e.g. 320 * 50 ; 320 * 48...           iphone banner
    AdBanaViewTypeLargeBanner      = 2,  //e.g. 728 * 90 ; 768 * 110             ipad only
    AdBanaViewTypeMediumBanner     = 3,  //e.g. 468 * 60 ; 508 * 80              ipad only
    AdBanaViewTypeRectangle        = 4,  //e.g. 300 * 250; 320 * 270             ipad only
    AdBanaViewTypeiPadNormalBanner = 8,  //ipad use iphone banner
    
} AdBanaViewType;

