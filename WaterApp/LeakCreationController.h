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
    IBOutlet UIButton *leakTypeButton;
    IBOutlet UIButton *leakSeverityButton;
    IBOutlet UILabel *leakTypeLabel;
    IBOutlet UILabel *leakSeverityButtonLabel;
    IBOutlet UILabel *leakSeverityLabel;
    
    LeakManager *leakManager;
    PickerViewController *leakTypePicker;
    PickerViewController *severityPicker;
}

@property (nonatomic, retain) IBOutlet MKMapView *mapView;
@property (nonatomic, assign) LeakManager *leakManager;
@property (nonatomic, assign) PickerViewController *severityPicker;
@property (nonatomic, assign) PickerViewController *leakTypePicker;
@property (nonatomic, retain) IBOutlet UIButton *leakTypeButton;
@property (nonatomic, retain) IBOutlet UIButton *leakSeverityButton;
@property (nonatomic, retain) IBOutlet UILabel *leakSeverityLabel;
@property (nonatomic, retain) IBOutlet UILabel *leakSeverityButtonLabel;
@property (nonatomic, retain) IBOutlet UILabel *leakTypeLabel;


- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil leakManager:(LeakManager *)manager;

- (void)didPickLeakType:(NSString *)leakType;
- (void)didPickSeverity:(NSString *)severity;

- (IBAction)willChooseLeakType:(id)sender;
- (IBAction)willChooseLeakSeverity:(id)sender;

@end
