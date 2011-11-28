//
//  Request.m
//  WaterApp
//
//  Created by Taylor Savage on 8/2/11.
//  Copyright 2011 Rototutor. All rights reserved.
//

#import "Request.h"
#import "SBJson.h"

@implementation Request

@synthesize urlRequest = _urlRequest, urlConnection = _urlConnection, data = _data;
@synthesize delegate = _delegate;

- (id)init
{
    self = [super init];
    if (self) {
        // Initialization code here.
    }
    
    return self;
}

-(id)initWithUrl:(NSString *)url parameters:(NSDictionary *)params delegate:(id)del {
    self = [super init];
    self.urlRequest = [NSURLRequest requestWithURL:[NSURL URLWithString:url]];
    self.urlConnection = [[NSURLConnection alloc] initWithRequest:self.urlRequest delegate:self startImmediately:YES];
    self.data = [[NSMutableData data] retain];
    self.delegate = del;
    return [self autorelease];
}

- (void)connection:(NSURLConnection *)connection didReceiveResponse:(NSURLResponse *)response {
    [self.data setLength:0];
}

- (void)connection:(NSURLConnection *)connection didReceiveData:(NSData *)data {
    [self.data appendData:data];
}

- (void)connectionDidFinishLoading:(NSURLConnection *)connection {
    [self.delegate performSelector:@selector(requestDidFinish:) withObject:self];
}

- (NSDictionary *)resultAsDict {
    SBJsonParser *parser = [[SBJsonParser alloc] init];
    NSDictionary *parsedData = [parser objectWithData:self.data];
    NSLog(@"-=====> data: %@", parsedData);
    
    NSMutableArray *leakTypes = [[NSMutableArray alloc] initWithArray:[parsedData objectForKey:@"leaks"]];
    NSMutableDictionary *emergencyContact = [[NSMutableDictionary alloc] initWithDictionary:[parsedData objectForKey:@"emergency_contact"]];

   
    return [NSMutableDictionary dictionaryWithObjectsAndKeys:
             leakTypes, @"leakTypes", emergencyContact, @"emergency_contact", nil];
}

@end
