//
//  DatePickerView.m
//  iosTest
//
//  Created by ndolgopolov on 18.05.17.
//  Copyright © 2017 ndolgopolov. All rights reserved.
//

#import "DatePickerView.h"

@implementation DatePickerView



+ (id)pickerView
{
    DatePickerView *picker = [[[NSBundle mainBundle] loadNibNamed:@"DatePickerView" owner:nil options:nil] lastObject];
    
    CGPoint viewCenter =  picker.center;
    viewCenter.x = [[UIScreen mainScreen] bounds].size.width/2;
    viewCenter.y = [[UIScreen mainScreen] bounds].size.height/2;
    picker.center = viewCenter;
    picker.layer.borderColor = [UIColor grayColor].CGColor;
    picker.layer.borderWidth = 1.0;
    picker.hidden = YES;
    if ([picker isKindOfClass:[DatePickerView class]])
        return picker;
    else
        return nil;
}

- (IBAction)closeBtn:(id)sender {
    
    [UIView animateWithDuration:.5 animations:^{
        self.hidden = YES;
        //  self.datePickerView.frame = CGRectMake(0, 150, originFrame.size.width, originFrame.size.height);
    }];
}
/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

@end
