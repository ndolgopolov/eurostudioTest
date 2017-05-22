//
//  CountriesListViewController.m
//  iosTest
//
//  Created by ndolgopolov on 18.05.17.
//  Copyright © 2017 ndolgopolov. All rights reserved.
//

#import "CountriesListViewController.h"

@interface CountriesListViewController (){

    NSArray *listArray;

}

@end

@implementation CountriesListViewController

- (void)viewDidLoad {
    [super viewDidLoad];

    [self.tableView registerClass:[UITableViewCell class] forCellReuseIdentifier:@"reuseCell"];

    NSString *path = [[NSBundle mainBundle] pathForResource:@"list_of_countries" ofType:@"csv"];
    
    NSString *file = [NSString stringWithContentsOfFile:path encoding:NSUTF8StringEncoding error:nil];
    listArray = [file componentsSeparatedByString:@"\n"];
    

}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return [listArray count];
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"reuseCell" forIndexPath:indexPath];
    cell.textLabel.text = listArray[indexPath.row];
    // Configure the cell...
    
    return cell;
}


- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    if(self.delegate&& [self.delegate respondsToSelector:@selector(selectedCountry:)]){
    
       [self.navigationController popViewControllerAnimated:YES];
       [self.delegate selectedCountry:listArray[indexPath.row]];
    
    }
    
    
}



@end
