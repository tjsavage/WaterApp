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
@synthesize pickerController = _pickerController, image = _image, submittingActivityIndicator = _submittingActivityIndicator;

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        self.submittingActivityIndicator.hidden = YES;
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
    self.pickerController = [[UIImagePickerController alloc] init];
    self.pickerController.delegate = self;
    self.pickerController.sourceType = UIImagePickerControllerSourceTypePhotoLibrary;
    
    [self presentModalViewController:self.pickerController animated:YES];
}

- (void)imagePickerController:(UIImagePickerController *)picker
        didFinishPickingImage:(UIImage *)image
                  editingInfo:(NSDictionary *)editingInfo {
    [picker dismissModalViewControllerAnimated:YES];
    self.image = image;
    self.pickerController.view.hidden = YES;
}

- (void)imagePickerControllerDidCancel:(UIImagePickerController *)picker {
    [picker dismissModalViewControllerAnimated:YES];
}

- (IBAction)submit {
    self.submittingActivityIndicator.hidden = NO;
    [self.submittingActivityIndicator startAnimating]; 
    [self.delegate didSetDetails:self.infoTextField.text];
    [self.delegate didSetID:self.sunetIdField.text];
    [self.delegate didSetPhoto:self.image];
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
    self.submittingActivityIndicator.hidden = YES;
    [super viewWillDisappear:animated];
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
    // Return YES for supported orientations
    return (interfaceOrientation == UIInterfaceOrientationPortrait);
}

@end
