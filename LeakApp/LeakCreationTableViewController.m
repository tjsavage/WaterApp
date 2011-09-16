//
//  LeakCreationTableViewController.m
//  LeakApp
//
//  Created by Taylor Savage on 9/14/11.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import "LeakCreationTableViewController.h"
#import <QuartzCore/QuartzCore.h>

@interface LeakCreationTableViewController ()

@property (nonatomic, assign) id<LeakCreationDelegate> delegate;
@property (nonatomic, assign) SEL action;

@end

@implementation LeakCreationTableViewController


@synthesize tableOptions;
@synthesize delegate, action;

- (id)initWithDelegate:(id<LeakCreationDelegate>)target action:(SEL)selector {
    self = [super initWithNibName:@"LeakCreationTableView" bundle:[NSBundle mainBundle]];
    if (self) {
        self.delegate = target;
        self.action = selector;
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

    // Uncomment the following line to preserve selection between presentations.
    // self.clearsSelectionOnViewWillAppear = NO;
 
    // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
    // self.navigationItem.rightBarButtonItem = self.editButtonItem;
}

- (void)viewDidUnload
{
    [super viewDidUnload];
    // Release any retained subviews of the main view.
    // e.g. self.myOutlet = nil;
}

- (void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
}

- (void)viewDidAppear:(BOOL)animated
{
    [super viewDidAppear:animated];
}

-(void) viewWillDisappear:(BOOL)animated {
    if ([self.navigationController.viewControllers indexOfObject:self]==NSNotFound) {
        [self.delegate performSelector:@selector(rotateBackground)];
    }
    [super viewWillDisappear:animated];
}

- (void)viewDidDisappear:(BOOL)animated
{
    [super viewDidDisappear:animated];
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
    // Return YES for supported orientations
    return (interfaceOrientation == UIInterfaceOrientationPortrait);
}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return self.tableOptions.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *CellIdentifier = @"Cell";
    
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier];
    if (cell == nil) {
        cell = [[[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:CellIdentifier] autorelease];
    }
    
    cell.textLabel.text = [self.tableOptions objectAtIndex:[indexPath row]];
    cell.textLabel.backgroundColor = [UIColor colorWithRed:0 green:0 blue:0 alpha:0];
    cell.textLabel.textColor = [UIColor whiteColor];
    UIView *backView = [[[UIView alloc] initWithFrame:CGRectZero] autorelease];
    backView.backgroundColor = [UIColor colorWithRed:.33 green:.33 blue:.33 alpha:.44];
    backView.layer.cornerRadius = 6;
    backView.layer.borderColor = [[UIColor blackColor] CGColor];
    backView.layer.borderWidth = .5;
    cell.backgroundView = backView;
    
    UIView *selectedView = [[[UIView alloc] initWithFrame:CGRectZero] autorelease];
    selectedView.backgroundColor = [UIColor grayColor];
    selectedView.layer.cornerRadius = 6;
    
    cell.selectedBackgroundView = selectedView;
    
    return cell;
}
#pragma mark - Table view delegate

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    [self.delegate performSelector:self.action withObject:[self.tableOptions objectAtIndex:indexPath.row]];
}

@end
