//
//  RootViewController.h
//  WaterApp
//
//  Created by Taylor Savage on 7/24/11.
//  Copyright 2011 Rototutor. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "Request.h"
#import "LeakManager.h"

@interface RootViewController : UIViewController {
    IBOutlet UIButton *reportLeakButton;
    LeakManager *leakManager;
    UIViewController *leakCreationController;
}

@property (nonatomic, retain) UIButton *reportLeakButton;
@property (nonatomic, retain) LeakManager *leakManager;
@property (nonatomic, retain) UIViewController *leakCreationController;

- (IBAction)doReportLeak:(UIButton *)sender; 


@end
