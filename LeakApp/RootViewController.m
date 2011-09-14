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
#import "LeakCreationTableViewController.h"

@implementation RootViewController

@synthesize leakManager;
@synthesize tableViewController;

- (void)viewDidLoad
{
    [super viewDidLoad];
    Request *request = [[Request alloc] initWithUrl:nil parameters:nil];
    self.leakManager = [[LeakManager alloc] initWithLeakTypes:[request.resultAsDict objectForKey:@"leakTypes"]];
    
    self.tableViewController = [[LeakCreationTableViewController alloc] initWithDelegate:self action:@selector(didSelectLeakType:)];
    self.tableViewController.tableOptions = [self.leakManager.leakTypes allKeys];
    [self.navigationController pushViewController:self.tableViewController animated:NO];
}

#pragma mark LeakCreationDelegate
- (void)didSelectLeakType:(NSString *)leakType {
    self.leakManager.newLeak.leakType = [self.leakManager.leakTypes objectForKey:leakType];
    
    self.tableViewController = [[LeakCreationTableViewController alloc] initWithDelegate:self action:@selector(didSelectLeakSeverity:)];
    self.tableViewController.tableOptions = self.leakManager.newLeak.leakType.severities;
    
    [self.navigationController pushViewController:self.tableViewController animated:YES];
}

- (void)didSelectLeakSeverity:(NSString *)leakSeverity {
    self.leakManager.newLeak.severity = [self.leakManager.newLeak.leakType.severities indexOfObject:leakSeverity];
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
