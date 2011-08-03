//
//  PickerViewController.h
//  WaterApp
//
//  Created by Taylor Savage on 8/2/11.
//  Copyright 2011 Rototutor. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface PickerViewController : UIViewController <UIPickerViewDelegate, UIPickerViewDataSource> {
    NSDictionary *dataSource;
    IBOutlet UIPickerView *pickerView;
    SEL callback;
    UIViewController *delegate;
}

@property (nonatomic, assign) NSDictionary *dataSource;
@property (nonatomic, assign) SEL callback;
@property (nonatomic, assign) UIViewController *delegate;
@property (nonatomic, retain) IBOutlet UIPickerView *pickerView;

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil delegate:(UIViewController *)owner callback:(SEL)selector dataSourceDict:(NSDictionary *)dataArray;

@end
