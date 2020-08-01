//
//  Coordinator.m
//  Drinder-ios
//
//  Created by Pavel N on 8/1/20.
//  Copyright © 2020 Pavel N. All rights reserved.
//

#import "Coordinator.h"
@interface Coordinator ()
@property (nonatomic, strong) NSMutableArray<Coordinator*> *childCoordinators;
@end

@implementation Coordinator
- (instancetype)init
{
    self = [super init];
    if (self) {
        _childCoordinators = [NSMutableArray new];
    }
    return self;
}

- (void)addChild:(Coordinator *)childCoordinator {
    [childCoordinator addChild:childCoordinator];
}

@end
