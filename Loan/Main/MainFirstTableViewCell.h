//
//  MainFirstTableViewCell.h
//  Loan
//
//  Created by JiaLi on 2017/3/3.
//  Copyright © 2017年 JiaLi. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "RadioButton.h"

@interface MainFirstTableViewCell : UITableViewCell
@property(strong) IBOutlet RadioButton* firstButton;
@property(strong) IBOutlet RadioButton* secondButton;

+(instancetype)loadfromNib;

- (void)configButton:(BOOL)isFive;
@end
