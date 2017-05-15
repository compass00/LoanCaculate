//
//  HouseValue.m
//  Loan
//
//  Created by JiaLi on 16/8/24.
//  Copyright © 2016年 JiaLi. All rights reserved.
//

#import "HouseValue.h"
#import "HouseCaculate.h"
@implementation HouseValue

/*
 #define KEY_HOUSEVALUETYPE_AREA @"Area"
 #define KEY_HOUSEVALUETYPE_TRASACTION_PRICE @"TransactionPrice"
 #define KEY_HOUSEVALUETYPE_NET_PRICE @"NetPrice"
 #define KEY_HOUSEVALUETYPE_HOME_VALUE @"HomeValue"
 #define KEY_HOUSEVALUETYPE_ORIGINAL_VALUE @"OrignalValue"
 #define KEY_HOUSEVALUETYPE_FIRST @"IsFirst"
 #define KEY_HOUSEVALUETYPE_DEED_TAX @"DeedTax"
 #define KEY_HOUSEVALUETYPE_FIVEYEARS_ONLYONE @"FiveYearsAndOnlyOne"
 #define KEY_HOUSEVALUETYPE_PERSONAL_TAX @"PersonalTax"
 #define KEY_HOUSEVALUETYPE_TWOYEARS @"TwoYears"
 #define KEY_HOUSEVALUETYPE_SALE_TAX @"SaleTax"
 #define KEY_HOUSEVALUETYPE_AGENCY @"Agency"
 #define KEY_HOUSEVALUETYPE_FEESFORASSIGNMENT @"FeesForAssignment"
 #define KEY_HOUSEVALUETYPE_RATIO_OF_LOAN @"RatioOfLoan"
 #define KEY_HOUSEVALUETYPE_DOWN_PAYMENT @"DownPayment"
 #define KEY_HOUSEVALUETYPE_TOTAL_PRICE @"TotalPrice"
*/
-(id)init {
    self = [super init];
    _valuedic = [[NSMutableDictionary alloc] init];
    return self;
}

- (void)setArea:(NSString*)value {
    if (value == nil) {
        return;
    }
    [_valuedic setObject:value forKey:KEY_HOUSEVALUETYPE_AREA];
}

- (NSString*)getArea {
    NSString* area = [_valuedic objectForKey:KEY_HOUSEVALUETYPE_AREA];
    if (area == nil || area.length < 1) {
         area = @"57.34";
        [self setArea:area];
    }
    return area;
}


- (void)setTransactionPrice:(NSString*)value {
    if (value == nil) {
        return;
    }

    [_valuedic setObject:value forKey:KEY_HOUSEVALUETYPE_TRASACTION_PRICE];
    
    float defaultNetPrice = [value floatValue] * 0.9;
    NSString* p = [NSString stringWithFormat: @"%d", (NSInteger)defaultNetPrice];
    [self setNetPrice:p];
}

- (NSString*)getTransactionPrice {
    NSString* p = [_valuedic objectForKey:KEY_HOUSEVALUETYPE_TRASACTION_PRICE];
    if (p == nil || p.length < 1) {
        p = @"354";
        [self setTransactionPrice:p];
    }
    return p;
}


- (void)setNetPrice:(NSString*)value {
    if (value == nil) {
        return;
    }
    
    [_valuedic setObject:value forKey:KEY_HOUSEVALUETYPE_NET_PRICE];
}

- (NSString*)getNetPrice {
    NSString* p=  [_valuedic objectForKey:KEY_HOUSEVALUETYPE_NET_PRICE];
    if (p == nil || p.length < 1) {
        float defaultNetPrice = [[self getTransactionPrice] floatValue] * 0.9;
        p = [NSString stringWithFormat: @"%ld", (long)defaultNetPrice];
        [self setNetPrice:p];
    }
    return p;
}


- (void)setHomeValue:(NSInteger)value {

    
    [_valuedic setObject:@(value) forKey:KEY_HOUSEVALUETYPE_HOME_VALUE];
}

- (NSInteger)getHomeValue {
    NSString* value = [_valuedic objectForKey:KEY_HOUSEVALUETYPE_HOME_VALUE];
    if (value != nil) {
        return [value integerValue];
    }
    return 0;
}


- (void)setOriginalValue:(NSString*)value {
    if (value == nil) {
        return;
    }
    
    [_valuedic setObject:value forKey:KEY_HOUSEVALUETYPE_ORIGINAL_VALUE];
}

- (NSString*)getOriginalValue {
    NSString* value =  [_valuedic objectForKey:KEY_HOUSEVALUETYPE_ORIGINAL_VALUE];
    if (value == nil || value.length < 1) {
        value = @"0";
        [self setOriginalValue:value];
    }
    return value;
}

- (void)backOriginalValue {
    if ([self getHomeValue] == 2) {
        [self setOriginalValue:@"0"];
    }
}

- (void)setIsFirst:(BOOL)value {
    [_valuedic setObject:@(value) forKey:KEY_HOUSEVALUETYPE_FIRST];
    
}

- (BOOL)getIsFirst {
    NSString* value = [_valuedic objectForKey:KEY_HOUSEVALUETYPE_FIRST];
    if (value != nil) {
        return [value integerValue];
    }
    return 1;
}


- (void)setDeedTax:(NSString*)value {
    if (value == nil) {
        return;
    }
    
    [_valuedic setObject:value forKey:KEY_HOUSEVALUETYPE_DEED_TAX];

}

- (void)backDefaultDeedTax {
    NSString* value = [HouseCaculate getDeedDefaultTax:[self getArea] isfist:[self getIsFirst]];
        [self setDeedTax:value];
}

- (NSString*)getDeedTax {
    NSString* value =  [_valuedic objectForKey:KEY_HOUSEVALUETYPE_DEED_TAX];
    if (value == nil || value.length < 1) {
        value = [HouseCaculate getDeedDefaultTax:[self getArea] isfist:[self getIsFirst]];
        [self setDeedTax:value];
    }
    return value;
}

- (NSString*)getDeedTaxCalculation {
    return [HouseCaculate getDeedTax:[self getNetPrice] deedtax:[self getDeedTax]];
}

- (void)setDeedTaxCalculation:(NSString*)value {
    if (value == nil) {
        return;
    }
    
    [_valuedic setObject:value forKey:KEY_HOUSEVALUETYPE_DEED_TAX_CAL];
}


- (void)setIsFiveYearsAndOnlyOne:(BOOL)value {
    [_valuedic setObject:@(value) forKey:KEY_HOUSEVALUETYPE_FIVEYEARS_ONLYONE];
    if (value) {
        [_valuedic setObject:@(!value) forKey:KEY_HOUSEVALUETYPE_TWOYEARS];
    }
}

- (BOOL)getIsFiveYearsAndOnlyOne {
    NSString* value = [_valuedic objectForKey:KEY_HOUSEVALUETYPE_FIVEYEARS_ONLYONE];
    if (value != nil) {
        return [value integerValue];
    }
    return 1;
}


- (void)setPersonalTax:(NSString*)value {
    if (value == nil) {
        return;
    }
    
    [_valuedic setObject:value forKey:KEY_HOUSEVALUETYPE_PERSONAL_TAX];
}

- (void)backPersonalTax {
    if ([self getIsFiveYearsAndOnlyOne]) {
        [self setPersonalTax:@"0"];
    } else {
        [self setPersonalTax:@"20"];
    }
}

- (NSString*)getPersonalTax {
    NSString* value = [_valuedic objectForKey:KEY_HOUSEVALUETYPE_PERSONAL_TAX];
    if (value == nil || value.length < 1) {
        value = @"20";
        [self setPersonalTax:value];
    }
    return value;

}

- (NSString*)getPersonalTaxCalculation {
    
    BOOL isFive = [self getIsFiveYearsAndOnlyOne];
    return [HouseCaculate getPersonalTax:isFive transactionPrice:[self getTransactionPrice] netPrice:[self getNetPrice] originalValue:[self getOriginalValue] hourseValue:[self getHomeValue]];
}

- (void)setPersonalTaxCalculation:(NSString*)value {
    if (value == nil) {
        return;
    }
    
    [_valuedic setObject:value forKey:KEY_HOUSEVALUETYPE_PERSONAL_TAX_CAL];
}

- (void)setIsTwoYears:(BOOL)value {
    [_valuedic setObject:@(value) forKey:KEY_HOUSEVALUETYPE_TWOYEARS];
    if (value) {
        [self setIsFiveYearsAndOnlyOne:NO];
    }
}

- (BOOL)getIsTwoYears {
    NSString* value = [_valuedic objectForKey:KEY_HOUSEVALUETYPE_TWOYEARS];
    if (value != nil) {
        return [value integerValue];
    }
    return 0;
}


- (void)setSaleTax:(NSString*)value {
    if (value == nil) {
        return;
    }
    
    [_valuedic setObject:value forKey:KEY_HOUSEVALUETYPE_SALE_TAX];
}

- (NSString*)getSaleTax {
    NSString* value = [_valuedic objectForKey:KEY_HOUSEVALUETYPE_SALE_TAX];
    if (value == nil || value.length < 1) {
        value = @"0";
        [self setSaleTax:value];
    }
    return value;
}

- (NSString*)getSaleTaxCalculation {
    BOOL bIsTwoYears = [self getIsTwoYears] || [self getIsFiveYearsAndOnlyOne];
    return [HouseCaculate getSaleTax:bIsTwoYears netPrice:[self getNetPrice] originalValue:[self getOriginalValue] hourseValue:[self getHomeValue]];
}

- (void)setSaleTaxCalculation:(NSString*)value {
    if (value == nil) {
        return;
    }
    
    [_valuedic setObject:value forKey:KEY_HOUSEVALUETYPE_SALE_TAX_CAL];

}

- (void)setAgency:(NSString*)value {
    if (value == nil) {
        return;
    }
    
   [_valuedic setObject:value forKey:KEY_HOUSEVALUETYPE_AGENCY];

}

- (NSString*)getAgency {
    NSString* value = [_valuedic objectForKey:KEY_HOUSEVALUETYPE_AGENCY];
    if (value == nil || value.length < 1) {
        value = @"2.7";
        [self setAgency:value];
    }
    return value;

}

- (NSString*)getAgencyCalculation {
    return [HouseCaculate getAgency:[self getTransactionPrice] agencyRatio:[self getAgency]];
}

- (void)setAgencyCalculation:(NSString*)value {
    if (value == nil) {
        return;
    }
    
    [_valuedic setObject:value forKey:KEY_HOUSEVALUETYPE_AGENCY_CAL];

}

- (void)setFeesforAssignment:(NSString*)value {
    if (value == nil) {
        return;
    }
   [_valuedic setObject:value forKey:KEY_HOUSEVALUETYPE_FEESFORASSIGNMENT];

}

- (NSString*)getFeesforAssignment {
    NSString* value =  [_valuedic objectForKey:KEY_HOUSEVALUETYPE_FEESFORASSIGNMENT];
    if (value == nil || value.length < 1) {
        value = @"15.6";
        [self setFeesforAssignment:value];
    }
    return value;
}

- (NSString*)getFeesforAssignmentCalculation {
    return [HouseCaculate getFeesforAssignment:[self getArea] hourseValue:[self getHomeValue]];
}

- (void)setFeesforAssignmentCalculation:(NSString*)value {
    if (value == nil) {
        return;
    }
    [_valuedic setObject:value forKey:KEY_HOUSEVALUETYPE_FEESFORASSIGNMENT_CAL];

}

- (void)backRatioOfLoan {
    if ([self getIsFirst]) {
        [self setRatioOfLoan:@"70"];
    } else {
        [self setRatioOfLoan:@"20"];
    }
}

- (void)setRatioOfLoan:(NSString*)value {
    if (value == nil) {
        return;
    }
    
    [_valuedic setObject:value forKey:KEY_HOUSEVALUETYPE_RATIO_OF_LOAN];
}

- (NSString*)getRatioOfLoan {
    NSString* value =  [_valuedic objectForKey:KEY_HOUSEVALUETYPE_RATIO_OF_LOAN];
    if (value == nil || value.length < 1) {
        value = @"70";
        [self setRatioOfLoan:value];
    }
    return value;

}

- (NSString*)getRatioOfLoanCalculation {
    return [HouseCaculate getRatioOfLoan:[self getRatioOfLoan] netPrice:[self getNetPrice]];
}

- (void)setRatioOfLoanCalculation:(NSString*)value {
    if (value == nil) {
        return;
    }
    
    [_valuedic setObject:value forKey:KEY_HOUSEVALUETYPE_RATIO_OF_LOAN_CAL];
}

- (NSString*)getFinalDownPaymentCalculation {
    return [HouseCaculate getFinalDownPayment:[self getTransactionPrice] deedTax:[self getDeedTaxCalculation] saleTax:[self getSaleTaxCalculation] personalTax:[self getPersonalTaxCalculation] agencyTax:[self getAgencyCalculation] feeforAssignment:[self getFeesforAssignmentCalculation] finalLoan:[self getRatioOfLoanCalculation]];
}

- (void)setFinalDownPaymentCalculation:(NSString*)value {
    if (value == nil) {
        return;
    }
    
    [_valuedic setObject:value forKey:KEY_HOUSEVALUETYPE_DOWN_PAYMENT_CAL];
}

- (NSString*)getTotalPriceCalculation {
     return [HouseCaculate getTotalPrice:[self getTransactionPrice] deedTax:[self getDeedTaxCalculation] saleTax:[self getSaleTaxCalculation] personalTax:[self getPersonalTaxCalculation] agencyTax:[self getAgencyCalculation] feeforAssignment:[self getFeesforAssignmentCalculation]];
}

- (void)setTotalPriceCalculation:(NSString*)value {
    if (value == nil) {
        return;
    }
    
    [_valuedic setObject:value forKey:KEY_HOUSEVALUETYPE_TOTAL_PRICE_CAL];
}

- (NSString*)getSinglePriceCalculation {
    return [HouseCaculate getSinglePrice:[self getTotalPriceCalculation] andArea:[self getArea]];
}

- (void)setSinglePriceCalculation:(NSString*)value {
    if (value == nil) {
        return;
    }
    
    [_valuedic setObject:value forKey:KEY_HOUSEVALUETYPE_SINGLE_PRICE_CAL];
}


@end
