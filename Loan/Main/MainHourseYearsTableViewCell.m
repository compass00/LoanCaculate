//
//  MainHourseYearsTableViewCell.m
//  Loan
//
//  Created by JiaLi on 2017/3/3.
//  Copyright © 2017年 JiaLi. All rights reserved.
//

#import "MainHourseYearsTableViewCell.h"
@interface MainHourseYearsTableViewCell()
{
    RaidoButtonGroup* _group;
}
@end
@implementation MainHourseYearsTableViewCell

+(instancetype)loadfromNib
{
    NSArray *array = [[NSBundle mainBundle] loadNibNamed:@"MainHourseYearsTableViewCell" owner:self options:nil];
    MainHourseYearsTableViewCell* cell = array[0];
   return cell;
}


- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

- (void)configButton:(BOOL)isFive withTwoYears:(BOOL)isTwo withNotTwo:(BOOL)isNot;
{
    self.fiveYearsButton.tag = TAG_FIVE_ONYLE;
    self.TwoYearsButton.tag = TAG_TWO_YEARS;
    self.NotTwoYearsButton.tag = TAG_NOT_TWO_YEARS;

    if (_group == nil) {
        _group = [[RaidoButtonGroup alloc] init];
        [_group addGroup:self.fiveYearsButton];
        [_group addGroup:self.TwoYearsButton];
        [_group addGroup:self.NotTwoYearsButton];
    }
    
    if (isFive) {
        [_group setChecked:self.fiveYearsButton];
    }
   
    if (isTwo) {
        [_group setChecked:self.TwoYearsButton];
    }
    if (isNot) {
        [_group setChecked:self.NotTwoYearsButton];
    }
}



@end
