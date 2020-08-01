//
//  MainAssembly.m
//  Drinder-ios
//
//  Created by Pavel N on 8/1/20.
//  Copyright © 2020 Pavel N. All rights reserved.
//

#import "MainAssembly.h"

@implementation MainAssembly
- (MainTabCoordinator *)makeMainCoordinatorWithUserInfoSession:(UserInfoSession *)session coordinator:(Coordinator*)parent {
    return [[MainTabCoordinator alloc] initWithParent:parent];
}
@end
