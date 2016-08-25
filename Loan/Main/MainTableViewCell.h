//
//  MainTableViewCell.h
//  Loan
//
//  Created by JiaLi on 16/8/24.
//  Copyright © 2016年 JiaLi. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "HouseTextField.h"
@interface MainTableViewCell : UITableViewCell
@property(strong) IBOutlet UILabel* housetitle;
@property(strong) IBOutlet UILabel* houseinfo;
@property(strong) IBOutlet HouseTextField* textfieldtax;
@property(strong) IBOutlet UILabel* taxunit;
@property(strong) IBOutlet HouseTextField* textfield;
@property(strong) IBOutlet UISegmentedControl* segmentcontroll;

+(instancetype)loadfromNib;
@end
