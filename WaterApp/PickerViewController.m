//
//  PickerViewController.m
//  WaterApp
//
//  Created by Taylor Savage on 8/2/11.
//  Copyright 2011 Rototutor. All rights reserved.
//

#import "PickerViewController.h"

@implementation PickerViewController

@synthesize callback = _callback, delegate = _delegate, dataSource = _dataSource, pickerView = _pickerView;

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil delegate:(UIViewController *)owner callback:(SEL)selector dataSourceDict:(NSDictionary *)data
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        self.delegate = owner;
        self.callback = selector;
        self.dataSource = data;
    }
    
    NSLog(@"=========> %@", self.dataSource);
    return self;
}

#pragma mark - Data source methods
- (NSInteger)numberOfComponentsInPickerView:(UIPickerView *)pickerView {
    return 1;
}

- (NSString *)pickerView:(UIPickerView *)pickerView titleForRow:(NSInteger)row forComponent:(NSInteger)component {
    return [[[self.dataSource allKeys] sortedArrayUsingSelector:@selector(compare:)]objectAtIndex:row];
}

- (NSInteger)pickerView:(UIPickerView *)pickerView numberOfRowsInComponent:(NSInteger)component {
    return [self.dataSource count];
}

#pragma mark - Delegate methods
- (void)pickerView:(UIPickerView *)pickerView didSelectRow:(NSInteger)row inComponent:(NSInteger)component {
    id key = [[[self.dataSource allKeys] sortedArrayUsingSelector:@selector(compare:)]objectAtIndex:row];
    [self.delegate performSelector:self.callback withObject:[self.dataSource objectForKey:key]];
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
