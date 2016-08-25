//
//  HouseCaculate.h
//  Loan
//
//  Created by JiaLi on 16/8/25.
//  Copyright © 2016年 JiaLi. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface HouseCaculate : NSObject

+ (NSString*)getDeedTax:(NSString*)area isfist:(BOOL)first;

+ (NSString*)getPersonalTax:(BOOL)isFiveYearsAndOnlyOne netPrice:(NSString*)netPrice originalValue:(NSString*)originalValue hourseValue:(NSInteger)hourseValue;

+ (NSString*)getSaleTax:(BOOL)isTwoYears netPrice:(NSString*)netPrice originalValue:(NSString*)originalValue hourseValue:(NSInteger)hourseValue;

+ (NSString*)getAgency:(NSString*)transactionprice agencyRatio:(NSString*)agencyRatio;

+ (NSString*)getFeesforAssignment:(NSString*)area hourseValue:(NSInteger)hourseValue;

+ (NSString*)getRatioOfLoan:(NSString*)tax netPrice:(NSString*)netPrice;

+ (NSString*)getFinalDownPayment:(NSString*)transactionPrice deedTax:(NSString*)deedTax saleTax:(NSString*)saleTax personalTax:(NSString*)personalTax agencyTax:(NSString*)agencyTax feeforAssignment:(NSString*)feeforAssignment finalLoan:(NSString*)finalLoan;

+ (NSString*)getTotalPrice:(NSString*)transactionPrice deedTax:(NSString*)deedTax saleTax:(NSString*)saleTax personalTax:(NSString*)personalTax agencyTax:(NSString*)agencyTax feeforAssignment:(NSString*)feeforAssignment;

@end
