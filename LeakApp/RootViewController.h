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

@class LeakManager, LeakCreationTableViewController, MapViewController, LeakCreationInfoViewController;

@interface RootViewController : UIViewController <LeakCreationDelegate, UINavigationControllerDelegate>

@property (nonatomic, retain) LeakManager *leakManager;
@property (nonatomic, retain) LeakCreationTableViewController *tableViewController;
@property (nonatomic, retain) MapViewController *mapViewController;
@property (nonatomic, retain) LeakCreationInfoViewController *infoViewController;
@property (nonatomic, retain) UIImageView *backgroundImageView;

- (void)rotateBackground;

@end
