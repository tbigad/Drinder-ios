//
//  Coordinator.m
//  Drinder-ios
//
//  Created by Pavel N on 8/1/20.
//  Copyright © 2020 Pavel N. All rights reserved.
//

#import "Coordinator.h"
@interface Coordinator ()
@property (nonatomic, strong, nullable)Coordinator *childCoordinators;
@end

@implementation Coordinator
- (instancetype)init
{
    self = [super init];
    if (self) {
    }
    return self;
}

- (void)addChild:(Coordinator *)childCoordinator {
    [self setChildCoordinators:childCoordinator];
}

@end
