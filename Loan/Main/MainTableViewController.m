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
#import "MainFirstTableViewCell.h"
#import "MainHourseYearsTableViewCell.h"
#import "AdBanaView.h"

#define COUNT 16
#define BannerHeight 56.0
@interface MainTableViewController ()<AdBanaViewDelegate>
{
    AdBanaView * adview;
}
@end

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
    [button setBackgroundColor:[UIColor colorWithRed:154.0/255.0 green:222.0/255.0 blue:134.0/255 alpha:1.0]];
    [button setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
    [button.layer setCornerRadius:5.0];
    [button setTitle:NSLocalizedString(@"STRING_SNAP", @"STRING_SNAP") forState:UIControlStateNormal];
    [button addTarget:self action:@selector(snap) forControlEvents:UIControlEventTouchUpInside];
    self.navigationItem.rightBarButtonItem = [[UIBarButtonItem alloc] initWithCustomView:button];
    self.tableView.allowsSelection = NO;
    UISegmentedControl* segment = [[UISegmentedControl alloc] initWithItems:[NSArray arrayWithObjects:NSLocalizedString(@"STRING_HOUSE", @"STRING_HOUSE"), NSLocalizedString(@"STRING_BISINESS", @"STRING_SNAP"), NSLocalizedString(@"STRING_PUBLIC", @"STRING_PUBLIC"), nil]];

    [self.navigationController.navigationBar addSubview:segment];
    segment.center = CGPointMake(self.navigationController.navigationBar.center.x, self.navigationController.navigationBar.center.y - 20);
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Table view data source
/*- (nullable UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section;   // custom view for header. will be adjusted to default or specified header
{
    if (adview == nil) {
        adview = [[AdBanaView alloc]initWithAppKey:@"20160818000355" placement:@"100145" adType:AdBanaViewTypeNormalBanner delegate:self];
        adview.frame=CGRectMake(0,20, self.tableView.frame.size.width, 50);

    }
    return adview;
}

- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section
{
    return 50.f;
}*/

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
    if (indexPath.row == 0 || indexPath.row == COUNT - 1) {
        return BannerHeight;
    }
    return 44.0;
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
    } else if (indexPath.row == 0){
        UITableViewCell *cell = [[UITableViewCell alloc] initWithFrame:CGRectMake(0, 0, self.tableView.frame.size.width, 44.0)];
        if (adview == nil) {
            adview = [[AdBanaView alloc]initWithAppKey:@"20160818000355" placement:@"100145" adType:AdBanaViewTypeNormalBanner delegate:self];
            adview.frame=CGRectMake(0, 0, self.tableView.frame.size.width, BannerHeight);
        }
        [cell.contentView addSubview:adview];

        return cell;
    } else if (indexPath.row == 5){
        MainFirstTableViewCell *cell = [MainFirstTableViewCell loadfromNib];
        // Configure the cell...
        return cell;
    } else if (indexPath.row == 7){
        MainHourseYearsTableViewCell *cell = [MainHourseYearsTableViewCell loadfromNib];
    // Configure the cell...
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
            cell.textfieldtax.keyboardType = UIKeyboardTypeNumbersAndPunctuation;
            cell.textfieldtax.returnKeyType = UIReturnKeyDone;

            cell.textfield.enabled = ![HouseStrings getEnableFiled:(HOUSEVALUETYPE)indexPath.row];
            cell.textfieldtax.text = [_houseDelegate getDefaultValue:(HOUSEVALUETYPE)indexPath.row position:0];
            cell.textfield.text = [_houseDelegate getDefaultValue:(HOUSEVALUETYPE)indexPath.row position:1];
           
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
    CGSize sz = CGSizeMake(scrollView.contentSize.width, scrollView.contentSize.height - 2 *BannerHeight);
    UIGraphicsBeginImageContextWithOptions(sz, scrollView.opaque, 0.0);
    {
        CGContextRef newContext = UIGraphicsGetCurrentContext();
        CGContextSetFillColorWithColor(newContext, [UIColor whiteColor].CGColor);
        CGContextFillRect(newContext, CGRectMake(0, 0, sz.width, sz.height));
        
        CGPoint savedContentOffset = scrollView.contentOffset;
        CGRect savedFrame = scrollView.frame;
        
        scrollView.contentOffset = CGPointMake(0, BannerHeight);
        scrollView.frame = CGRectMake(0, 0, scrollView.contentSize.width, scrollView.contentSize.height - 2 * BannerHeight);
        
        [scrollView.layer renderInContext: newContext];
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

/**
 *  横幅广告加载完成
 *
 *  @param _adapter 适配器
 *  @param view     广告视图
 */
-(void)didAdBanaReceiveAdView{
    NSLog(@"横幅广告加载成功....");
}
/**
 *  横幅广告加载失败
 *
 *  @param _adapter 适配器
 *  @param error    错误信息
 */
-(void)didAdBanaFailAd:(AdBanaError*)error{
    
    NSLog(@"横幅广告加载失败....");
}
/**
 *  横幅广告点击事件
 */
-(void)didAdBanaClickAd{
    NSLog(@"横幅广告点击了....");
}



@end
