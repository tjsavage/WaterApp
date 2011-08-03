//
//  Request.m
//  WaterApp
//
//  Created by Taylor Savage on 8/2/11.
//  Copyright 2011 Rototutor. All rights reserved.
//

#import "Request.h"

@implementation Request

- (id)init
{
    self = [super init];
    if (self) {
        // Initialization code here.
    }
    
    return self;
}

-(id)initWithUrl:(NSString *)url parameters:(NSDictionary *)params {
    self = [super init];
    
    return [self autorelease];
}


- (NSDictionary *)resultAsDict {
    /* Faked dictionary */
    NSMutableDictionary *brokenSprinklerType = [NSMutableDictionary dictionaryWithObjectsAndKeys:
                                                @"Broken Sprinkler", @"description",
                                                [NSArray arrayWithObjects:@"Minor", @"Significant", @"Gushing", nil],@"severities",
                                                @"1", @"id", 
                                                @"2", @"criticalSeverity", nil];
    NSMutableDictionary *leakyFaucetType = [NSMutableDictionary dictionaryWithObjectsAndKeys:
                                                @"Leaky Faucet", @"description",
                                                [NSArray arrayWithObjects:@"Dripping", @"Trickling", @"Pouring", nil],@"severities",
                                                @"2", @"id", 
                                                @"1", @"criticalSeverity", nil];
                                                
   
    return [NSMutableDictionary dictionaryWithObjectsAndKeys:
             [NSArray arrayWithObjects:brokenSprinklerType, leakyFaucetType, nil], @"leakTypes", nil];
}

@end
