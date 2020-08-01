//
//  MainTabCoordinator.m
//  Drinder-ios
//
//  Created by Pavel N on 8/1/20.
//  Copyright © 2020 Pavel N. All rights reserved.
//

#import "MainTabCoordinator.h"
#import "MainAssembly.h"
#import "SearchAssembly.h"
#import "MoreAssembly.h"

@interface MainTabCoordinator()
@property (nonatomic , strong)UserInfoSession *userInfoSession;
@end


@implementation MainTabCoordinator

- (instancetype)initWithUserSession:(UserInfoSession*)userInfo andParent:(Coordinator*)parent
{
    self = [super initWithParent:parent];
    if (self) {
        _userInfoSession = userInfo;
        [self setupTabs];
    }
    return self;
}

- (void)setupTabs {
    SearchCoordinator *searchCoordinator = [SearchAssembly makeSearchCoordinatorWith:self.userInfoSession andParent:self];
    [self addTabbedCoordinator:searchCoordinator];
    
    MoreCoordinator *moreCoordinator = [MoreAssembly makeMoreCoordinatorWithParent:self];
    [self addTabbedCoordinator:moreCoordinator];
}

@end
