//
//  DatePickerView.h
//  iosTest
//
//  Created by ndolgopolov on 18.05.17.
//  Copyright © 2017 ndolgopolov. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface DatePickerView : UIView
@property (weak, nonatomic) IBOutlet UIDatePicker *datePicker;
+ (id)pickerView;
- (IBAction)closeBtn:(id)sender;
@end
