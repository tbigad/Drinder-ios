//
//  SearchAssembly.h
//  Drinder-ios
//
//  Created by Pavel N on 8/1/20.
//  Copyright © 2020 Pavel N. All rights reserved.
//

#import "Assembly.h"
#import "SearchCoordinator.h"
#import "UserInfoSession.h"
#import "SearchViewController.h"

NS_ASSUME_NONNULL_BEGIN

@interface SearchAssembly : Assembly
+ (SearchCoordinator*) makeSearchCoordinatorWith:(UserInfoSession*)session andParent:(Coordinator*)parent;
+ (SearchViewController*) makeSearchWithWith:(UserInfoSession*)userInfo;
@end

NS_ASSUME_NONNULL_END
