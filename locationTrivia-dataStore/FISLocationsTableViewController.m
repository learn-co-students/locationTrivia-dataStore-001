//
//  FISLocationsTableViewController.m
//  locationTrivia-tableviews
//
//  Created by Joe Burgess on 6/20/14.
//  Copyright (c) 2014 Joe Burgess. All rights reserved.
//
#import "FISLocation.h"
#import "FISLocationsTableViewController.h"
#import "FISTriviaTableViewController.h"

@interface FISLocationsTableViewController ()
@property (weak, nonatomic) IBOutlet UIBarButtonItem *addButton;

@end

@implementation FISLocationsTableViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    self.store = [FISLocationsDataStore sharedLocationsDataStore];

    [self setupAccessibiltyLabels];
    [self generateTestData];
}

-(void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
    [self.tableView reloadData];
}

#pragma mark - Accessibility Labels
-(void) setupAccessibiltyLabels
{
    self.view.accessibilityIdentifier=@"Locations Table";
    self.view.accessibilityLabel=@"Locations Table";
    
    self.addButton.accessibilityLabel = @"addButton";
    self.addButton.accessibilityIdentifier = @"addButton";
}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    // Return the number of sections.
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    // Return the number of rows in the section.
    return [self.store.locations count];
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"rightCell" forIndexPath:indexPath];


    FISLocation *location = self.store.locations[indexPath.row];

    cell.textLabel.text = location.name;

//    NSString *triviaCount = [location numberOfTriva];

    cell.detailTextLabel.text = [location numberOfTriva];
    return cell;
}

#pragma mark - Navigation

- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    if (![segue.identifier isEqualToString:@"addLocation"]) {
        
        NSIndexPath *ip = [self.tableView indexPathForSelectedRow];
        FISLocation *location = self.store.locations[ip.row];
        
        FISTriviaTableViewController *triviaVC = segue.destinationViewController;
        
        triviaVC.trivia = location.trivia;
    }
}

#pragma mark - Test Data

-(void) generateTestData
{
    FISLocation *location1 = [[FISLocation alloc] initWithName:@"The Empire State Building"
                                                      Latitude:@40.7484
                                                     Longitude:@-73.9857];
    
    FISTrivia *trivia1A = [[FISTrivia alloc] initWithContent:@"1,454 Feet Tall" Likes:4];
    FISTrivia *trivia1B = [[FISTrivia alloc] initWithContent:@"Cost $24,718,000 to build" Likes:2];
    
    [location1.trivia addObjectsFromArray:@[trivia1A, trivia1B]];
    
    FISLocation *location2 = [[FISLocation alloc] initWithName:@"Bowling Green"
                                                      Latitude:@41.3739
                                                     Longitude:@-83.6508];
    
    FISTrivia *trivia2A = [[FISTrivia alloc] initWithContent:@"NYC's oldest park" Likes:8];
    FISTrivia *trivia2B = [[FISTrivia alloc] initWithContent:@"Made a park in 1733" Likes:2];
    FISTrivia *trivia2C = [[FISTrivia alloc] initWithContent:@"Charging Bull was created in 1989" Likes:0];
    
    
    [location2.trivia addObjectsFromArray:@[trivia2A, trivia2B, trivia2C]];
    
    FISLocation *location3 = [[FISLocation alloc] initWithName:@"Statue Of Liberty"
                                                      Latitude:@40.6892
                                                     Longitude:@74.0444];
    FISTrivia *trivia3A = [[FISTrivia alloc] initWithContent:@"Gift from the french" Likes:6];
    
    [location3.trivia addObjectsFromArray:@[trivia3A]];
    
    self.store.locations = [NSMutableArray arrayWithArray:@[location2, location1, location3]];
}

@end
