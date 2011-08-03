//
//  LeakType.m
//  WaterApp
//
//  Created by Taylor Savage on 8/2/11.
//  Copyright 2011 Rototutor. All rights reserved.
//

#import "LeakType.h"

@implementation LeakType

@synthesize description = _description, serverId = _serverId, severities = _severities, criticalSeverity = _criticalSeverity;

- (id)init
{
    self = [super init];
    if (self) {
        // Initialization code here.
    }
    
    return self;
}

- (id)initWithProperties:(NSDictionary *)properties {
    if (self = [super init]) {
        self.description = [properties objectForKey:@"description"];
        self.serverId = [[properties objectForKey:@"id"] intValue];
        [self.severities addObjectsFromArray:[properties objectForKey:@"severities"]];
        self.criticalSeverity = [[properties objectForKey:@"criticalSeverity"] intValue];
    }
    
    return self;
}


@end
