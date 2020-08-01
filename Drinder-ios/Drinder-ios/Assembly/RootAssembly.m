//
//  LoginAssembly.m
//  Drinder-ios
//
//  Created by Pavel N on 8/1/20.
//  Copyright © 2020 Pavel N. All rights reserved.
//

#import "RootAssembly.h"

@implementation RootAssembly

+ (RootCoordinator *)makeRootCoordinator {
    return [[RootCoordinator alloc] initWithParent:nil and:[UserDataModel new]];
}

+ (LoginViewController *)makeLoginWith:(LoginInteractor*)interactor {
    return [[LoginViewController alloc]initWithLoginInteractor:interactor];
}


+ (LoginInteractor*) makeLoginInteractorWith:(UserDataModel*)dataModel {
    return [[LoginInteractor alloc] initWithUserDataModel:dataModel];
}
@end
