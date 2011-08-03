//
//  LeakType.h
//  WaterApp
//
//  Created by Taylor Savage on 8/2/11.
//  Copyright 2011 Rototutor. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface LeakType : NSObject {
    NSString *description;
    NSMutableArray *severities;
    int serverId;
    int criticalSeverity;
}

@property (nonatomic, retain) NSString *description;
@property (nonatomic, assign) int serverId;
@property (nonatomic, retain) NSMutableArray *severities;
@property (nonatomic, assign) int criticalSeverity;

- (id)initWithProperties:(NSDictionary *)properties;

@end
