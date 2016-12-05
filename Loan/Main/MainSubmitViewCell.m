//
//  MainSubmitViewCell.m
//  Loan
//
//  Created by JiaLi on 16/8/24.
//  Copyright © 2016年 JiaLi. All rights reserved.
//

#import "MainSubmitViewCell.h"

@implementation MainSubmitViewCell

+(instancetype)loadfromNib
{
    NSArray *array = [[NSBundle mainBundle] loadNibNamed:@"MainSubmitViewCell" owner:self options:nil];
    MainSubmitViewCell* cell = array[0];
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

- (IBAction)onClickSumblit:(id)sender {
    if (self.delegate != nil) {
        [self.delegate  onClickSumblit:sender];
    }
}

@end
