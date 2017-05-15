//
//  MainHourseYearsTableViewCell.h
//  Loan
//
//  Created by JiaLi on 2017/3/3.
//  Copyright © 2017年 JiaLi. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "RadioButton.h"
@interface MainHourseYearsTableViewCell : UITableViewCell
@property(strong) IBOutlet RadioButton* fiveYearsButton;
@property(strong) IBOutlet RadioButton* TwoYearsButton;
@property(strong) IBOutlet RadioButton* NotTwoYearsButton;

+(instancetype)loadfromNib;
- (void)configButton:(BOOL)isFive withTwoYears:(BOOL)isTwo withNotTwo:(BOOL)isNot;
@end
