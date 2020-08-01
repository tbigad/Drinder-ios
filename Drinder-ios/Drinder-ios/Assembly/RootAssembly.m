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

+ (LoginViewController *)makeLoginWith:(UserDataModel*)dataModel {
    return [[LoginViewController alloc]initWithLoginInteractor: [RootAssembly makeLoginInteractorWith:dataModel] ];
}


+ (LoginInteractor*) makeLoginInteractorWith:(UserDataModel*)dataModel {
    return [[LoginInteractor alloc] initWithUserDataModel:dataModel];
}

+ (RegistrationViewController *)makeRegistrationWith:(UserDataModel*)dataModel {
    return [[RegistrationViewController alloc] initWithInteractor:[RootAssembly makeRegistrationInteractorWith:dataModel] ];
}

+ (RegistrationInteractor *)makeRegistrationInteractorWith:(UserDataModel *)dataModel {
    return [[RegistrationInteractor alloc] initWithUserData:dataModel];
}
@end
