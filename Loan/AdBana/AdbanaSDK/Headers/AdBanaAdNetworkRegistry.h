//
//  AdBanaAdNetworkRegistry.h
//  TestFrameWork
//
//   Created by Castiel Chen  on 15/8/6.
//  Copyright (c) 2015年 AdBana. All rights reserved.
//

#import <Foundation/Foundation.h>

@class AdBanaClassWrapper;
@class AdBanaAdNetworkAdapter;


@interface AdBanaAdNetworkRegistry : NSObject
{
    NSMutableDictionary * adapterDict;
}

+(AdBanaAdNetworkRegistry*)sharedRegistry;
-(void)registerClass:(Class)adapterClass;
-(AdBanaClassWrapper*)adapterClassFor:(NSString*)adNetworkType;




@end
