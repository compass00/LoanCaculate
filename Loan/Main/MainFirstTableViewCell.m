//
//  MainFirstTableViewCell.m
//  Loan
//
//  Created by JiaLi on 2017/3/3.
//  Copyright © 2017年 JiaLi. All rights reserved.
//

#import "MainFirstTableViewCell.h"

@implementation MainFirstTableViewCell

+(instancetype)loadfromNib
{
    NSArray *array = [[NSBundle mainBundle] loadNibNamed:@"MainFirstTableViewCell" owner:self options:nil];
    MainFirstTableViewCell* cell = array[0];
    return cell;
}

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
}


- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
