//
//  FISAddLocationViewController.h
//  locationTrivia-dataStore
//
//  Created by Joshua Motley on 8/28/15.
//  Copyright (c) 2015 Joe Burgess. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "FISLocation.h"
#import "FISLocationsDataManager.h"

@interface FISAddLocationViewController : UIViewController
@property (weak, nonatomic) IBOutlet UITextField *locName;
@property (weak, nonatomic) IBOutlet UITextField *locLatitude;
@property (weak, nonatomic) IBOutlet UITextField *locLongitude;

@end
