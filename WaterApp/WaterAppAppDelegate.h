//
//  WaterAppAppDelegate.h
//  WaterApp
//
//  Created by Taylor Savage on 7/24/11.
//  Copyright 2011 Rototutor. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface WaterAppAppDelegate : NSObject <UIApplicationDelegate> {
    UIViewController *rootViewController;
}

@property (nonatomic, retain) IBOutlet UIWindow *window;
@property (nonatomic, retain) UIViewController *rootViewController;
@property (nonatomic, retain) IBOutlet UINavigationController *navigationController;

@end
