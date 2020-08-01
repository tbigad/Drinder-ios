//
//  TabCoordinator.m
//  Drinder-ios
//
//  Created by Pavel N on 8/1/20.
//  Copyright © 2020 Pavel N. All rights reserved.
//

#import "TabCoordinator.h"
@interface TabCoordinator()
@property (nonatomic, strong)UITabBarController *tabBar;
@property (nonatomic, strong)NSMutableArray<Coordinator*> *tabbedCoordinators;
@end


@implementation TabCoordinator
- (instancetype)initWithParent:(Coordinator *)parent
{
    self = [super initWithParent:parent];
    if (self) {
        _tabbedCoordinators = [NSMutableArray new];
        _tabBar = [UITabBarController new];
        self.baseViewController = _tabBar;
        [self setupTabs];
    }
    return self;
}

- (void) setupTabs {}

- (void) addTabbedCoordinator:(Coordinator*) coordinator{
    [self addChildCoordinator:coordinator];
    [self.tabbedCoordinators addObject:coordinator];
    [self.tabBar addChildViewController:coordinator.baseViewController];
}
@end
