//
//  LeakCreationTableViewController.h
//  LeakApp
//
//  Created by Taylor Savage on 9/14/11.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "LeakCreationDelegate.h"

@interface LeakCreationTableViewController : UITableViewController

@property (nonatomic, retain) NSArray *tableOptions;

- (id)initWithDelegate:(id<LeakCreationDelegate>)delegate action:(SEL)selector;

@end
