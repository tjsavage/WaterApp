//
//  MapViewController.m
//  WaterApp
//
//  Created by Taylor Savage on 8/2/11.
//  Copyright 2011 Rototutor. All rights reserved.
//

#define METERS_PER_MILE 1609.344

#import "LeakCreationController.h"
#import <MapKit/MKGeometry.h>
#import "LeakManager.h"

@interface LeakCreationController (Private) 
    - (void)setMapLocation:(CLLocation *)zoomLocation;
@end

@implementation LeakCreationController
@synthesize mapView = _mapView, leakManager = _leakManager;
@synthesize leakTypePicker = _leakTypePicker, severityPicker = _severityPicker;

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil leakManager:(LeakManager *)manager
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        self.leakManager = manager;
    }
    return self;
}

- (void)didReceiveMemoryWarning
{
    // Releases the view if it doesn't have a superview.
    [super didReceiveMemoryWarning];
    
    // Release any cached data, images, etc that aren't in use.
}

#pragma mark - Callbacks from Pickers
- (void)didPickLeakType:(LeakType *)leakType {
    self.leakManager.newLeak = [leakType leak];
    [self.leakTypePicker.view removeFromSuperview];
    
//    self.severityPicker
}

#pragma mark - View lifecycle

- (void)viewDidLoad
{
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
}

- (void)setMapLocation:(CLLocation *)location {
    CLLocationCoordinate2D zoomLocation = location.coordinate;
    MKCoordinateRegion viewRegion = MKCoordinateRegionMakeWithDistance(zoomLocation, 0.5*METERS_PER_MILE, 0.5*METERS_PER_MILE);
    
    MKCoordinateRegion adjustedRegion = [self.mapView regionThatFits:viewRegion];
    
    [self.mapView setRegion:adjustedRegion animated:YES];
}

- (void)viewWillAppear:(BOOL)animated {
    CLLocation *location = [[CLLocation alloc] initWithLatitude:37.4241667 longitude:0-122.165];
   
    [self setMapLocation:location];
    
    
}

- (void)mapView:(MKMapView *)mapView didUpdateUserLocation:(MKUserLocation *)userLocation {
    [self setMapLocation:userLocation.location];
    leakTypePicker = [[PickerViewController alloc] initWithNibName:@"PickerView" bundle:[NSBundle mainBundle] delegate:self callback:@selector(didPickLeakType:) dataSourceDict:self.leakManager.leakTypes];
    
    [self.view addSubview:leakTypePicker.view];
}

- (void)viewDidUnload
{
    [super viewDidUnload];
    // Release any retained subviews of the main view.
    // e.g. self.myOutlet = nil;
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
    // Return YES for supported orientations
    return (interfaceOrientation == UIInterfaceOrientationPortrait);
}

@end
