//
//  BackendAPIHelper.m
//  rs.ios-stage2-task7
//
//  Created by Pavel N on 7/17/20.
//  Copyright © 2020 Pavel N. All rights reserved.
//

#import "BackendAPIHelper.h"
static NSString* baseURL = @"https://hackaton-web-server.herokuapp.com";

@implementation BackendAPIHelper

- (instancetype)init
{
    [NSException raise:@"init" format:@"BackendAPIHelper only for class method"];
    return nil;
}

+ (void)loginWith:(NSString *)name password:(NSString *)pass complition:(void (^)(NSData * , NSError * ))handler {
    NSURLQueryItem *userLogin = [[NSURLQueryItem alloc] initWithName:@"login" value:name];
    NSURLQueryItem *userPassword = [[NSURLQueryItem alloc] initWithName:@"pass" value:pass];
    
    NSURLComponents *components = [[NSURLComponents alloc] initWithString:baseURL];
    components.path = @"/login";
    components.queryItems = @[userLogin,userPassword];
    NSURL *url = components.URL;
    
    NSURLSessionDataTask *task = [[NSURLSession sharedSession] dataTaskWithURL:url completionHandler:^(NSData * _Nullable data, NSURLResponse * _Nullable response, NSError * _Nullable error) {
        if(error) {
            handler(nil, error);
            return;
        }
        handler(data, error);
    }];
    [task resume];
}

@end
