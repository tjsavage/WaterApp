//
//  RootViewController.m
//  LeakApp
//
//  Created by Taylor Savage on 9/14/11.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import "RootViewController.h"
#import "LeakManager.h"
#import "Request.h"
#import "LoadingViewController.h"
#import "LeakCreationTableViewController.h"
#import "MapViewController.h"
#import "LeakCreationInfoViewController.h"
#import <QuartzCore/QuartzCore.h>
#import "ASIFormDataRequest.h"
#import "ASINetworkQueue.h"

#define POST_URL @"http://10.0.1.17:8080/waterapp/api/leak/report/"
#define GET_URL @"http://10.0.1.17:8080/waterapp/api/leak/list/"

@interface RootViewController ()

@property (nonatomic, assign) int backgroundImageNumber;

- (void)rotateBackground;

@end

@implementation RootViewController

@synthesize leakManager;
@synthesize tableViewController, mapViewController, infoViewController, loadingViewController;
@synthesize backgroundImageView;
@synthesize backgroundImageNumber;
@synthesize settingsRequest;

- (void)viewDidLoad
{
    [super viewDidLoad];
    self.settingsRequest = [[Request alloc] initWithUrl:GET_URL parameters:nil delegate:self];
    self.navigationController.delegate = self;
    self.backgroundImageNumber = 0;
    self.backgroundImageView = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"Backgound0"]];
    [self rotateBackground];
    
    self.loadingViewController = [[LoadingViewController alloc] initWithNibName:@"LoadingViewController" bundle:[NSBundle mainBundle] delegate:self];
    [self.navigationController pushViewController:self.loadingViewController animated:NO];
}

- (void)rotateBackground {
    [UIView beginAnimations:@"fade" context:nil];
    [UIView setAnimationDuration:1];
    [self.navigationController.view setBackgroundColor: [UIColor colorWithPatternImage:[UIImage imageNamed:[NSString stringWithFormat:@"Background%d", self.backgroundImageNumber]]]];
    [UIView commitAnimations];
    
    self.backgroundImageNumber++;
    if (self.backgroundImageNumber > 5) {
        self.backgroundImageNumber = 0;
    }
}

- (void)requestDidFinish:(Request *)request {
    self.leakManager = [[LeakManager alloc] initWithLeakTypes:[request.resultAsDict objectForKey:@"leakTypes"]];
    [self.loadingViewController makeReady];
}

- (void)reportLeak {
    self.tableViewController = [[LeakCreationTableViewController alloc] initWithDelegate:self action:@selector(didSelectLeakType:)];
    self.tableViewController.tableOptions = [self.leakManager.leakTypes allKeys];
    self.tableViewController.title = @"Report a Leak";
    
    [self.navigationController pushViewController:self.tableViewController animated:YES];
}


#pragma mark LeakCreationDelegate
- (void)didSelectLeakType:(NSString *)leakType {
    self.leakManager.newLeak.leakType = [self.leakManager.leakTypes objectForKey:leakType];
    
    self.tableViewController = [[LeakCreationTableViewController alloc] initWithDelegate:self action:@selector(didSelectLeakSeverity:)];
    self.tableViewController.tableOptions = self.leakManager.newLeak.leakType.severities;
    self.tableViewController.title = @"Leak Severity";
    
    [self.navigationController pushViewController:self.tableViewController animated:YES];
    [self rotateBackground];
}

- (void)didSelectLeakSeverity:(NSString *)leakSeverity {
    self.leakManager.newLeak.severity = [self.leakManager.newLeak.leakType.severities indexOfObject:leakSeverity];
    
    self.mapViewController = [[MapViewController alloc] initWithNibName:@"MapViewController" bundle:[NSBundle mainBundle]];
    self.mapViewController.title = @"Leak Location";
    
    self.mapViewController.delegate = self;
    [self.navigationController pushViewController:self.mapViewController animated:YES];
}

- (void)didSetLeakLocation:(CLLocationCoordinate2D)coordinate {
    self.leakManager.newLeak.location = coordinate;
    
    self.infoViewController = [[LeakCreationInfoViewController alloc] initWithNibName:@"LeakCreationInfoViewController" bundle:[NSBundle mainBundle]];
    self.infoViewController.delegate = self;
    self.infoViewController.title = @"More Info";
    
    [self.navigationController pushViewController:self.infoViewController animated:YES];
}

- (void)didSetDetails:(NSString *)details {
    self.leakManager.newLeak.comments = details;
}

- (void)didSetID:(NSString *)sunetID {
    self.leakManager.newLeak.sunetID = sunetID;
    
}

- (void)didSetPhoto:(UIImage *)image {
    self.leakManager.newLeak.image = image;
}

- (void) postRequestDidFinish {
    NSLog(@"=======> Posted Request");
}

- (void)submitLeak {
    NSLog(@"=======> submitting leak: %@", self.leakManager.newLeak);
    
    ASINetworkQueue *networkQueue = [[ASINetworkQueue alloc] init];
    [networkQueue setQueueDidFinishSelector:@selector(postRequestDidFinish)];
    [networkQueue setDelegate:self];
    
    NSURL *url = [NSURL URLWithString:POST_URL];
    ASIFormDataRequest *request = [[[ASIFormDataRequest alloc] initWithURL:url] autorelease];
    
    NSData *imageData = UIImagePNGRepresentation(self.leakManager.newLeak.image);
    
    [request setPostValue:self.leakManager.newLeak.leakType.description forKey:@"leakType"];
    [request setPostValue:[self.leakManager.newLeak.leakType.severities objectAtIndex:leakManager.newLeak.severity] forKey:@"severity"];
    [request setPostValue:[NSString stringWithFormat:@"%d", self.leakManager.newLeak.location.latitude] forKey:@"latitude"];
    [request setPostValue:[NSString stringWithFormat:@"%d", self.leakManager.newLeak.location.longitude] forKey:@"longitude"];
    [request setPostValue:self.leakManager.newLeak.comments forKey:@"comments"];
    [request setPostValue:self.leakManager.newLeak.sunetID forKey:@"sunetID"];
    if(imageData != nil){
        [request setPostValue:@"image" forKey:@"image"];
        [request setData:imageData forKey:@"file"];
    }
    [networkQueue addOperation:request];
    
    [networkQueue go];
}


- (void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
}

- (void)viewDidAppear:(BOOL)animated
{
    [super viewDidAppear:animated];
}

- (void)viewWillDisappear:(BOOL)animated
{
	[super viewWillDisappear:animated];
}

- (void)viewDidDisappear:(BOOL)animated
{
	[super viewDidDisappear:animated];
}

- (void)didReceiveMemoryWarning
{
    // Releases the view if it doesn't have a superview.
    [super didReceiveMemoryWarning];
    
    // Relinquish ownership any cached data, images, etc that aren't in use.
}

- (void)viewDidUnload
{
    [super viewDidUnload];

    // Relinquish ownership of anything that can be recreated in viewDidLoad or on demand.
    // For example: self.myOutlet = nil;
}

- (void)dealloc
{
    [super dealloc];
}

@end
