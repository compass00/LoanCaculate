//
//  MainTableViewController.m
//  Loan
//
//  Created by JiaLi on 16/8/24.
//  Copyright © 2016年 JiaLi. All rights reserved.
//

#import "MainTableViewController.h"
#import "MainTableViewCell.h"
#import "MainSubmitViewCell.h"
#import "HouseStrings.h"
#import "HouseDelegate.h"

#define COUNT 16

@implementation MainTableView

- (void)touchesEnded:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event{
    [super touchesEnded:touches withEvent:event];
    if (self.mainTableviewdelegate !=  nil) {
        [self.mainTableviewdelegate onTouchEnd];
    }
}
@end

@interface MainTableViewController ()
@property (strong)HouseValue* houseValue;
@property (strong)HouseDelegate* houseDelegate;
@end

@implementation MainTableViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    if (_houseDelegate == nil) {
        _houseDelegate = [[HouseDelegate alloc] init];
        _houseDelegate.calculationdelegate = (id)self;
        MainTableView* mv = (MainTableView*)self.tableView;
        mv.mainTableviewdelegate = (id)self;
    }
    // Uncomment the following line to preserve selection between presentations.
    // self.clearsSelectionOnViewWillAppear = NO;
    //self.title = NSLocalizedString(@"STRING_APP_TITLE", @"STRING_APP_TITLE");
    // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
    // self.navigationItem.rightBarButtonItem = self.editButtonItem;
    UIButton* button = [[UIButton alloc] initWithFrame:CGRectMake(0, 0, 60, 28)];
    [button setBackgroundColor:[UIColor blackColor]];
    [button.layer setCornerRadius:5.0];
    [button setTitle:NSLocalizedString(@"STRING_SNAP", @"STRING_SNAP") forState:UIControlStateNormal];
    [button addTarget:self action:@selector(snap) forControlEvents:UIControlEventTouchUpInside];
    self.navigationItem.rightBarButtonItem = [[UIBarButtonItem alloc] initWithCustomView:button];
    self.tableView.allowsSelection = NO;
    UISegmentedControl* segment = [[UISegmentedControl alloc] initWithItems:[NSArray arrayWithObjects:NSLocalizedString(@"STRING_HOUSE", @"STRING_HOUSE"), NSLocalizedString(@"STRING_BISINESS", @"STRING_SNAP"), NSLocalizedString(@"STRING_PUBLIC", @"STRING_PUBLIC"), nil]];
    segment.segmentedControlStyle = UISegmentedControlStyleBar;


    [self.navigationController.navigationBar addSubview:segment];
    segment.center = CGPointMake(self.navigationController.navigationBar.center.x, self.navigationController.navigationBar.center.y - 20);
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return COUNT;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    /*if (indexPath.row < 3 || indexPath.row == 5 || indexPath.row == 7 || indexPath.row == 11) {
        return 56.0;
    }
    return 88.0;*/
    return 56.0;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    //UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:<#@"reuseIdentifier"#> forIndexPath:indexPath];
    
    if (indexPath.row == COUNT - 1) {
        MainSubmitViewCell *cell = [MainSubmitViewCell loadfromNib];
        // Configure the cell...
        if (cell != nil) {
            [cell.submitbuttom setTitle:NSLocalizedString(@"STRING_SUBMIT", nil) forState:UIControlStateNormal];
            [cell.submitbuttom addTarget:_houseValue action:@selector(submit:) forControlEvents:UIControlEventTouchUpInside];
            cell.delegate = (id)self;
        }
        
        return cell;

    } else {
        MainTableViewCell *cell = [MainTableViewCell loadfromNib];
        // Configure the cell...
        if (cell != nil) {
            cell.housetitle.text = [HouseStrings getTitle:(HOUSEVALUETYPE)indexPath.row];
            cell.houseinfo.text = [HouseStrings getInformation:(HOUSEVALUETYPE)indexPath.row];
            BOOL showSegment = [HouseStrings getShowSegment:(HOUSEVALUETYPE)indexPath.row];
            cell.textfield.hidden = showSegment;
            cell.textfieldtax.hidden = ![HouseStrings getShowTaxFiled:(HOUSEVALUETYPE)indexPath.row];
            cell.textfield.delegate = _houseDelegate;
            cell.textfieldtax.delegate = _houseDelegate;
            cell.textfield.keyboardType = UIKeyboardTypeNumbersAndPunctuation;
            cell.textfield.returnKeyType = UIReturnKeyDone;
            /*if (indexPath.row == HOUSEVALUETYPE_HOME_VALUE) {
                [cell.segmentcontroll setTitle:NSLocalizedString(@"STRING_HOUSE", nil) forSegmentAtIndex:0];
                [cell.segmentcontroll setTitle:NSLocalizedString(@"STRING_BISINESS", nil) forSegmentAtIndex:1];
                [cell.segmentcontroll insertSegmentWithTitle:NSLocalizedString(@"STRING_PUBLIC", nil) atIndex:2 animated:NO];
            } else {*/
                [cell.segmentcontroll setTitle:NSLocalizedString(@"STRING_YES", nil) forSegmentAtIndex:0];
                [cell.segmentcontroll setTitle:NSLocalizedString(@"STRING_NO", nil) forSegmentAtIndex:1];

            //}
            [cell.segmentcontroll addTarget:_houseDelegate action:@selector(changeSegment:) forControlEvents:UIControlEventValueChanged];

            cell.segmentcontroll.tag = indexPath.row;
            cell.segmentcontroll.hidden = !showSegment;
            cell.textfield.enabled = ![HouseStrings getEnableFiled:(HOUSEVALUETYPE)indexPath.row];
            cell.textfieldtax.text = [_houseDelegate getDefaultValue:(HOUSEVALUETYPE)indexPath.row position:0];
            cell.textfield.text = [_houseDelegate getDefaultValue:(HOUSEVALUETYPE)indexPath.row position:1];
            cell.segmentcontroll.selectedSegmentIndex = [_houseDelegate getSelectIndex:(HOUSEVALUETYPE)indexPath.row];
            cell.taxunit.hidden = cell.textfieldtax.hidden;

            cell.textfield.row = indexPath.row;
            cell.textfield.index = 1;
            cell.textfieldtax.row = indexPath.row;
            cell.textfieldtax.index = 0;
        }
        
        return cell;

    }
    
 }


/*
// Override to support conditional editing of the table view.
- (BOOL)tableView:(UITableView *)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath {
    // Return NO if you do not want the specified item to be editable.
    return YES;
}
*/

/*
// Override to support editing the table view.
- (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath {
    if (editingStyle == UITableViewCellEditingStyleDelete) {
        // Delete the row from the data source
        [tableView deleteRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationFade];
    } else if (editingStyle == UITableViewCellEditingStyleInsert) {
        // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
    }   
}
*/

/*
// Override to support rearranging the table view.
- (void)tableView:(UITableView *)tableView moveRowAtIndexPath:(NSIndexPath *)fromIndexPath toIndexPath:(NSIndexPath *)toIndexPath {
}
*/

/*
// Override to support conditional rearranging of the table view.
- (BOOL)tableView:(UITableView *)tableView canMoveRowAtIndexPath:(NSIndexPath *)indexPath {
    // Return NO if you do not want the item to be re-orderable.
    return YES;
}
*/

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

-(void)didCalculate {
    [self.tableView reloadData];
}

- (void)onClickSumblit:(UIButton*)button {
    [self didCalculate];
}

- (void)snap {
    UIImage* savedImage  = [self imageWithView1:self.tableView];
    [self saveImageToPhotos:savedImage];
}

- (UIImage *) imageWithView1:(UIView *)view{
    UIImage *viewImage = nil;
    UITableView *scrollView = self.tableView;
    CGSize sz = CGSizeMake(scrollView.contentSize.width, scrollView.contentSize.height - 56);
    UIGraphicsBeginImageContextWithOptions(sz, scrollView.opaque, 0.0);
    {
        CGPoint savedContentOffset = scrollView.contentOffset;
        CGRect savedFrame = scrollView.frame;
        
        scrollView.contentOffset = CGPointZero;
        scrollView.frame = CGRectMake(0, 0, scrollView.contentSize.width, scrollView.contentSize.height);
        
        [scrollView.layer renderInContext: UIGraphicsGetCurrentContext()];
        viewImage = UIGraphicsGetImageFromCurrentImageContext();
        
        scrollView.contentOffset = savedContentOffset;
        scrollView.frame = savedFrame;
    }
    UIGraphicsEndImageContext();
    
    return viewImage;
}

- (void)saveImageToPhotos:(UIImage*)savedImage {
    
    UIImageWriteToSavedPhotosAlbum(savedImage, self, @selector(image:didFinishSavingWithError:contextInfo:), NULL);
    
}

// 指定回调方法
- (void)image: (UIImage *) image didFinishSavingWithError: (NSError *) error contextInfo: (void *) contextInfo {
    
    NSString *msg = error == nil ?  @"已将结果成功保存到相册" : @"保存图像失败";
    
    UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"保存成功"
                          
                                                    message:msg
                          
                                                   delegate:self
                          
                                          cancelButtonTitle:@"确定"
                          
                                          otherButtonTitles:nil];
    
    [alert show];
    
}

- (void)touchesEnded:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event {
    [self resignFirstResponder];
}

- (void)onTouchEnd {
    [_houseDelegate resginKeyboard];
}

@end
