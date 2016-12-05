//
//  MainSubmitViewCell.h
//  Loan
//
//  Created by JiaLi on 16/8/24.
//  Copyright © 2016年 JiaLi. All rights reserved.
//

#import <UIKit/UIKit.h>

@protocol MainSubmitViewCellDelegate <NSObject>

- (void)onClickSumblit:(UIButton*)button;

@end
@interface MainSubmitViewCell : UITableViewCell
@property(strong) IBOutlet UIButton* submitbuttom;
@property(atomic, assign)id<MainSubmitViewCellDelegate> delegate;

+(instancetype)loadfromNib;
- (IBAction)onClickSumblit:(id)sender;

@end
