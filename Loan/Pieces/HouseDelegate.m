//
//  HouseDelegate.m
//  Loan
//
//  Created by JiaLi on 16/8/24.
//  Copyright © 2016年 JiaLi. All rights reserved.
//

#import "HouseDelegate.h"
#import "HouseTextField.h"
#import "HouseStrings.h"

@implementation HouseDelegate
-(id)init {
    self = [super init];
    _housevalue = [[HouseValue alloc] init];
    return self;
}

- (void)textFieldDidEndEditing:(UITextField *)textField;             // may be called if forced even if shouldEndEditing
{
    if (_housevalue == nil) {
        return;
    }
    
    HouseTextField* t = (HouseTextField*)textField;
    NSLog(@"text : %@", t.text);
    NSLog(@"row : %d", t.row);
    NSLog(@"index :%d", t.index);
    switch (t.row) {
            // 0
        case  HOUSEVALUETYPE_AREA:
        {
            if (t.index == 1) {
                [_housevalue setArea:t.text];

            }
             break;
        }
            // 1
        case  HOUSEVALUETYPE_TRASACTION_PRICE:
        {
            if (t.index == 1) {
                [_housevalue setTransactionPrice:t.text];
            }
            break;
        }
            // 2
        case  HOUSEVALUETYPE_NET_PRICE:
        {
            if (t.index == 1) {
                [_housevalue setNetPrice:t.text];
            }
            break;
        }
            // 3
        case  HOUSEVALUETYPE_HOME_VALUE:
            break;
            // 4
        case  HOUSEVALUETYPE_ORIGINAL_VALUE:
        {
            if (t.index == 1) {
                [_housevalue setNetPrice:t.text];
            }
            break;
            
        }            // 5
        case  HOUSEVALUETYPE_FIRST:
            break;
        case  HOUSEVALUETYPE_DEED_TAX:
        {
            if (t.index == 0) {
                [_housevalue setDeedTax:t.text];
            }
            break;
        }
            // 7
        case  HOUSEVALUETYPE_FIVEYEARS_ONLYONE:
            break;
            // 8
        case  HOUSEVALUETYPE_PERSONAL_TAX:
        {
            if (t.index == 0) {
                [_housevalue setPersonalTax:t.text];
            }
            break;
        }
           // 9
        case  HOUSEVALUETYPE_TWOYEARS:
            break;
            // 10
        case  HOUSEVALUETYPE_SALE_TAX:
        {
            if (t.index == 0) {
                [_housevalue setPersonalTax:t.text];
            }
            break;
        }
            // 11
        case  HOUSEVALUETYPE_AGENCY:
        {
            if (t.index == 0) {
                [_housevalue setAgency:t.text];
            }
            break;
        }
            // 12
        case  HOUSEVALUETYPE_FEESFORASSIGNMENT:
        {
            if (t.index == 0) {
                [_housevalue setFeesforAssignment:t.text];
            }
            break;
        }
            // 13
        case  HOUSEVALUETYPE_RATIO_OF_LOAN:
        {
            if (t.index == 0) {
                [_housevalue setRatioOfLoan:t.text];
            }
            break;
        }
           // 14
        case  HOUSEVALUETYPE_DOWN_PAYMENT:
            break;
            // 15
        case  HOUSEVALUETYPE_TOTAL_PRICE:
            break;
            
        default:
           
            break;
    }
}

- (BOOL)textFieldShouldReturn:(UITextField *)textField;
{
    //HouseTextField* t = (HouseTextField*)textField;
    return YES;
}

- (IBAction)submit:(id)sender {
    NSString* deedtax = [_housevalue getDeedTaxCalculation];
    [_housevalue setDeedTaxCalculation:deedtax];
    
    NSString* persontax = [_housevalue getPersonalTaxCalculation];
    [_housevalue setPersonalTaxCalculation:persontax];
    
    NSString* saletax = [_housevalue getSaleTax];
    [_housevalue setSaleTaxCalculation:saletax];
    
    NSString* agency = [_housevalue getAgency];
    [_housevalue setAgencyCalculation:agency];
    
    NSString* fee = [_housevalue getFeesforAssignmentCalculation];
    [_housevalue setFeesforAssignmentCalculation:fee];
    
    NSString* loan = [_housevalue getRatioOfLoanCalculation];
    [_housevalue setRatioOfLoanCalculation:loan];
    
    NSString* payment =[_housevalue getFinalDownPaymentCalculation];
    [_housevalue setFinalDownPaymentCalculation:payment];
    
    NSString* total = [_housevalue getTotalPriceCalculation];
    [_housevalue setTotalPriceCalculation:total];
    
    if (self.calculationdelegate != nil) {
        [self.calculationdelegate didCalculate];
    }

}

- (IBAction)changeSegment:(id)sender {
    UISegmentedControl* segment = (UISegmentedControl*)sender;
    if (segment.tag == HOUSEVALUETYPE_HOME_VALUE) {
        [_housevalue setHomeValue:segment.selectedSegmentIndex];
    } else if (segment.tag == HOUSEVALUETYPE_FIRST) {
        [_housevalue setIsFirst:segment.selectedSegmentIndex];
    } else if (segment.tag == HOUSEVALUETYPE_FIVEYEARS_ONLYONE) {
        [_housevalue setIsFiveYearsAndOnlyOne:segment.selectedSegmentIndex];
    } else if (segment.tag == HOUSEVALUETYPE_TWOYEARS) {
        [_housevalue setIsTwoYears:segment.selectedSegmentIndex];
    }
}


- (NSString*)getDefaltTax:(NSInteger)type position:(NSInteger)pos
{
    switch (type) {
            // 0
        case  HOUSEVALUETYPE_AREA:
        {
            if (pos == 1) {
                return [_housevalue getArea];
                
            }
            break;
        }
            // 1
        case  HOUSEVALUETYPE_TRASACTION_PRICE:
        {
            if (pos == 1) {
                return [_housevalue getTransactionPrice];
            }
            break;
        }
            // 2
        case  HOUSEVALUETYPE_NET_PRICE:
        {
            if (pos == 1) {
                 return [_housevalue getNetPrice];
            }
            break;
        }
            // 3
        case  HOUSEVALUETYPE_HOME_VALUE:
            if (pos == 1) {
                return [NSString stringWithFormat:@"%d", [_housevalue getHomeValue]];
            }
            break;
            // 4
        case  HOUSEVALUETYPE_ORIGINAL_VALUE:
        {
            if (pos == 1) {
                return [_housevalue getOriginalValue];
            }
            break;
            
        }            // 5
        case  HOUSEVALUETYPE_FIRST:
            if (pos == 1) {
                return [NSString stringWithFormat:@"%d", [_housevalue getIsFirst]];
            }
            break;
        case  HOUSEVALUETYPE_DEED_TAX:
        {
            if (pos == 0) {
                return [_housevalue getDeedTax];
            } else {
                return [_housevalue getDeedTaxCalculation];
            }
            break;
        }
            // 7
        case  HOUSEVALUETYPE_FIVEYEARS_ONLYONE:
            if (pos == 1) {
                return [NSString stringWithFormat:@"%d", [_housevalue getIsFiveYearsAndOnlyOne]];
            }
            break;
            // 8
        case  HOUSEVALUETYPE_PERSONAL_TAX:
        {
            if (pos == 0) {
                return [_housevalue getPersonalTax];
            } else {
                return [_housevalue getPersonalTaxCalculation];
            }
            break;
        }
            // 9
        case  HOUSEVALUETYPE_TWOYEARS:
            if (pos == 1) {
                return [NSString stringWithFormat:@"%d", [_housevalue getIsTwoYears]];
            }
            break;
            // 10
        case  HOUSEVALUETYPE_SALE_TAX:
        {
            if (pos == 0) {
                return [_housevalue getSaleTax];
            } else {
                return [_housevalue getSaleTaxCalculation];
            }
            break;
        }
            // 11
        case  HOUSEVALUETYPE_AGENCY:
        {
            if (pos == 0) {
                return [_housevalue getAgency];
            } else {
                return [_housevalue getAgencyCalculation];
            }
            break;
        }
            // 12
        case  HOUSEVALUETYPE_FEESFORASSIGNMENT:
        {
            if (pos == 0) {
                return [_housevalue getFeesforAssignment];
            } else {
                return [_housevalue getFeesforAssignmentCalculation];
            }
            break;
        }
            // 13
        case  HOUSEVALUETYPE_RATIO_OF_LOAN:
        {
            if (pos == 0) {
                return [_housevalue getRatioOfLoan];
            } else {
                return [_housevalue getRatioOfLoanCalculation];
            }
            break;
        }
            // 14
        case  HOUSEVALUETYPE_DOWN_PAYMENT:
        {
            if (pos == 1) {
                return [_housevalue getFinalDownPaymentCalculation];
            }
            break;
            // 15
        case  HOUSEVALUETYPE_TOTAL_PRICE:
            if (pos == 1) {
                return [_housevalue getTotalPriceCalculation];
            }
                break;
            
        default:
            
            break;
    }
     }
    return @"0";

}
@end
