//
//  FISAddLocationViewController.m
//  locationTrivia-dataStore
//
//  Created by Joshua Motley on 8/28/15.
//  Copyright (c) 2015 Joe Burgess. All rights reserved.
//

#import "FISAddLocationViewController.h"

@interface FISAddLocationViewController ()

@end

@implementation FISAddLocationViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

- (IBAction)saveButton:(id)sender {
    [self.navigationController popViewControllerAnimated:YES];
    FISLocationsDataManager *dataMan  = [FISLocationsDataManager sharedLocationsDataManager];
    FISLocation *location = [[FISLocation alloc]initWithName:self.locName.text latitude:self.locLatitude.text longitude:self.locLongitude.text];
    [dataMan.locations addObject:location];
    
    
}


@end
