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
    - (void)enableSeverity;
@end

@implementation LeakCreationController
@synthesize mapView = _mapView, leakManager = _leakManager;
@synthesize leakTypePicker = _leakTypePicker, severityPicker = _severityPicker;
@synthesize leakTypeButton = _leakTypeButton, leakSeverityButton = _leakSeverityButton;
@synthesize leakSeverityLabel = _leakSeverityLabel, leakTypeLabel = _leakTypeLabel, leakSeverityButtonLabel = _leakSeverityButtonLabel;


- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil leakManager:(LeakManager *)manager
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        self.leakManager = manager;
       
        self.leakSeverityButton.enabled = NO;
    }
    return self;
}

- (void)didReceiveMemoryWarning
{
    // Releases the view if it doesn't have a superview.
    [super didReceiveMemoryWarning];
    
    // Release any cached data, images, etc that aren't in use.
}

#pragma mark - Button actions
- (IBAction)willChooseLeakType:(id)sender {
     self.leakTypePicker = [[PickerViewController alloc] initWithDelegate:self callback:@selector(didPickLeakType:) parentView:self.view dataSource:[self.leakManager.leakTypes allKeys]];
    [self.leakTypePicker show];
}

- (IBAction)willChooseLeakSeverity:(id)sender {
    [self.severityPicker show];
}

#pragma mark - Callbacks from Pickers
- (void)didPickLeakType:(NSString *)leakTypeDescription {
    
    self.leakManager.newLeak = [[self.leakManager.leakTypes objectForKey:leakTypeDescription] leak];
    [self.leakTypePicker.view removeFromSuperview];
    
    self.leakTypeButton.titleLabel.text = self.leakManager.newLeak.leakType.description;
    
    [self enableSeverity];
    
}

- (void)didPickSeverity:(NSString *)severity {
    
}

#pragma mark - helper private methods
- (void)enableSeverity {
    self.leakSeverityLabel.enabled = YES;
    self.leakSeverityButton.enabled = YES;
    
     self.severityPicker = [[PickerViewController alloc] initWithDelegate:self callback:@selector(didPickSeverity:) parentView:self.view dataSource:nil];
    self.severityPicker.dataSource = self.leakManager.newLeak.leakType.severities;

    
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
