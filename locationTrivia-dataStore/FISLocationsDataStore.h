//
//  FISLocationsDataStore.h
//  locationTrivia-dataStore
//
//  Created by Joe Burgess on 6/23/14.
//  Copyright (c) 2014 Joe Burgess. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "FISLocation.h"

@interface FISLocationsDataStore : NSObject

@property (strong, nonatomic) NSMutableArray *locations;
+ (instancetype)sharedLocationsDataStore;
@end
