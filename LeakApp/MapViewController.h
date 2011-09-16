//
//  MapViewController.h
//  LeakApp
//
//  Created by Taylor Savage on 9/15/11.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <MapKit/MapKit.h>
#import "LeakCreationDelegate.h"

@interface MapViewController : UIViewController<MKMapViewDelegate>

@property (nonatomic, retain) IBOutlet MKMapView *mapView;
@property (nonatomic, retain) IBOutlet UIButton *setLocationButton;
@property (nonatomic, assign) id<LeakCreationDelegate> delegate;

- (IBAction)didTapSetLocation;

@end
