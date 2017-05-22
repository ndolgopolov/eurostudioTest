//
//  ViewController.h
//  iosTest
//
//  Created by ndolgopolov on 18.05.17.
//  Copyright © 2017 ndolgopolov. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "DatePickerView.h"
#import "CountriesListViewController.h"

@interface ViewController : UIViewController
@property (weak, nonatomic) IBOutlet UIView *titleView;
@property (weak, nonatomic) IBOutlet UILabel *titleLabel;
@property (strong, nonatomic) DatePickerView *datePickerView;

- (IBAction)checked:(id)sender;
- (IBAction)openCountryList:(id)sender;
- (IBAction)showDatePicker:(id)sender;
- (IBAction)editField:(id)sender;

@property (weak, nonatomic) IBOutlet UITextField *loginField;
@property (weak, nonatomic) IBOutlet UITextField *passwordField;
@property (weak, nonatomic) IBOutlet UITextField *confirmPassField;

@property (weak, nonatomic) IBOutlet UITextField *birthdayField;
@property (weak, nonatomic) IBOutlet UITextField *countryField;
@property (weak, nonatomic) IBOutlet UITextField *mailField;
@property (weak, nonatomic) IBOutlet UIButton *checkBox;
@property (weak, nonatomic) IBOutlet UIButton *regBtn;

@property (weak, nonatomic) IBOutlet UILabel *isCorrectPass;
@property (weak, nonatomic) IBOutlet UILabel *isValidEmail;

@end

