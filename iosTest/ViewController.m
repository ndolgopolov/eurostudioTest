//
//  ViewController.m
//  iosTest
//
//  Created by ndolgopolov on 18.05.17.
//  Copyright © 2017 ndolgopolov. All rights reserved.
//

#import "ViewController.h"

@interface ViewController (){


    BOOL checkLicence;
}

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    //[self.titleView borde]
    _titleView.layer.borderColor = [UIColor blackColor].CGColor;
    _titleView.layer.borderWidth = 3.0;
    
    
    self.datePickerView = [DatePickerView pickerView];
    [self.datePickerView.datePicker addTarget:self action:@selector(updateBirthdayField:) forControlEvents:UIControlEventValueChanged];
    
    [self.view addSubview:self.datePickerView];
    // Do any additional setup after loading the view, typically from a nib.
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


- (IBAction)checked:(id)sender {
    
    checkLicence = !checkLicence;
    [_checkBox setImage:[UIImage imageNamed:checkLicence?@"checked":@"unchecked"] forState:UIControlStateNormal];
    [self checkFilled];
}
- (IBAction)openCountryList:(id)sender {
    
    [self performSegueWithIdentifier:@"openList" sender:nil];
    
    
}

- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    
    if ([[segue identifier] isEqualToString:@"openList"])
    {
     
        CountriesListViewController *list = [segue destinationViewController];
        list.delegate = (id)self;
        
    }
}

- (IBAction)showDatePicker:(id)sender {
    
    [self presentDatePicker];
    
}

- (IBAction)editField:(id)sender {
    [self checkFilled];
}

- (void)presentDatePicker
{
    
    if (self.datePickerView.hidden == NO) { return; }

    [UIView animateWithDuration:.5 animations:^{
        self.datePickerView.hidden = NO;
    }];

}

- (void) updateBirthdayField:(UIDatePicker *)picker{
    
    NSDateFormatter *dateFormatter = [[NSDateFormatter alloc] init];
    [dateFormatter setDateFormat:@"dd.MM.yyyy"];

    NSString *formattedDateString = [dateFormatter stringFromDate:picker.date];
    _birthdayField.text = formattedDateString;
    
}


-(void) selectedCountry:(NSString *)countryName{

    _countryField.text = countryName;
    [self checkFilled];

}

- (void)checkFilled{

    BOOL isFilled = YES;
    if (![_loginField.text length]) isFilled = NO;
    if (![_passwordField.text length]) isFilled = NO;
    if (![_confirmPassField.text length]) isFilled = NO;
    if (![_birthdayField.text length]) isFilled = NO;
    if (![_countryField.text length]) isFilled = NO;
    if (![_mailField.text length]) isFilled = NO;
    if (!checkLicence) isFilled = NO;
    
    if (isFilled) {
     
        [_regBtn setEnabled:YES];
    } else {
    
        [_regBtn setEnabled:NO];
    
    }
    
}
@end
