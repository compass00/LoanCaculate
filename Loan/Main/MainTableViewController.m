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
#import "UIImage_Scale.h"

#define COUNT 16


#define COLOR_R 154.0/255.0
#define COLOR_G 222.0/255.0
#define COLOR_B 134.0/255.0
#define MAIN_COLOR [UIColor colorWithRed:COLOR_R green:COLOR_G blue:COLOR_B alpha:1.0]
#define MAIN_TEXT_COLOR [UIColor blackColor]
#define MAIN_TEXT_SIZE 16
#define ADBANNA_ID @"20170313000213"
#define ADBANNA_PLACEMENT @"101056"
#define isPad (UI_USER_INTERFACE_IDIOM() == UIUserInterfaceIdiomPad)
#define ADBANNAVIEW_SIZE (isPad? CGSizeMake(728.0, 90.0) : CGSizeMake(320.0,50.0))
#define ADBANNA_TYPE (isPad? AdBanaViewTypeLargeBanner: AdBanaViewTypeNormalBanner)
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
    [button setBackgroundColor:MAIN_COLOR];
    [button setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
    [button.layer setCornerRadius:5.0];
    button.titleLabel.font = [UIFont systemFontOfSize:MAIN_TEXT_SIZE];
    [button setTitle:NSLocalizedString(@"STRING_SNAP", @"STRING_SNAP") forState:UIControlStateNormal];
    [button addTarget:self action:@selector(snap) forControlEvents:UIControlEventTouchUpInside];
    self.navigationItem.rightBarButtonItem = [[UIBarButtonItem alloc] initWithCustomView:button];
    self.tableView.allowsSelection = NO;
    UISegmentedControl* segment = [[UISegmentedControl alloc] initWithItems:[NSArray arrayWithObjects:NSLocalizedString(@"STRING_HOUSE", @"STRING_HOUSE"), NSLocalizedString(@"STRING_BISINESS", @"STRING_SNAP"), NSLocalizedString(@"STRING_PUBLIC", @"STRING_PUBLIC"), nil]];

    [segment addTarget:self action:@selector(housevalueChanged:) forControlEvents:UIControlEventValueChanged];
    segment.tintColor = MAIN_COLOR;
    
    NSDictionary *dicselect = [NSDictionary dictionaryWithObjectsAndKeys:MAIN_TEXT_COLOR,
                         NSForegroundColorAttributeName,
                         [UIFont boldSystemFontOfSize:15],
                         NSFontAttributeName,nil];
    
    [segment setTitleTextAttributes:dicselect forState:UIControlStateSelected];
    
    NSDictionary *dicnomal = [NSDictionary dictionaryWithObjectsAndKeys:MAIN_COLOR,
                               NSForegroundColorAttributeName,
                               [UIFont boldSystemFontOfSize:14],
                               NSFontAttributeName,nil];

    
    [segment setTitleTextAttributes:dicnomal forState:UIControlStateNormal];
    
    
    segment.selectedSegmentIndex = [_houseDelegate.housevalue getHomeValue];
   
    [self.navigationController.navigationBar addSubview:segment];
    segment.center = CGPointMake(self.navigationController.navigationBar.center.x, self.navigationController.navigationBar.center.y - 20);
    
    [segment addTarget:self action:@selector(changeHouseValue:) forControlEvents:UIControlEventValueChanged];
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(onCheckRadioButton:) name:KNOTIFICATION_RADIO_CHECKED_CHANGE object:nil];
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(onClickRadioButton) name:KNOTIFICATION_RADIO_CHECKED_CLICK object:nil];

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
    if (indexPath.row == 0) {
        return ADBANNAVIEW_SIZE.height;
    }
    return isPad ? 58.0 : 44.0;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    //UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:<#@"reuseIdentifier"#> forIndexPath:indexPath];
    
    /*if (indexPath.row == COUNT - 1) {
        MainSubmitViewCell *cell = [MainSubmitViewCell loadfromNib];
        // Configure the cell...
        if (cell != nil) {
            [cell.submitbuttom setBackgroundColor:MAIN_COLOR];
            [cell.submitbuttom setTitle:NSLocalizedString(@"STRING_SUBMIT", nil) forState:UIControlStateNormal];
            [cell.submitbuttom addTarget:_houseDelegate action:@selector(submit:) forControlEvents:UIControlEventTouchUpInside];
            cell.delegate = (id)self;
        }
        
        return cell;
    } else */if (indexPath.row == 0){
        UITableViewCell *cell = [[UITableViewCell alloc] initWithFrame:CGRectMake(0, 0, self.tableView.frame.size.width, 44.0)];
        if (adview == nil) {
            adview = [[AdBanaView alloc] initWithAppKey:ADBANNA_ID placement:ADBANNA_PLACEMENT adType:ADBANNA_TYPE delegate:self];
            
            
            adview.frame = CGRectMake((self.tableView.frame.size.width - ADBANNAVIEW_SIZE.width) / 2, 0, ADBANNAVIEW_SIZE.width, ADBANNAVIEW_SIZE.height);
        }
        [cell.contentView addSubview:adview];

        return cell;
    } else if (indexPath.row == 5){
        MainFirstTableViewCell *cell = [MainFirstTableViewCell loadfromNib];
        // Configure the cell...
        [cell configButton:[_houseDelegate.housevalue getIsFirst]];
        return cell;
    } else if (indexPath.row == 7){
        MainHourseYearsTableViewCell *cell = [MainHourseYearsTableViewCell loadfromNib];
        BOOL isFive = [_houseDelegate.housevalue getIsFiveYearsAndOnlyOne];
        BOOL isTwo  = [_houseDelegate.housevalue getIsTwoYears];
        BOOL isNot = !(isFive || isTwo);
        [cell configButton:isFive withTwoYears:isTwo withNotTwo:isNot];
    // Configure the cell...
        return cell;
    } else {
        MainTableViewCell *cell = [MainTableViewCell loadfromNib];
        // Configure the cell...
        if (cell != nil) {
            cell.textfield.row = indexPath.row;
            cell.textfield.index = 1;
            cell.textfield.tag = 100 + indexPath.row;
            cell.textfieldtax.row = indexPath.row;
            cell.textfieldtax.index = 0;
            
            cell.housetitle.text = [HouseStrings getTitle:(HOUSEVALUETYPE)indexPath.row];
            cell.houseinfo.text = [HouseStrings getInformation:(HOUSEVALUETYPE)indexPath.row];
            BOOL showSegment = [HouseStrings getShowSegment:(HOUSEVALUETYPE)indexPath.row];
            cell.textfield.hidden = showSegment;
            cell.textfieldtax.hidden = ![HouseStrings getShowTaxFiled:(HOUSEVALUETYPE)indexPath.row];
            cell.textfield.delegate = _houseDelegate;
            cell.textfieldtax.delegate = _houseDelegate;
            cell.textfield.keyboardType = UIKeyboardTypeDecimalPad;
            cell.textfield.returnKeyType = UIReturnKeyDone;
            cell.textfieldtax.keyboardType = UIKeyboardTypeDecimalPad;
            cell.textfieldtax.returnKeyType = UIReturnKeyDone;
            cell.textfield.textColor = [HouseStrings getTextColor:(HOUSEVALUETYPE)indexPath.row];

            if (indexPath.row == HOUSEVALUETYPE_ORIGINAL_VALUE) {
                if ([_houseDelegate.housevalue getHomeValue] == 2) {
                    cell.textfield.enabled = NO;
                }
            } else {
                cell.textfield.enabled = ![HouseStrings getEnableFiled:(HOUSEVALUETYPE)indexPath.row];
            }
            cell.textfieldtax.text = [_houseDelegate getDefaultValue:(HOUSEVALUETYPE)indexPath.row position:0];
            cell.textfield.text = [_houseDelegate getDefaultValue:(HOUSEVALUETYPE)indexPath.row position:1];
           
            cell.taxunit.hidden = cell.textfieldtax.hidden || ![HouseStrings getShowUnit:(HOUSEVALUETYPE)indexPath.row];;
;

 
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
    UITableView *scrollView = self.tableView;
    CGFloat scale = [UIScreen mainScreen].scale;

    UIImage* clipimage = [savedImage getSubImage:CGRectMake(0, ADBANNAVIEW_SIZE.height*scale, scrollView.contentSize.width*scale, (scrollView.contentSize.height - ADBANNAVIEW_SIZE.height)*scale)];
    [self saveImageToPhotos:clipimage];
}

- (void)housevalueChanged:(UISegmentedControl*)segement {
    [_houseDelegate.housevalue setHomeValue:segement.selectedSegmentIndex];
}

- (UIImage *) imageWithView1:(UIView *)view{
    UIImage *viewImage = nil;
    UITableView *scrollView = self.tableView;
    CGSize sz = CGSizeMake(scrollView.contentSize.width, scrollView.contentSize.height);
    UIGraphicsBeginImageContextWithOptions(sz, scrollView.opaque, 0.0);
    {
        CGContextRef newContext = UIGraphicsGetCurrentContext();
        CGContextSetFillColorWithColor(newContext, [UIColor whiteColor].CGColor);
        CGContextFillRect(newContext, CGRectMake(0, 0, sz.width, sz.height));
        
        CGPoint savedContentOffset = scrollView.contentOffset;
        CGRect savedFrame = scrollView.frame;
        
        scrollView.contentOffset = CGPointMake(0, 0);
        scrollView.frame = CGRectMake(0, 0, scrollView.contentSize.width, scrollView.contentSize.height);
        
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

- (void)onCheckRadioButton:(NSNotification*)obj {
    NSDictionary* dic = obj.object;
    NSString* tag = [dic objectForKey:KEY_TAG];
    NSString* checked = [dic objectForKey:KEY_CHECKED];
    NSInteger tagvalue = tag.integerValue;
    BOOL checkValue = checked.intValue == 1;
    switch (tagvalue) {
        case TAG_FIRST_HOURSE:
            if (checkValue) {
                [_houseDelegate.housevalue setIsFirst:checkValue];
            }
            break;
        case TAG_SCOND_HOURSE:
            if (checkValue) {
                [_houseDelegate.housevalue setIsFirst:!checkValue];
            }
            break;
        case TAG_FIVE_ONYLE:
            if (checkValue) {
                [_houseDelegate.housevalue setIsFiveYearsAndOnlyOne:checkValue];
                [_houseDelegate.housevalue setIsTwoYears:!checkValue];
            }
            break;
            
        case TAG_TWO_YEARS:
            if (checkValue) {
                [_houseDelegate.housevalue setIsTwoYears:checkValue];
                [_houseDelegate.housevalue setIsFiveYearsAndOnlyOne:!checkValue];
            }
            break;
        case TAG_NOT_TWO_YEARS:
            if (checkValue) {
                [_houseDelegate.housevalue setIsTwoYears:!checkValue];
                [_houseDelegate.housevalue setIsFiveYearsAndOnlyOne:!checkValue];
            }
            
            break;
        default:
            break;
    }
  
}

- (void)onClickRadioButton {
    [_houseDelegate resginKeyboard];

    [_houseDelegate.housevalue backDefaultDeedTax];
    [_houseDelegate.housevalue backPersonalTax];
    if ([_houseDelegate.housevalue getHomeValue] == 2) {
        [_houseDelegate.housevalue setPersonalTax:@"1"];
    }
    [_houseDelegate.housevalue backRatioOfLoan];
    [self didCalculate];
}

- (void)changeHouseValue:(id)sender {
    [_houseDelegate resginKeyboard];

    UISegmentedControl* seg = (UISegmentedControl*)sender;
    [_houseDelegate.housevalue setHomeValue:seg.selectedSegmentIndex];
    [ _houseDelegate.housevalue backOriginalValue];
    if ([_houseDelegate.housevalue getHomeValue] == 2) {
        [_houseDelegate.housevalue setPersonalTax:@"1"];
    }
    [self didCalculate];
}

@end
