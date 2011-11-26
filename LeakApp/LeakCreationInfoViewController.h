//
//  LeakCreationInfoViewController.h
//  LeakApp
//
//  Created by Taylor Savage on 9/15/11.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "LeakCreationDelegate.h"

@interface LeakCreationInfoViewController : UIViewController <UINavigationControllerDelegate, UIImagePickerControllerDelegate>

@property (nonatomic, assign) id<LeakCreationDelegate> delegate;
@property (nonatomic, retain) IBOutlet UITextField *sunetIdField;
@property (nonatomic, retain) IBOutlet UITextField *infoTextField;
@property (nonatomic, retain) UIImagePickerController *pickerController;
@property (nonatomic, retain) UIImage *image;

- (IBAction)didTapTakePhoto;
- (void)imagePickerController:(UIImagePickerController *)picker
        didFinishPickingImage:(UIImage *)image
                  editingInfo:(NSDictionary *)editingInfo;
- (void)imagePickerControllerDidCancel:(UIImagePickerController *)picker;
- (IBAction)submit;

@end
