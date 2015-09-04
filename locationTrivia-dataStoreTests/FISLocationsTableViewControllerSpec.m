//
//  FISLocationsTableViewControllerSpec.m
//  locationTrivia-dataStore
//
//  Created by Tom OMalley on 9/3/15.
//  Copyright 2015 Joe Burgess. All rights reserved.
//
#import "FISAppDelegate.h"
#import "FISLocationsTableViewController.h"
#import "FISAddLocationViewController.h"

#import <Specta/Specta.h>
#import <Expecta/Expecta.h>
#define EXP_SHORTHAND
#import <KIF/KIF.h>


SpecBegin(FISLocationsTableViewController)

describe(@"FISLocationsTableViewController", ^{
    
    __block FISLocationsTableViewController *locationsTVC;
    __block UINavigationController *navController;
    
    beforeAll(^{
        UIWindow *window = [[UIApplication sharedApplication].delegate window];
        
        UIStoryboard *storyboard = [UIStoryboard storyboardWithName:@"Main" bundle:nil];
        navController = [storyboard instantiateInitialViewController];
        
        [window setRootViewController:navController];
        [window makeKeyAndVisible];
        
        locationsTVC = (FISLocationsTableViewController*)navController.visibleViewController;
        // ^ checked in first it block
    });

    it(@"viewController setup hasn't been modified from starter code", ^{
        expect([locationsTVC isMemberOfClass:[FISLocationsTableViewController class]]).to.beTruthy();
    });
    
    describe(@"addButton", ^{
        __block UIBarButtonItem *addButton;
        
        it(@"can be accessed via accessibilityLabel", ^{
             addButton = (UIBarButtonItem*)[tester waitForViewWithAccessibilityLabel:@"addButton"];
            expect(addButton).toNot.beNil();
        });
    
        it(@"segues to FISAddLocationsViewController", ^{
            [tester tapViewWithAccessibilityLabel:@"addButton"];
            expect(navController.visibleViewController.class).to.equal([FISAddLocationViewController class]);
            [navController popViewControllerAnimated:NO];
        });
    });
});

SpecEnd
