//
//  LoginAssembly.h
//  Drinder-ios
//
//  Created by Pavel N on 8/1/20.
//  Copyright © 2020 Pavel N. All rights reserved.
//

#import "Assembly.h"
#import "RootCoordinator.h"
#import "LoginViewController.h"
#import "LoginInteractor.h"
#import "RegistrationInteractor.h"
#import "RegistrationViewController.h"


NS_ASSUME_NONNULL_BEGIN

@interface RootAssembly : Assembly
+ (RootCoordinator *)makeRootCoordinator;
+ (LoginViewController *)makeLoginWith:(UserDataModel*)dataModel;
+ (RegistrationViewController* ) makeRegistrationWith:(UserDataModel*)dataModel;
@end

NS_ASSUME_NONNULL_END
