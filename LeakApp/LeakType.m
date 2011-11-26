//
//  LeakType.m
//  WaterApp
//
//  Created by Taylor Savage on 8/2/11.
//  Copyright 2011 Rototutor. All rights reserved.
//

#import "LeakType.h"

@implementation LeakType

@synthesize description = _description, serverId = _serverId, severities = _severities, criticalSeverity = _criticalSeverity, category = _category;

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
        NSLog(@"PROPERTIES: %@", properties);
        self.description = [properties objectForKey:@"description"];
        self.category = [properties objectForKey:@"category"];
        NSDictionary *severities = [properties objectForKey:@"severities"];
        self.severities = [NSArray arrayWithObjects:[severities objectForKey:@"high"], [severities objectForKey:@"mid"], [severities objectForKey:@"low"], nil];
        self.criticalSeverity = [[properties objectForKey:@"critical_severity"] intValue];
    }
    
    return self;
}

- (Leak *)leak {
    return [[[Leak alloc] initWithLeakType:self] autorelease];
}

- (BOOL)isEqual:(id)object {
    if ([object isKindOfClass:[LeakType class]]) {
        return [[(LeakType *)object description] isEqualToString:self.description];
    }
    return NO;
}

@end
