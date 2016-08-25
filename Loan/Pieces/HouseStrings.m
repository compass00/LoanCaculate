//
//  HouseValue.m
//  Loan
//
//  Created by JiaLi on 16/8/24.
//  Copyright © 2016年 JiaLi. All rights reserved.
//

#import "HouseStrings.h"

@implementation HouseStrings

+ (NSArray *)getHouseStringsArray
{
    static NSArray *sharedInstance = nil;
    static dispatch_once_t predicate;
    dispatch_once(&predicate, ^{
        sharedInstance = [[NSArray alloc] initWithObjects:NSLocalizedString(@"STRING_AREA", nil),
                          NSLocalizedString(@"STRING_TRANSACTION_PRICE", nil),
                          NSLocalizedString(@"STRING_NET_PRICE", nil),
                          NSLocalizedString(@"STRING_HOUSE_NATURE", nil),
                          NSLocalizedString(@"STRING_HOUSE_ORIGINAL_VALUE", nil),
                          NSLocalizedString(@"STRING_HOUSE_FIRST", nil),
                          NSLocalizedString(@"STRING_HOUSE_DEED_TEXT", nil),
                          NSLocalizedString(@"STRING_HOUSE_FIVEYEARS_ONLYONE", nil),
                          NSLocalizedString(@"STRING_HOUSE_PERSONAL_TAX", nil),
                          NSLocalizedString(@"STRING_HOUSE_TWOYEARS", nil),
                          NSLocalizedString(@"STRING_HOUSE_SALE_TAX", nil),
                          NSLocalizedString(@"STRING_HOUSE_AGENCY", nil),
                          NSLocalizedString(@"STRING_HOUSE_FEESFORASSIGNMENT", nil),
                          NSLocalizedString(@"STRING_HOUSE_RATIO_OF_LOAN", nil),
                          NSLocalizedString(@"STRING_HOUSE_DOWN_PAYMENT", nil),
                          NSLocalizedString(@"STRING_HOUSE_TOTAL_PRICE", nil),
                          nil];
    });
    return sharedInstance;
}


+(NSString*)getTitle:(HOUSEVALUETYPE)type {
    NSArray* stArray = [HouseStrings getHouseStringsArray];
    if (type < [stArray count]) {
        return stArray[type];
    }
    return @"";
    
    /*
    switch (type) {
        // 0
        case  HOUSEVALUETYPE_AREA:
            return NSLocalizedString(@"STRING_AREA", nil);
        // 1
        case  HOUSEVALUETYPE_TRASACTION_PRICE:
            return NSLocalizedString(@"STRING_TRANSACTION_PRICE", nil);

        // 2
        case  HOUSEVALUETYPE_NET_PRICE:
            return NSLocalizedString(@"STRING_NET_PRICE", nil);
        // 3
        case  HOUSEVALUETYPE_HOME_VALUE:
            return NSLocalizedString(@"STRING_HOUSE_NATURE", nil);
        // 4
        case  HOUSEVALUETYPE_ORIGINAL_VALUE:
            return NSLocalizedString(@"STRING_HOUSE_ORIGINAL_VALUE", nil);
       // 5
        case  HOUSEVALUETYPE_FIRST:
            return NSLocalizedString(@"STRING_HOUSE_FIRST", nil);
        // 6
        case  HOUSEVALUETYPE_DEED_TAX:
            return NSLocalizedString(@"STRING_HOUSE_DEED_TEXT", nil);
        // 7
        case  HOUSEVALUETYPE_FIVEYEARS_ONLYONE:
            return NSLocalizedString(@"STRING_HOUSE_FIVEYEARS_ONLYONE", nil);
        // 8
        case  HOUSEVALUETYPE_PERSONAL_TAX:
            return NSLocalizedString(@"STRING_HOUSE_PERSONAL_TAX", nil);
        // 9
        case  HOUSEVALUETYPE_TWOYEARS:
            return NSLocalizedString(@"STRING_HOUSE_TWOYEARS", nil);
        // 10
        case  HOUSEVALUETYPE_SALE_TAX:
            return NSLocalizedString(@"STRING_HOUSE_SALE_TAX", nil);
        // 11
        case  HOUSEVALUETYPE_AGENCY:
            return NSLocalizedString(@"STRING_HOUSE_AGENCY", nil);
        // 12
        case  HOUSEVALUETYPE_FEESFORASSIGNMENT:
            return NSLocalizedString(@"STRING_HOUSE_FEESFORASSIGNMENT", nil);
        // 13
        case  HOUSEVALUETYPE_RATIO_OF_LOAN:
            return NSLocalizedString(@"STRING_HOUSE_RATIO_OF_LOAN", nil);
        // 14
        case  HOUSEVALUETYPE_DOWN_PAYMENT:
            return NSLocalizedString(@"STRING_HOUSE_DOWN_PAYMENT", nil);
        // 15
        case  HOUSEVALUETYPE_TOTAL_PRICE:
         return NSLocalizedString(@"STRING_HOUSE_TOTAL_PRICE", nil);

        default:
            return @"";
    }*/
}

+(NSString*)getInformation:(HOUSEVALUETYPE)type {
    switch (type) {
            // 0
        case  HOUSEVALUETYPE_AREA:
            return NSLocalizedString(@"STRING_AREA_UNIT", nil);
            // 1
        case  HOUSEVALUETYPE_TRASACTION_PRICE:
            return NSLocalizedString(@"STRING_AREA_UNIT_PRICE", nil);
            
            // 2
        case  HOUSEVALUETYPE_NET_PRICE:
            return NSLocalizedString(@"STRING_AREA_UNIT_PRICE", nil);
            // 3
        case  HOUSEVALUETYPE_HOME_VALUE:
            return NSLocalizedString(@"STRING_HOUSE_NATURE_INFO", nil);
            // 4
        case  HOUSEVALUETYPE_ORIGINAL_VALUE:
            return NSLocalizedString(@"STRING_HOUSE_ORIGINAL_VALUE_INFO", nil);
            // 5
        case  HOUSEVALUETYPE_FIRST:
            return NSLocalizedString(@"STRING_HOUSE_FIRST_INFO", nil);
            // 6
        case  HOUSEVALUETYPE_DEED_TAX:
            return NSLocalizedString(@"STRING_HOUSE_DEED_TEXT_INFO", nil);
            // 7
        case  HOUSEVALUETYPE_FIVEYEARS_ONLYONE:
            return NSLocalizedString(@"STRING_HOUSE_FIVEYEARS_ONLYONE_INFO", nil);
            // 8
        case  HOUSEVALUETYPE_PERSONAL_TAX:
            return NSLocalizedString(@"STRING_HOUSE_PERSONAL_TAX_INFO", nil);
            // 9
        case  HOUSEVALUETYPE_TWOYEARS:
            return NSLocalizedString(@"STRING_HOUSE_TWOYEARS_INFO", nil);
            // 10
        case  HOUSEVALUETYPE_SALE_TAX:
            return NSLocalizedString(@"STRING_HOUSE_SALE_TAX_INFO", nil);
            // 11
        case  HOUSEVALUETYPE_AGENCY:
            return NSLocalizedString(@"STRING_HOUSE_AGENCY_INFO", nil);
            // 12
        case  HOUSEVALUETYPE_FEESFORASSIGNMENT:
            return NSLocalizedString(@"STRING_HOUSE_FEESFORASSIGNMENT_INFO", nil);
            // 13
        case  HOUSEVALUETYPE_RATIO_OF_LOAN:
            return NSLocalizedString(@"STRING_HOUSE_RATIO_OF_LOAN_INFO", nil);
            // 14
        case  HOUSEVALUETYPE_DOWN_PAYMENT:
            return NSLocalizedString(@"STRING_HOUSE_DOWN_PAYMENT_INFO", nil);
            // 15
        case  HOUSEVALUETYPE_TOTAL_PRICE:
            return NSLocalizedString(@"STRING_HOUSE_TOTAL_PRICE_INFO", nil);
            
        default:
            return @"";
    }

}

+(BOOL)getShowSegment:(HOUSEVALUETYPE)type {
    if (type == HOUSEVALUETYPE_FIRST || type == HOUSEVALUETYPE_HOME_VALUE ||  type == HOUSEVALUETYPE_FIVEYEARS_ONLYONE || type == HOUSEVALUETYPE_TWOYEARS) {
        return YES;
    }
    return NO;
}

+(BOOL)getShowTaxFiled:(HOUSEVALUETYPE)type {
    if (type == HOUSEVALUETYPE_DEED_TAX || type == HOUSEVALUETYPE_PERSONAL_TAX ||  type == HOUSEVALUETYPE_SALE_TAX|| type == HOUSEVALUETYPE_AGENCY || type == HOUSEVALUETYPE_FEESFORASSIGNMENT || type == HOUSEVALUETYPE_RATIO_OF_LOAN) {
        return YES;
    }
    return NO;
}

+(BOOL)getEnableFiled:(HOUSEVALUETYPE)type {
    if (type == HOUSEVALUETYPE_DEED_TAX || type == HOUSEVALUETYPE_PERSONAL_TAX ||  type == HOUSEVALUETYPE_SALE_TAX|| type == HOUSEVALUETYPE_AGENCY || type == HOUSEVALUETYPE_FEESFORASSIGNMENT || type == HOUSEVALUETYPE_RATIO_OF_LOAN || type == HOUSEVALUETYPE_DOWN_PAYMENT || type == HOUSEVALUETYPE_TOTAL_PRICE) {
        return YES;
    }
    return NO;
}
@end
