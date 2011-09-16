//
//  LeakCreationInfoViewController.h
//  LeakApp
//
//  Created by Taylor Savage on 9/15/11.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "LeakCreationDelegate.h"

@interface LeakCreationInfoViewController : UIViewController

@property (nonatomic, assign) id<LeakCreationDelegate> delegate;
@property (nonatomic, retain) IBOutlet UITextField *sunetIdField;
@property (nonatomic, retain) IBOutlet UITextField *infoTextField;

- (IBAction)didTapTakePhoto;
- (IBAction)submit;

@end
