//
//  PickerViewController.m
//  WaterApp
//
//  Created by Taylor Savage on 8/2/11.
//  Copyright 2011 Rototutor. All rights reserved.
//

#import "PickerViewController.h"

@interface PickerViewController ()

-(void)initActionSheet;

@end

@implementation PickerViewController

@synthesize callback = _callback, delegate = _delegate, dataSource = _dataSource, pickerView = _pickerView, actionSheet = _actionSheet;
@synthesize parentView = _parentView;

- (id)initWithDelegate:(UIViewController *)owner callback:(SEL)selector parentView:(UIView *)view dataSource:(NSArray *)dataArray
{
    self = [super init];
    if (self) {
        self.delegate = owner;
        self.callback = selector;
        self.dataSource = dataArray;
        self.parentView = view;
        
        [self initActionSheet];
    }
    
    NSLog(@"=========> %@", self.dataSource);
    return self;
}

- (void)initActionSheet {
    self.actionSheet = [[UIActionSheet alloc] initWithTitle:nil delegate:nil cancelButtonTitle:nil destructiveButtonTitle:nil otherButtonTitles:nil];
    
    CGRect pickerFrame = CGRectMake(0, 40, 0, 0);
    self.pickerView = [[UIPickerView alloc] initWithFrame:pickerFrame];
    [self.actionSheet setActionSheetStyle:UIActionSheetStyleBlackTranslucent];
    
    UISegmentedControl *closeButton = [[UISegmentedControl alloc] initWithItems:[NSArray arrayWithObject:@"Close"]];
    closeButton.momentary = YES; 
    closeButton.frame = CGRectMake(260, 7.0f, 50.0f, 30.0f);
    closeButton.segmentedControlStyle = UISegmentedControlStyleBar;
    closeButton.tintColor = [UIColor blackColor];
    [closeButton addTarget:self action:@selector(dismiss) forControlEvents:UIControlEventValueChanged];
    [self.actionSheet addSubview:closeButton];
    [closeButton release];
    
    self.pickerView.showsSelectionIndicator = YES;
    self.pickerView.dataSource = self;
    self.pickerView.delegate = self;
    
    [self.actionSheet addSubview:self.pickerView];
    [self.pickerView release];
    
    
}

- (void)show {
    [self.actionSheet showInView:self.parentView];
    
    [self.actionSheet setBounds:CGRectMake(0, 0, 320, 485)];
}

- (void)dismiss {
    
    NSLog(@"DISMISS");
    id selected = [self.dataSource objectAtIndex:[self.pickerView selectedRowInComponent:0]];
    [self.actionSheet dismissWithClickedButtonIndex:0 animated:YES];
    [self.delegate performSelector:self.callback withObject:selected];
}

#pragma mark - ActionSheet delegate methods
- (void)actionSheet:(UIActionSheet *)actionSheet clickedButtonAtIndex:(NSInteger)buttonIndex
{
    [self dismiss];
}

#pragma mark - Data source methods
- (NSInteger)numberOfComponentsInPickerView:(UIPickerView *)pickerView {
    return 1;
}

- (NSString *)pickerView:(UIPickerView *)pickerView titleForRow:(NSInteger)row forComponent:(NSInteger)component {
    return [self.dataSource objectAtIndex:row];
}

- (NSInteger)pickerView:(UIPickerView *)pickerView numberOfRowsInComponent:(NSInteger)component {
    return [self.dataSource count];
}

#pragma mark - Delegate methods
- (void)pickerView:(UIPickerView *)pickerView didSelectRow:(NSInteger)row inComponent:(NSInteger)component {
    NSLog(@"SELECTED ROW: %d, changed to row: %d component: %d",[pickerView selectedRowInComponent:0], row, component);
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

- (void)dealloc {
    self.dataSource = nil;
    self.delegate = nil;
    self.dataSource = nil;
    [super dealloc];
}

@end
