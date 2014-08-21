//
//  FISAddLocationViewController.m
//  locationTrivia-dataStore
//
//  Created by Chris Gonzales on 8/21/14.
//  Copyright (c) 2014 Joe Burgess. All rights reserved.
//

#import "FISAddLocationViewController.h"
#import "FISLocation.h"
#import "FISLocationsDataStore.h"

@interface FISAddLocationViewController ()
@property (weak, nonatomic) IBOutlet UITextField *nameField;
@property (weak, nonatomic) IBOutlet UITextField *latitudeField;
@property (weak, nonatomic) IBOutlet UITextField *longitudeField;
- (IBAction)submitButtonTapped:(id)sender;
- (IBAction)cancelButtonTapped:(id)sender;

@end

@implementation FISAddLocationViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

- (IBAction)submitButtonTapped:(id)sender {
    NSNumber *latitude = [NSNumber numberWithInteger:[self.latitudeField.text integerValue]];
    NSNumber *longitude = [NSNumber numberWithInteger:[self.longitudeField.text integerValue]];
    FISLocation *newLocation = [[FISLocation alloc] initWithName:self.nameField.text Latitude:latitude Longitude:longitude];
    [[FISLocationsDataStore sharedLocationsDataStore].locations addObject:newLocation];
    [self dismissViewControllerAnimated:YES completion:nil];
}

- (IBAction)cancelButtonTapped:(id)sender {
    [self dismissViewControllerAnimated:YES completion:nil];
}

@end
