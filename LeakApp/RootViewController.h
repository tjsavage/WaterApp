//
//  RootViewController.h
//  LeakApp
//
//  Created by Taylor Savage on 9/14/11.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <MapKit/MapKit.h>
#import "LeakCreationDelegate.h"

@class LeakManager, LeakCreationTableViewController, MapViewController;

@interface RootViewController : UIViewController <LeakCreationDelegate>

@property (nonatomic, retain) LeakManager *leakManager;
@property (nonatomic, retain) LeakCreationTableViewController *tableViewController;
@property (nonatomic, retain) MapViewController *mapViewController;

@end
