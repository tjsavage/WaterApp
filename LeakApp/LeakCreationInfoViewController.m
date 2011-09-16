//
//  LeakCreationInfoViewController.m
//  LeakApp
//
//  Created by Taylor Savage on 9/15/11.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import "LeakCreationInfoViewController.h"

@implementation LeakCreationInfoViewController

@synthesize delegate = _delegate;
@synthesize infoTextField = _infoTextField, sunetIdField = _sunetIdField;

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

- (IBAction)didTapTakePhoto {

}

- (IBAction)submit {
    [self.delegate didSetDetails:self.infoTextField.text];
    [self.delegate didSetID:self.sunetIdField.text];
    [self.delegate submitLeak];
}

- (BOOL)textFieldShouldReturn:(UITextField *)textField {
    [textField resignFirstResponder];
    return YES;
}


#pragma mark - View lifecycle

- (void)viewDidLoad
{
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
}

- (void)viewDidUnload
{
    [super viewDidUnload];
    // Release any retained subviews of the main view.
    // e.g. self.myOutlet = nil;
}

-(void) viewWillDisappear:(BOOL)animated {
    if ([self.navigationController.viewControllers indexOfObject:self]==NSNotFound) {
        [self.delegate performSelector:@selector(rotateBackground)];
    }
    [super viewWillDisappear:animated];
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
    // Return YES for supported orientations
    return (interfaceOrientation == UIInterfaceOrientationPortrait);
}

@end
