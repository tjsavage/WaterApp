//
//  Request.h
//  WaterApp
//
//  Created by Taylor Savage on 8/2/11.
//  Copyright 2011 Rototutor. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Request : NSObject

-(id)initWithUrl:(NSString *)url parameters:(NSDictionary *)params;
-(NSDictionary *)resultAsDict;

@end
