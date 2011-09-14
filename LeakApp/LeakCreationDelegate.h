//
//  LeakCreationDelegate.h
//  LeakApp
//
//  Created by Taylor Savage on 9/14/11.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>

@protocol LeakCreationDelegate <NSObject>

- (void)didSelectLeakType:(NSString *)leakType;
- (void)didSelectLeakSeverity:(NSString *)leakSeverity;

@end
