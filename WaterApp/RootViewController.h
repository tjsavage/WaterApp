//
//  RootViewController.h
//  WaterApp
//
//  Created by Taylor Savage on 7/24/11.
//  Copyright 2011 Rototutor. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface RootViewController : UIViewController {
    IBOutlet UIButton *reportLeakButton;
}

@property (nonatomic, retain) UIButton *reportLeakButton;

- (IBAction)doReportLeak:(UIButton *)sender; 


@end
