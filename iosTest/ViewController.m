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
    if (![self checkConfirmPass]) isFilled = NO;
    if (![_birthdayField.text length]) isFilled = NO;
    if (![_countryField.text length]) isFilled = NO;
    if (![self checkValidEmail]) isFilled = NO;
    if (!checkLicence) isFilled = NO;
    
    if (isFilled) {
     
        [_regBtn setEnabled:YES];
    } else {
    
        [_regBtn setEnabled:NO];
    
    }
    
}

- (BOOL)checkConfirmPass{

    if ((![_passwordField.text length])||(![_confirmPassField.text length])) {
        [_isCorrectPass setText:@""];
        return NO;
    }
    
    if ([_passwordField.text isEqualToString:_confirmPassField.text]) {
        
        [_isCorrectPass setText:@"Пароль и подтверждение совпадают"];
        [_isCorrectPass setTextColor:[UIColor greenColor]];
        return YES;
        
    } else {
    
        [_isCorrectPass setText:@"Пароль и подтверждение не совпадают"];
        [_isCorrectPass setTextColor:[UIColor redColor]];
        return NO;
    
    }

    
}

- (BOOL)checkValidEmail{
    
    if (![_mailField.text length]){
        [_isValidEmail setText:@""];
        return NO;
    }
    
    NSString *regexp = @"[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,4}";
    NSPredicate *checkMailPredicate = [NSPredicate predicateWithFormat:@"SELF MATCHES %@", regexp];
    BOOL isValid = [checkMailPredicate evaluateWithObject:_mailField.text];

    if (!isValid) {
        [_isValidEmail setText:@"Некорректный e-mail"];
    } else {
        [_isValidEmail setText:@""];
    }
    
    return isValid;
}
@end
