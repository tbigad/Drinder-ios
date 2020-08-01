//
//  SearchAssembly.m
//  Drinder-ios
//
//  Created by Pavel N on 8/1/20.
//  Copyright © 2020 Pavel N. All rights reserved.
//

#import "SearchAssembly.h"

@implementation SearchAssembly
+ (SearchCoordinator *)makeSearchCoordinatorWith:(UserInfoSession *)session andParent:(Coordinator *)parent {
    return [[SearchCoordinator alloc] initWithUserSession:session andParent:parent];
}

+ (SearchViewController *)makeSearchWith {
    //TODO: do it with interactor!!!
    return [SearchViewController new];
}
@end
