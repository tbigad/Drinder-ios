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
#import "UserDetailsViewController.h"
#import "EditViewController.h"

NS_ASSUME_NONNULL_BEGIN

@interface SearchAssembly : Assembly
+ (SearchCoordinator*) makeSearchCoordinatorWith:(UserInfoSession*)session andParent:(Coordinator*)parent;
+ (SearchViewController*) makeSearchWithWith:(UserInfoSession*)userInfo;
+ (UserDetailsViewController*) makeUserDetailsWith:(NearestUserData*)data;
+ (EditViewController *) makeEditViewControllerWith:(UserInfoSession *)session and:(NSUInteger)type;
@end

NS_ASSUME_NONNULL_END
