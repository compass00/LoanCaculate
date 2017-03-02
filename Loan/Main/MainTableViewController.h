//
//  MainTableViewController.h
//  Loan
//
//  Created by JiaLi on 16/8/24.
//  Copyright © 2016年 JiaLi. All rights reserved.
//

#import <UIKit/UIKit.h>
@protocol MainTableViewDelegate <NSObject>

- (void)onTouchEnd;

@end
@interface MainTableView : UITableView
@property (nonatomic, assign) id<MainTableViewDelegate> mainTableviewdelegate;

@end

@interface MainTableViewController : UITableViewController

- (void)onClickSumblit:(UIButton*)button;

@end
