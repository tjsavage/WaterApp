//
//  RootViewController.m
//  WaterApp
//
//  Created by Taylor Savage on 7/24/11.
//  Copyright 2011 Rototutor. All rights reserved.
//

#import "RootViewController.h"
#import "LeakCreationController.h"

@implementation RootViewController

@synthesize reportLeakButton = _reportLeakButton, leakManager = _leakManager, leakCreationController = _leakCreationController;

- (void)viewDidLoad
{
    [super viewDidLoad];
    Request *request = [[Request alloc] initWithUrl:@"dummy" parameters:nil];
    NSArray *leakTypes = [[request resultAsDict] objectForKey:@"leakTypes"];
    self.leakManager = [[LeakManager alloc] initWithLeakTypes:leakTypes];
    
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

- (IBAction)doReportLeak:(UIButton *)sender
{
    self.leakCreationController = [[LeakCreationController alloc] initWithNibName:@"LeakCreationView" bundle:[NSBundle mainBundle] leakManager:self.leakManager];
    
    [self.view addSubview:[self.leakCreationController view]];
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
