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
    UITabBarItem* searchTabItem = [[UITabBarItem alloc]initWithTitle:nil image:[UIImage imageNamed:@"wine"] tag:0];
    searchCoordinator.baseViewController.tabBarItem = searchTabItem;
    searchTabItem.imageInsets = UIEdgeInsetsMake(17, 0, -17, 0);
    [self addTabbedCoordinator:searchCoordinator];
    
    MoreCoordinator *moreCoordinator = [MoreAssembly makeMoreCoordinatorWithParent:self];
    moreCoordinator.logoutBlock = self.logoutBlock;
    UITabBarItem* moreTabItem = [[UITabBarItem alloc]initWithTitle:nil image:[UIImage imageNamed:@"more"] tag:1];
    moreCoordinator.baseViewController.tabBarItem = moreTabItem;
    moreTabItem.imageInsets = UIEdgeInsetsMake(17, 0, -17, 0);
    [self addTabbedCoordinator:moreCoordinator];
}

@end
