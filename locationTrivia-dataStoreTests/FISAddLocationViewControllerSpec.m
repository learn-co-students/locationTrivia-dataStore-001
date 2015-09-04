//
//  FISAddLocationViewControllerSpec.m
//  locationTrivia-dataStore
//
//  Created by Tom OMalley on 9/3/15.
//  Copyright 2015 Joe Burgess. All rights reserved.
//

#import "FISAddLocationViewController.h"
#import "FISLocationsDataStore.h"

#import <Specta/Specta.h>
#import <Expecta/Expecta.h>
#import <KIF/KIF.h>

SpecBegin(FISAddLocationViewController)

describe(@"FISAddLocationViewController", ^{

    __block FISAddLocationViewController *addLocationVC;
    __block UINavigationController *navController;

    beforeAll(^{
        UIWindow *window = [[UIApplication sharedApplication].delegate window];

        UIStoryboard *storyboard = [UIStoryboard storyboardWithName:@"Main" bundle:nil];
        navController = [storyboard instantiateInitialViewController];

        [window setRootViewController: navController];
        [window makeKeyAndVisible];

        [tester tapViewWithAccessibilityLabel:@"addButton"];
       
        addLocationVC = (FISAddLocationViewController*)navController.visibleViewController;
        //checked in first it-block
    });

    it(@"is reachable via firstVC's addButton with accessibiltyLabel", ^{
        expect([addLocationVC isMemberOfClass:[FISAddLocationViewController class]]).to.beTruthy();
    });
    
    describe(@"nameField", ^{
        __block UITextField *nameField;
       
        beforeAll(^{
            nameField = (UITextField*)[tester waitForViewWithAccessibilityLabel:@"nameField"];
        });
        
        it(@"is accessible via accessibilityLabel", ^{
            expect(nameField).toNot.beNil();
        });
        
        it(@"is a textField", ^{
            expect([nameField isMemberOfClass:[UITextField class]]).to.beTruthy();
        });
        
        it(@"has userInteractionEnabled", ^{
            expect(nameField.userInteractionEnabled).to.beTruthy();
        });
    });
    
    describe(@"latitudeField", ^{
        __block UITextField *latitudeField;
        
        beforeAll(^{
            latitudeField = (UITextField*)[tester waitForViewWithAccessibilityLabel:@"latitudeField"];
        });
        
        it(@"is accessible via accessibilityLabel", ^{
            expect(latitudeField).toNot.beNil();
        });
        
        it(@"is a textField", ^{
            expect([latitudeField isMemberOfClass:[UITextField class]]).to.beTruthy();
        });
        
        it(@"has userInteractionEnabled", ^{
            expect(latitudeField.userInteractionEnabled).to.beTruthy();
        });
    });
    
    describe(@"longitudeField", ^{
        __block UITextField *longitudeField;
        
        beforeAll(^{
            longitudeField = (UITextField*)[tester waitForViewWithAccessibilityLabel:@"longitudeField"];
        });
        
        it(@"is accessible via accessibilityLabel", ^{
            expect(longitudeField).toNot.beNil();
        });
        
        it(@"is a textField", ^{
            expect([longitudeField isMemberOfClass:[UITextField class]]).to.beTruthy();
        });
        
        it(@"has userInteractionEnabled", ^{
            expect(longitudeField.userInteractionEnabled).to.beTruthy();
        });
    });
    
    describe(@"saveButton", ^{
       __block UIButton *saveButton;
        
        beforeAll(^{
            saveButton = (UIButton*)[tester waitForViewWithAccessibilityLabel:@"saveButton"];
        });
        
        it(@"is accessible via accessibilityLabel", ^{
            expect(saveButton).toNot.beNil();
        });
        
        it(@"saves a new FISLocation to the datastore", ^{
            FISLocationsDataStore *dataStore = [FISLocationsDataStore sharedLocationsDataStore];
            
            NSInteger dataStoreCountPreSave = dataStore.locations.count;
            [tester tapViewWithAccessibilityLabel:@"saveButton"];
            [tester waitForTimeInterval:0.5];
            NSInteger dataStoreCountPostSave = dataStore.locations.count;
            
            expect(dataStoreCountPostSave).to.equal(dataStoreCountPreSave + 1);
        });
        
        it(@"saves a new FISLocation with actual user input", ^{
            FISLocationsDataStore *dataStore = [FISLocationsDataStore sharedLocationsDataStore];
            
            NSString *testLocationName = @"Test Location";
            NSString *testLocationLat = @"40.7050";
            NSString *testLocationLong = @"74.0136";
            
            [tester enterText:testLocationName intoViewWithAccessibilityLabel:@"nameField"];
            [tester enterText:testLocationLat intoViewWithAccessibilityLabel:@"latitudeField"];
            [tester enterText:testLocationLong intoViewWithAccessibilityLabel:@"longitudeField"];
            
            [tester tapViewWithAccessibilityLabel:@"saveButton"];
            [tester waitForTimeInterval:0.5];
            FISLocation *savedLocation = [dataStore.locations lastObject];
            
            expect(savedLocation.name).to.equal(testLocationName);
            expect(savedLocation.latitude).to.equal(@([testLocationLat integerValue]));
            expect(savedLocation.longitude).to.equal(@([testLocationLong integerValue]));
        });
        
        it(@"dismisses the AddLocationsVC", ^{
            [tester tapViewWithAccessibilityLabel:@"saveButton"];
            [tester waitForTimeInterval:1.0];
            expect([navController.visibleViewController class]).toNot.equal([FISAddLocationViewController class]);
        });
        
        afterEach(^{
            if([navController.visibleViewController class] != [FISAddLocationViewController class])
            {
                [tester tapViewWithAccessibilityLabel:@"addButton"];
            }
        });
    });
    
    describe(@"cancelButton", ^{
        __block UIButton *cancelButton;
        
        beforeAll(^{
            cancelButton = (UIButton*)[tester waitForViewWithAccessibilityLabel:@"cancelButton"];
        });
        
        it(@"is accessible via accessibilityLabel", ^{
            expect(cancelButton).toNot.beNil();
        });
        
        it(@"dismisses the AddLocationsVC", ^{
            [tester tapViewWithAccessibilityLabel:@"cancelButton"];
            [tester waitForTimeInterval:1.0];
            expect([navController.visibleViewController class]).toNot.equal([FISAddLocationViewController class]);
        });
        
        afterEach(^{
            if([navController.visibleViewController class] != [FISAddLocationViewController class])
            {
                [tester tapViewWithAccessibilityLabel:@"addButton"];
            }
        });
    });
});

SpecEnd