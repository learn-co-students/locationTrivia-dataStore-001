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
- (IBAction)saveButtonTapped:(id)sender;
- (IBAction)cancelButtonTapped:(id)sender;
@property (weak, nonatomic) IBOutlet UIButton *saveButton;

@property (weak, nonatomic) IBOutlet UIButton *cancelButton;

@end

@implementation FISAddLocationViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    [self setupAccessibilityLabels];
}

-(void) setupAccessibilityLabels
{
    self.nameField.accessibilityLabel = @"nameField";
    self.nameField.accessibilityIdentifier = @"nameField";
    
    self.latitudeField.accessibilityLabel = @"latitudeField";
    self.latitudeField.accessibilityIdentifier = @"latitudeField";
    
    self.longitudeField.accessibilityLabel = @"longitudeField";
    self.longitudeField.accessibilityIdentifier = @"longitudeField";
    
    self.saveButton.accessibilityLabel = @"saveButton";
    self.saveButton.accessibilityIdentifier = @"saveButton";
    
    self.cancelButton.accessibilityLabel = @"cancelButton";
    self.cancelButton.accessibilityIdentifier = @"cancelButton";
}

- (IBAction)saveButtonTapped:(id)sender {
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
