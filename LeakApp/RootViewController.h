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

@class LeakManager, LeakCreationTableViewController, MapViewController, LeakCreationInfoViewController, LoadingViewController, Request;

@interface RootViewController : UIViewController <LeakCreationDelegate, UINavigationControllerDelegate, UIAlertViewDelegate>

@property (nonatomic, retain) LeakManager *leakManager;
@property (nonatomic, retain) LoadingViewController *loadingViewController;
@property (nonatomic, retain) LeakCreationTableViewController *tableViewController;
@property (nonatomic, retain) MapViewController *mapViewController;
@property (nonatomic, retain) LeakCreationInfoViewController *infoViewController;
@property (nonatomic, retain) UIImageView *backgroundImageView;

@property (nonatomic, retain) Request *settingsRequest;

- (void)rotateBackground;
- (void)reportLeak;

@end
