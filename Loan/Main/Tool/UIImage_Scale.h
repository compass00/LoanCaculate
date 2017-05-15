//
//  UIImage_Scale.h
//  Loan
//
//  Created by JiaLi on 2017/3/15.
//  Copyright © 2017年 JiaLi. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIImage(UIImageScale)
-(UIImage*)getSubImage:(CGRect)rect;
-(UIImage*)scaleToSize:(CGSize)size;
@end
