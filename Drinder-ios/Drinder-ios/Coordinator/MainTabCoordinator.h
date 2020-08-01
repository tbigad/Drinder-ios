//
//  MainTabCoordinator.h
//  Drinder-ios
//
//  Created by Pavel N on 8/1/20.
//  Copyright © 2020 Pavel N. All rights reserved.
//

#import "TabCoordinator.h"
#import "UserInfoSession.h"

NS_ASSUME_NONNULL_BEGIN

@interface MainTabCoordinator : TabCoordinator
@property (nonatomic, copy, nullable) void (^logoutBlock)(void);
- (instancetype)initWithUserSession:(UserInfoSession*)userInfo andParent:(Coordinator*)parent;
@end

NS_ASSUME_NONNULL_END
