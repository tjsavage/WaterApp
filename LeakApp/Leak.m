//
//  Leak.m
//  WaterApp
//
//  Created by Taylor Savage on 7/31/11.
//  Copyright 2011 Rototutor. All rights reserved.
//

#import "Leak.h"


@implementation Leak

@synthesize location = _location, severity = _severity, image = _image;
@synthesize comments = _comments, leakType = _leakType, sunetID = _sunetID;

- initWithLeakType:(LeakType *)type {
    self = [super init];
    if (self) {
        self.leakType = type;
    }
    
    return self;
}

- (NSString *)description {
    return [NSString stringWithFormat:@"'leak': { 'type': '%@', 'severity': '%@', 'latitude': '%f', 'longitude': '%f' 'comments': '%@', 'sunetid': '%@'}",
            self.leakType,
            [self.leakType.severities objectAtIndex:self.severity],
            self.location.latitude,
            self.location.longitude,
            self.comments,
            self.sunetID];
}

@end
