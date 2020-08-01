//
//  MainAssembly.h
//  Drinder-ios
//
//  Created by Pavel N on 8/1/20.
//  Copyright © 2020 Pavel N. All rights reserved.
//

#import "Assembly.h"
#import "MainTabCoordinator.h"
#import "MoreViewController.h"
#import "UserInfoSession.h"

NS_ASSUME_NONNULL_BEGIN

@interface MainAssembly : Assembly
- (MainTabCoordinator *)makeMainCoordinatorWithUserInfoSession:(UserInfoSession *)session coordinator:(Coordinator*)parent;
@end

NS_ASSUME_NONNULL_END
