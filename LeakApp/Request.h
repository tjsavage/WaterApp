//
//  Request.h
//  WaterApp
//
//  Created by Taylor Savage on 8/2/11.
//  Copyright 2011 Rototutor. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Request : NSObject

@property (nonatomic, retain) NSURLRequest *urlRequest;
@property (nonatomic, retain) NSURLConnection *urlConnection;
@property (nonatomic, retain) NSMutableData *data;
@property (nonatomic, retain) id delegate;

-(id)initWithUrl:(NSString *)url parameters:(NSDictionary *)params delegate:(id)del;
-(NSDictionary *)resultAsDict;

@end
