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
@synthesize comments = _comments, leakType = _leakType;

- initWithLeakType:(LeakType *)type {
    self = [super init];
    if (self) {
        self.leakType = type;
    }
    
    return self;
}

@end
