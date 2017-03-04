//
//  MainHourseYearsTableViewCell.m
//  Loan
//
//  Created by JiaLi on 2017/3/3.
//  Copyright © 2017年 JiaLi. All rights reserved.
//

#import "MainHourseYearsTableViewCell.h"

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

@end
