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

@interface LeakCreationController (Private) 
    - (void)setMapLocation:(CLLocation *)zoomLocation;
@end

@implementation LeakCreationController
@synthesize mapView = _mapView, newLeak = _newLeak;

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)didReceiveMemoryWarning
{
    // Releases the view if it doesn't have a superview.
    [super didReceiveMemoryWarning];
    
    // Release any cached data, images, etc that aren't in use.
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
