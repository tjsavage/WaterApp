//
//  PickerViewController.h
//  WaterApp
//
//  Created by Taylor Savage on 8/2/11.
//  Copyright 2011 Rototutor. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface PickerViewController : UIViewController <UIPickerViewDelegate, UIPickerViewDataSource, UIActionSheetDelegate> {
    NSArray *dataSource;
    UIActionSheet *actionSheet;
    UIPickerView *pickerView;
    SEL callback;
    UIViewController *delegate;
    UIView *parentView;
}

@property (nonatomic, retain) NSArray *dataSource;
@property (nonatomic, assign) SEL callback;
@property (nonatomic, assign) UIViewController *delegate;
@property (nonatomic, assign) UIView *parentView;
@property (nonatomic, retain) UIPickerView *pickerView;
@property (nonatomic, retain) UIActionSheet *actionSheet;

- (id)initWithDelegate:(UIViewController *)owner callback:(SEL)selector parentView:(UIView *)view dataSource:(NSArray *)dataArray;
- (void)dismiss;
- (void)show;

@end
