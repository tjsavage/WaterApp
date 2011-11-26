//
//  LoadingViewController.h
//  LeakApp
//
//  Created by Taylor Savage on 10/17/11.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface LoadingViewController : UIViewController

@property (nonatomic, retain) IBOutlet UIActivityIndicatorView *spinner;
@property (nonatomic, retain) id delegate;
@property (nonatomic, retain) IBOutlet UIButton *button;

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil delegate:(id)del;
- (IBAction)didTapButton:(id)sender;
- (void)makeReady;

@end
