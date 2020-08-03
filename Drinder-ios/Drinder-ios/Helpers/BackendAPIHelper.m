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

+ (void)registrationWith:(NSString *)name password:(NSString *)pass complition:(void (^)(NSData *, NSError *))handler {
    NSURLQueryItem *userLogin = [[NSURLQueryItem alloc] initWithName:@"login" value:name];
    NSURLQueryItem *userPassword = [[NSURLQueryItem alloc] initWithName:@"pass" value:pass];
    
    NSURLComponents *components = [[NSURLComponents alloc] initWithString:baseURL];
    components.path = @"/register";
    components.queryItems = @[userLogin,userPassword];
    NSURL *url = components.URL;
    NSMutableURLRequest *request = [[NSMutableURLRequest alloc] initWithURL:url];
    [request setHTTPMethod:@"POST"];
    
    NSURLSessionDataTask *task = [[NSURLSession sharedSession] dataTaskWithRequest:request completionHandler:^(NSData * _Nullable data, NSURLResponse * _Nullable response, NSError * _Nullable error) {
        if(error) {
            handler(nil, error);
            return;
        }
        handler(data, error);
    }];
    [task resume];
}

+ (void)postLocationWithUser:(UserInfoSession *)user complition:(void (^)(NSError *))handler {
    NSURLQueryItem *userId = [[NSURLQueryItem alloc] initWithName:@"id" value:user.userData.userID];
    NSURLQueryItem *userLat = [[NSURLQueryItem alloc] initWithName:@"lat" value:[NSString stringWithFormat:@"%f",[user.detailsInfo getLocation].latitude]];
    NSURLQueryItem *userLon = [[NSURLQueryItem alloc] initWithName:@"lon" value:[NSString stringWithFormat:@"%f",[user.detailsInfo getLocation].longitude]];
    
    NSURLComponents *components = [[NSURLComponents alloc] initWithString:baseURL];
    components.path = @"/location";
    components.queryItems = @[userId,userLat,userLon];
    NSURL *url = components.URL;
    NSMutableURLRequest *request = [[NSMutableURLRequest alloc] initWithURL:url];
    [request setHTTPMethod:@"POST"];
    
    NSURLSessionDataTask *task = [[NSURLSession sharedSession] dataTaskWithRequest:request completionHandler:^(NSData * _Nullable data, NSURLResponse * _Nullable response, NSError * _Nullable error) {
        if(error) {
            handler(error);
            return;
        }
        handler(nil);
    }];
    [task resume];
}

+ (void)findNearestWithUser:(UserInfoSession *)user complition:(void (^)(NSData *, NSError *))handler {
    NSURLQueryItem *userId = [[NSURLQueryItem alloc] initWithName:@"id" value:user.userData.userID];
    
    NSURLComponents *components = [[NSURLComponents alloc] initWithString:baseURL];
    components.path = @"/find";
    components.queryItems = @[userId];
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

+ (void)postDetailsWithUser:(UserInfoSession *)user complition:(void (^)(NSError *error))handler {
    NSURLQueryItem *userLogin = [[NSURLQueryItem alloc] initWithName:@"login" value:user.userData.login];
    NSURLQueryItem *userPassword = [[NSURLQueryItem alloc] initWithName:@"pass" value:user.password];
    NSURLQueryItem *alcohol = [[NSURLQueryItem alloc] initWithName:@"alcohol" value:user.detailsInfo.alcohol];
    NSURLQueryItem *gender = [[NSURLQueryItem alloc] initWithName:@"alcohol" value:user.detailsInfo.gender];
    NSURLQueryItem *userAge = [[NSURLQueryItem alloc] initWithName:@"age" value:[NSString stringWithFormat:@"%d",[user.detailsInfo.age intValue]]];
    NSURLComponents *components = [[NSURLComponents alloc] initWithString:baseURL];
    components.path = @"/detail";
    components.queryItems = @[userLogin, userPassword, alcohol, gender, userAge];
    NSURL *url = components.URL;
    NSMutableURLRequest *request = [[NSMutableURLRequest alloc] initWithURL:url];
    [request setHTTPMethod:@"POST"];
    
    NSURLSessionDataTask *task = [[NSURLSession sharedSession] dataTaskWithRequest:request completionHandler:^(NSData * _Nullable data, NSURLResponse * _Nullable response, NSError * _Nullable error) {
        if(error) {
            handler(error);
            return;
        }
        handler(nil);
    }];
    [task resume];
}

+ (void)getDetails:(NSString *)userID complition:(void (^)(NSData *, NSError *))handler {
    NSURLQueryItem *userId = [[NSURLQueryItem alloc] initWithName:@"id" value:userID];
    
    NSURLComponents *components = [[NSURLComponents alloc] initWithString:baseURL];
    components.path = @"/detail";
    components.queryItems = @[userId];
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
