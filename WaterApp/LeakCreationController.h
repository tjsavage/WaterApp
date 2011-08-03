//
//  MapViewController.h
//  WaterApp
//
//  Created by Taylor Savage on 8/2/11.
//  Copyright 2011 Rototutor. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <MapKit/MapKit.h>
#import "Leak.h"

@interface LeakCreationController : UIViewController <MKMapViewDelegate> {
    BOOL doneInitialZoom;
    IBOutlet MKMapView *mapView;
    Leak *newLeak;
}

@property (nonatomic, retain) IBOutlet MKMapView *mapView;
@property (nonatomic, assign) Leak *newLeak;

@end
