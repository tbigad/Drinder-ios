//
//  BaseBackendOperations.m
//  rs.ios-stage2-task7
//
//  Created by Pavel N on 7/18/20.
//  Copyright © 2020 Pavel N. All rights reserved.
//

#import "BaseBackendOperations.h"

@implementation BaseBackendOperations

- (instancetype)init
{
    self = [super init];
    if (self) {
    }
    return self;
}

- (void)fail {
    [self finish];
}

- (void)succes {
    [self finish];
}

@end
