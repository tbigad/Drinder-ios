//
//  SearchAssembly.m
//  Drinder-ios
//
//  Created by Pavel N on 8/1/20.
//  Copyright © 2020 Pavel N. All rights reserved.
//

#import "SearchAssembly.h"
#import "SearchInteractor.h"

@implementation SearchAssembly
+ (SearchCoordinator *)makeSearchCoordinatorWith:(UserInfoSession *)session andParent:(Coordinator *)parent {
    return [[SearchCoordinator alloc] initWithUserSession:session andParent:parent];
}

+ (SearchViewController *)makeSearchWithWith:(UserInfoSession*)userInfo {
    return [[SearchViewController alloc] initWithInteractor: [SearchAssembly makeSearchInteractorWith:userInfo]];
}

+ (SearchInteractor*) makeSearchInteractorWith:(UserInfoSession*)userInfo {
    return [[SearchInteractor alloc] initWithUserInfoSession:userInfo];
}

+ (UserDetailsViewController *)makeUserDetailsWith:(NearestUserData *)data {
    return [[UserDetailsViewController alloc] initWithNearesUserData:data];
}
@end
