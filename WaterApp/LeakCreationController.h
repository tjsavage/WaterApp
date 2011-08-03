//
//  MapViewController.h
//  WaterApp
//
//  Created by Taylor Savage on 8/2/11.
//  Copyright 2011 Rototutor. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <MapKit/MapKit.h>
#import "LeakManager.h"
#import "PickerViewController.h"

@interface LeakCreationController : UIViewController <MKMapViewDelegate> {
    BOOL doneInitialZoom;
    IBOutlet MKMapView *mapView;
    
    LeakManager *leakManager;
    PickerViewController *leakTypePicker;
    PickerViewController *severityPicker;
}

@property (nonatomic, retain) IBOutlet MKMapView *mapView;
@property (nonatomic, assign) LeakManager *leakManager;
@property (nonatomic, assign) PickerViewController *severityPicker;
@property (nonatomic, assign) PickerViewController *leakTypePicker;

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil leakManager:(LeakManager *)manager;

- (void)didPickLeakType:(LeakType *)leakType;

@end
