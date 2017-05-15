//
//  AdBanaClassWrapper.h
//  TestFrameWork
//
//   Created by Castiel Chen  on 15/8/6.
//  Copyright (c) 2015年 AdBana. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface AdBanaClassWrapper : NSObject
{
    Class theClass;
}
- (id)initWithClass:(Class)c;
@property (nonatomic, readonly) Class theClass;

@end
