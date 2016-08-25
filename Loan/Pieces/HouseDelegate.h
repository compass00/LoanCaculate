//
//  HouseDelegate.h
//  Loan
//
//  Created by JiaLi on 16/8/24.
//  Copyright © 2016年 JiaLi. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>
#import "HouseValue.h"
@protocol HouseCalculationDelegate <NSObject>

@optional
-(void)didCalculate;
@end

@interface HouseDelegate : NSObject<UITextFieldDelegate>
@property (strong) HouseValue* housevalue;
@property (nonatomic, assign) id<HouseCalculationDelegate> calculationdelegate;

- (IBAction)submit:(id)sender;
- (IBAction)changeSegment:(id)sender;
- (NSString*)getDefaltTax:(NSInteger)type position:(NSInteger)pos;
@end
