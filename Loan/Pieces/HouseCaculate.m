//
//  HouseCaculate.m
//  Loan
//
//  Created by JiaLi on 16/8/25.
//  Copyright © 2016年 JiaLi. All rights reserved.
//

#import "HouseCaculate.h"

@implementation HouseCaculate
+ (NSString*)getStringfromFloat:(float)rate {
    return [NSString stringWithFormat: @"%.3f", rate];
}

+ (NSString*)getDeedTax:(NSString*)area isfist:(BOOL)first {
    float areaf = [area floatValue];
    float rate = 0.0f;
    if (first) {
        rate = areaf > 90.0 ? 0.015: 0.001;
    } else {
        rate = 0.03;
    }
    return [self getStringfromFloat:(areaf * rate)];
}

+ (NSString*)getPersonalTax:(BOOL)isFiveYearsAndOnlyOne netPrice:(NSString*)netPrice originalValue:(NSString*)originalValue hourseValue:(NSInteger)hourseValue {
    float rate = 0.0f;
    if (isFiveYearsAndOnlyOne) {
        return [self getStringfromFloat:0.00];
    } else {
        float netPricef = [netPrice floatValue];
        float originalvaluef = [originalValue floatValue];
        
        if (hourseValue == 2) {
            rate = netPricef * 0.01;
        } else {
            rate = netPricef * 0.1;
            rate = netPricef - originalvaluef - rate;
        }
        return [self getStringfromFloat:rate];
    }
}

+ (NSString*)getSaleTax:(BOOL)isTwoYears netPrice:(NSString*)netPrice originalValue:(NSString*)originalValue hourseValue:(NSInteger)hourseValue {
    
    float rate = 0.0f;
    float netPricef = [netPrice floatValue];
    float originalvaluef = [originalValue floatValue];
    if (!isTwoYears) {
        rate = netPricef * 0.056;
        return [self getStringfromFloat:rate];
    } else {
        if (hourseValue == 0) {
            return [self getStringfromFloat:0.00];
        } else if (hourseValue == 1) {
            rate = (netPricef - originalvaluef) * 0.056;
            return [self getStringfromFloat:rate];
        } else {
            return [self getStringfromFloat:0.00];
        }
    }
}

+ (NSString*)getAgency:(NSString*)transactionprice agencyRatio:(NSString*)agencyRatio {
    float transactionpricef = [transactionprice floatValue];
    float agencyRatiof = [agencyRatio floatValue];
    float rate = transactionpricef *  agencyRatiof * 0.01;
    return [self getStringfromFloat:rate];
}


+ (NSString*)getFeesforAssignment:(NSString*)area hourseValue:(NSInteger)hourseValue
{
    if (hourseValue != 2) {
        return [self getStringfromFloat:0.00f];
    }
    float areaf = [area floatValue];
    float rate = 15.6 * areaf / 10000;
    return [self getStringfromFloat:rate];
}


+ (NSString*)getRatioOfLoan:(NSString*)tax netPrice:(NSString*)netPrice{
    float netPricef = [netPrice floatValue];
    float taxf = [tax floatValue];
    float rate = taxf * netPricef * 0.01;
    return [self getStringfromFloat:rate];
}

+ (NSString*)getFinalDownPayment:(NSString*)transactionPrice deedTax:(NSString*)deedTax saleTax:(NSString*)saleTax personalTax:(NSString*)personalTax agencyTax:(NSString*)agencyTax feeforAssignment:(NSString*)feeforAssignment finalLoan:(NSString*)finalLoan {
    float rate = [transactionPrice floatValue] + [deedTax floatValue] + [saleTax floatValue] + [personalTax floatValue] + [agencyTax floatValue] + [feeforAssignment floatValue] - [finalLoan floatValue];
    return [self getStringfromFloat:rate];
}


+ (NSString*)getTotalPrice:(NSString*)transactionPrice deedTax:(NSString*)deedTax saleTax:(NSString*)saleTax personalTax:(NSString*)personalTax agencyTax:(NSString*)agencyTax feeforAssignment:(NSString*)feeforAssignment {
    float rate = [transactionPrice floatValue] + [deedTax floatValue] + [saleTax floatValue] + [personalTax floatValue] + [agencyTax floatValue] + [feeforAssignment floatValue];
    return [self getStringfromFloat:rate];
}

@end
