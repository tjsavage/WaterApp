//
//  LeakManager.h
//  WaterApp
//
//  Created by Taylor Savage on 8/2/11.
//  Copyright 2011 Rototutor. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "LeakType.h"
#import "Leak.h"

@class Leak, LeakType;

@interface LeakManager : NSObject

@property (nonatomic, retain) NSMutableDictionary *leakTypes;
@property (nonatomic, retain) Leak *newLeak;

- (id)initWithLeakTypes:(NSArray *)leakTypesDicts;

@end
