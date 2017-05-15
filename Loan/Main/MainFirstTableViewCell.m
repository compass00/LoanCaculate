//
//  MainFirstTableViewCell.m
//  Loan
//
//  Created by JiaLi on 2017/3/3.
//  Copyright © 2017年 JiaLi. All rights reserved.
//

#import "MainFirstTableViewCell.h"
@interface MainFirstTableViewCell()
{
    RaidoButtonGroup* _group;
}
@end
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

- (void)configButton:(BOOL)isFive
{
    self.firstButton.tag = TAG_FIRST_HOURSE;
    self.secondButton.tag = TAG_SCOND_HOURSE;
    [self.firstButton setChecked:isFive];
    [self.secondButton setChecked:!isFive];
    if (_group == nil) {
        _group = [[RaidoButtonGroup alloc] init];
        [_group addGroup:self.firstButton];
        [_group addGroup:self.secondButton];

    }

}

@end
