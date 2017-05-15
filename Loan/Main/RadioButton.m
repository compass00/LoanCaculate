//
//  RadioButton.m
//
//  Created by Sergey Nikitenko on 3/5/13.
//  Copyright 2013 Sergey Nikitenko. All rights reserved.
//
//  Permission is hereby granted, free of charge, to any person obtaining a copy
//  of this software and associated documentation files (the "Software"), to deal
//  in the Software without restriction, including without limitation the rights
//  to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
//  copies of the Software, and to permit persons to whom the Software is
//  furnished to do so, subject to the following conditions:
//
//  The above copyright notice and this permission notice shall be included in
//  all copies or substantial portions of the Software.
//
//  THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
//  IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
//  FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
//  AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
//  LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
//  OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN
//  THE SOFTWARE.
//

#import "RadioButton.h"


@interface RaidoButtonGroup()
{
    NSMutableArray* _goup;
}
@end

@implementation RaidoButtonGroup
- (void)addGroup:(RadioButton*)button {
    if (_goup == nil) {
        _goup = [[NSMutableArray alloc] init];
    }
    [_goup addObject:button];
    [button addTarget:self action:@selector(onTouchUpInsideCheck:) forControlEvents:UIControlEventTouchUpInside];
}

- (void)setChecked:(RadioButton*)button {
    [button setChecked:YES];
    for (RadioButton* b in _goup) {
        if (b != button) {
            [b setChecked:NO];
        }
    }
}

-(void) onTouchUpInsideCheck:(id)sender
{
    RadioButton* button = (RadioButton*)sender;
    if ([_goup count] == 1) {
        [button setChecked:!button.checked];
        [[NSNotificationCenter defaultCenter] postNotificationName:KNOTIFICATION_RADIO_CHECKED_CLICK object:nil];

        return;
    }
    
    if (button.checked) {
        [[NSNotificationCenter defaultCenter] postNotificationName:KNOTIFICATION_RADIO_CHECKED_CLICK object:nil];
        return;
    }
    [button setChecked:!button.checked];
    for (RadioButton* b in _goup) {
        if (b != button) {
            [b setChecked:NO];
        }
    }
    [[NSNotificationCenter defaultCenter] postNotificationName:KNOTIFICATION_RADIO_CHECKED_CLICK object:nil];
}

@end

@implementation RadioButton

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    self.checked = NO;
    return self;
}

-(void) awakeFromNib
{
    [super awakeFromNib];
    _checked = NO;

	/*if(![[self allTargets] containsObject:self]) {
		[super addTarget:self action:@selector(onTouchUpInside) forControlEvents:UIControlEventTouchUpInside];
	}*/
}

- (void)setChecked:(BOOL)checked {
    _checked = checked;
    NSDictionary* ob = [NSDictionary dictionaryWithObjectsAndKeys:[NSString stringWithFormat:@"%ld", (long)self.tag], KEY_TAG, [NSString stringWithFormat:@"%d", checked], KEY_CHECKED, nil];
    [[NSNotificationCenter defaultCenter] postNotificationName:KNOTIFICATION_RADIO_CHECKED_CHANGE object:ob];
    if (checked) {
        [self setImage:[UIImage imageNamed:@"checked"] forState:UIControlStateNormal];
    } else {
        [self setImage:[UIImage imageNamed:@"unchecked"] forState:UIControlStateNormal];
    }
}



@end
