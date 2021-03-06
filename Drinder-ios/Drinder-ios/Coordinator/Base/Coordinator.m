//
//  Coordinator.m
//  Drinder-ios
//
//  Created by Pavel N on 8/1/20.
//  Copyright © 2020 Pavel N. All rights reserved.
//

#import "Coordinator.h"
@interface Coordinator ()
@property (nonatomic, strong, nullable)NSMutableArray<Coordinator *> *childCoordinators;
@property (nonatomic, weak, nullable)Coordinator *parentCoordinators;
@end

@implementation Coordinator

- (instancetype)init
{
    self = [super init];
    if (self) {
        _childCoordinators = [NSMutableArray new];
        _parentCoordinators = nil;
    }
    return self;
}

- (instancetype)initWithParent:(Coordinator*)parent
{
    self = [super init];
    if (self) {
        [parent addChildCoordinator:self];
        [self setParentCoordinators:parent]; 
    }
    return self;
}

- (void)addChildCoordinator:(Coordinator *)childCoordinator {
    [self.childCoordinators addObject:childCoordinator];
}

@end
