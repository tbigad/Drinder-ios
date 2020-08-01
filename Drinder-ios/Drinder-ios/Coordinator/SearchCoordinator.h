//
//  SearchCoordinator.h
//  Drinder-ios
//
//  Created by Pavel N on 8/1/20.
//  Copyright © 2020 Pavel N. All rights reserved.
//

#import "NavigationCoordinator.h"
#import "UserInfoSession.h"

NS_ASSUME_NONNULL_BEGIN

@interface SearchCoordinator : NavigationCoordinator
- (instancetype)initWithUserSession:(UserInfoSession*)userInfo andParent:(Coordinator*)parent;
@end

NS_ASSUME_NONNULL_END
