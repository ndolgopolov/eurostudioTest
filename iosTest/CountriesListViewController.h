//
//  CountriesListViewController.h
//  iosTest
//
//  Created by ndolgopolov on 18.05.17.
//  Copyright © 2017 ndolgopolov. All rights reserved.
//

#import <UIKit/UIKit.h>
@protocol DelegateCountriesListViewController <NSObject>
-(void) selectedCountry:(NSString *)countryName;
@end
@interface CountriesListViewController : UITableViewController
@property (strong, nonatomic) id<DelegateCountriesListViewController> delegate;
@end
