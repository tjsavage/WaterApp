//
//  LoadingViewController.m
//  LeakApp
//
//  Created by Taylor Savage on 10/17/11.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import "LoadingViewController.h"
#import <QuartzCore/QuartzCore.h>


@implementation LoadingViewController

@synthesize spinner, delegate, button;

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil delegate:(id)del
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        self.delegate = del;
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
    [self.spinner startAnimating];
    self.spinner.hidesWhenStopped = YES;
    
    UIView *backView = [[[UIView alloc] initWithFrame:CGRectZero] autorelease];
    backView.backgroundColor = [UIColor colorWithRed:.33 green:.33 blue:.33 alpha:.44];
    backView.layer.cornerRadius = 6;
    backView.layer.borderColor = [[UIColor blackColor] CGColor];
    backView.layer.borderWidth = .5;
    [self.button addSubview:backView];
}

- (void)viewDidUnload
{
    [super viewDidUnload];
    // Release any retained subviews of the main view.
    // e.g. self.myOutlet = nil;
}

- (void)makeReady {
    [self.spinner stopAnimating];
    [self.spinner removeFromSuperview];
    self.view.alpha = 1;
    self.button.hidden = NO;
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
    // Return YES for supported orientations
    return (interfaceOrientation == UIInterfaceOrientationPortrait);
}

- (IBAction)didTapButton:(id)sender {
    [self.delegate performSelector:@selector(reportLeak)];
}

@end
