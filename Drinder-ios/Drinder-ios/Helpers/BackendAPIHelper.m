//
//  BackendAPIHelper.m
//  rs.ios-stage2-task7
//
//  Created by Pavel N on 7/17/20.
//  Copyright © 2020 Pavel N. All rights reserved.
//

#import "BackendAPIHelper.h"
static NSString* baseURL = @"https://api.thecatapi.com";

@implementation BackendAPIHelper

- (instancetype)init
{
    [NSException raise:@"init" format:@"BackendAPIHelper only for statics method"];
    return nil;
}
@end
