//
//  LeakManager.m
//  WaterApp
//
//  Created by Taylor Savage on 8/2/11.
//  Copyright 2011 Rototutor. All rights reserved.
//

#import "LeakManager.h"
#import "LeakType.h"
#import "Leak.h"

@class LeakType, Leak;

@implementation LeakManager

@synthesize newLeak = _newLeak, leakTypes = _leakTypes, emergencyPhone = _emergencyPhone, emergencyEmail = _emergencyEmail;

- (id)init
{
    self = [super init];
    if (self) {
        self.newLeak = [[[Leak alloc] init] autorelease];
    }
    
    return self;
}

- (id)initWithLeakTypes:(NSArray *)leakTypesDicts {
    self = [self init];
    
    self.leakTypes = [NSMutableDictionary dictionary];
    
    for (NSDictionary *leakTypeDict in leakTypesDicts) {
        LeakType *leakType = [[LeakType alloc] initWithProperties:leakTypeDict];
        [self.leakTypes setObject:leakType forKey:leakType.description];
    }
    
    return [self autorelease];
}

- (void)setEmergencyContactFromDict:(NSDictionary *)emergencyDict {
    NSLog(@"Dict: %@", emergencyDict);
    self.emergencyPhone = [emergencyDict objectForKey:@"phone_number"];
    self.emergencyEmail = [emergencyDict objectForKey:@"email"];
}

@end
