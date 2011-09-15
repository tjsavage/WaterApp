//
//  Leak.h
//  WaterApp
//
//  Created by Taylor Savage on 7/31/11.
//  Copyright 2011 Rototutor. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <CoreLocation/CoreLocation.h>
#import "LeakType.h"

@class LeakType;

@interface Leak : NSObject {
    CLLocation *location;
    LeakType *leakType;
    int severity;
    NSString *comments;
    UIImage *image;
}

@property (nonatomic, assign) CLLocationCoordinate2D location;
@property (nonatomic, retain) LeakType *leakType;
@property (nonatomic, assign) int severity;
@property (nonatomic, retain) NSString *comments;
@property (nonatomic, retain) UIImage *image;

- initWithLeakType:(LeakType *)leakType;

@end
