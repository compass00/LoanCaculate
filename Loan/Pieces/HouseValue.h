//
//  HouseValue.h
//  Loan
//
//  Created by JiaLi on 16/8/24.
//  Copyright © 2016年 JiaLi. All rights reserved.
//

#import <Foundation/Foundation.h>

#define KEY_HOUSEVALUETYPE_AREA @"Area"
#define KEY_HOUSEVALUETYPE_TRASACTION_PRICE @"TransactionPrice"
#define KEY_HOUSEVALUETYPE_NET_PRICE @"NetPrice"
#define KEY_HOUSEVALUETYPE_HOME_VALUE @"HomeValue"
#define KEY_HOUSEVALUETYPE_ORIGINAL_VALUE @"OrignalValue"
#define KEY_HOUSEVALUETYPE_FIRST @"IsFirst"
#define KEY_HOUSEVALUETYPE_DEED_TAX @"DeedTax"
#define KEY_HOUSEVALUETYPE_DEED_TAX_CAL @"DeedTaxCal"
#define KEY_HOUSEVALUETYPE_FIVEYEARS_ONLYONE @"FiveYearsAndOnlyOne"
#define KEY_HOUSEVALUETYPE_PERSONAL_TAX @"PersonalTax"
#define KEY_HOUSEVALUETYPE_PERSONAL_TAX_CAL @"PersonalTaxCal"
#define KEY_HOUSEVALUETYPE_TWOYEARS @"TwoYears"
#define KEY_HOUSEVALUETYPE_SALE_TAX @"SaleTax"
#define KEY_HOUSEVALUETYPE_SALE_TAX_CAL @"SaleTaxCal"
#define KEY_HOUSEVALUETYPE_AGENCY @"Agency"
#define KEY_HOUSEVALUETYPE_AGENCY_CAL @"AgencyCal"
#define KEY_HOUSEVALUETYPE_FEESFORASSIGNMENT @"FeesForAssignment"
#define KEY_HOUSEVALUETYPE_FEESFORASSIGNMENT_CAL @"FeesForAssignmentCal"
#define KEY_HOUSEVALUETYPE_RATIO_OF_LOAN @"RatioOfLoan"
#define KEY_HOUSEVALUETYPE_RATIO_OF_LOAN_CAL @"RatioOfLoanCal"
#define KEY_HOUSEVALUETYPE_DOWN_PAYMENT @"DownPayment"
#define KEY_HOUSEVALUETYPE_DOWN_PAYMENT_CAL @"DownPaymentCal"
#define KEY_HOUSEVALUETYPE_TOTAL_PRICE @"TotalPriceCal"
#define KEY_HOUSEVALUETYPE_TOTAL_PRICE_CAL @"TotalPriceCal"

@interface HouseValue : NSObject

@property(strong) NSMutableDictionary* valuedic;

- (void)setArea:(NSString*)value;
- (NSString*)getArea;

- (void)setTransactionPrice:(NSString*)value;
- (NSString*)getTransactionPrice;

- (void)setNetPrice:(NSString*)value;
- (NSString*)getNetPrice;

- (void)setHomeValue:(NSInteger)value;
- (NSInteger)getHomeValue;

- (void)setOriginalValue:(NSString*)value;
- (NSString*)getOriginalValue;

- (void)setIsFirst:(BOOL)value;
- (BOOL)getIsFirst;

- (void)setDeedTax:(NSString*)value;
- (NSString*)getDeedTax;
- (NSString*)getDeedTaxCalculation;
- (void)setDeedTaxCalculation:(NSString*)value;

- (void)setIsFiveYearsAndOnlyOne:(BOOL)value;
- (BOOL)getIsFiveYearsAndOnlyOne;

- (void)setPersonalTax:(NSString*)value;
- (NSString*)getPersonalTax;
- (NSString*)getPersonalTaxCalculation;
- (void)setPersonalTaxCalculation:(NSString*)value;

- (void)setIsTwoYears:(BOOL)value;
- (BOOL)getIsTwoYears;

- (void)setSaleTax:(NSString*)value;
- (NSString*)getSaleTax;
- (NSString*)getSaleTaxCalculation;
- (void)setSaleTaxCalculation:(NSString*)value;

- (void)setAgency:(NSString*)value;
- (NSString*)getAgency;
- (NSString*)getAgencyCalculation;
- (void)setAgencyCalculation:(NSString*)value;

- (void)setFeesforAssignment:(NSString*)value;
- (NSString*)getFeesforAssignment;
- (NSString*)getFeesforAssignmentCalculation;
- (void)setFeesforAssignmentCalculation:(NSString*)value;

- (void)setRatioOfLoan:(NSString*)value;
- (NSString*)getRatioOfLoan;
- (NSString*)getRatioOfLoanCalculation;
- (void)setRatioOfLoanCalculation:(NSString*)value;

- (NSString*)getFinalDownPaymentCalculation;
- (void)setFinalDownPaymentCalculation:(NSString*)value;

- (NSString*)getTotalPriceCalculation;
- (void)setTotalPriceCalculation:(NSString*)value;
@end
