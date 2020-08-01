//
//  SearchCoordinator.m
//  Drinder-ios
//
//  Created by Pavel N on 8/1/20.
//  Copyright © 2020 Pavel N. All rights reserved.
//

#import "SearchCoordinator.h"
#import "SearchAssembly.h"

@interface SearchCoordinator()
@property (nonatomic , weak)UserInfoSession *userInfoSession;
@end


@implementation SearchCoordinator

- (instancetype)initWithUserSession:(UserInfoSession*)userInfo andParent:(Coordinator*)parent
{
    self = [super initWithParent:parent];
    if (self) {
        _userInfoSession = userInfo;
        [self showSearch]; 
    }
    return self;
}

- (void) showSearch {
    SearchViewController *searchViewController = [SearchAssembly makeSearchWith];
    [self setFirstViewController:searchViewController];
}

@end
