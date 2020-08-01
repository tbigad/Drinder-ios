//
//  RootCoordinator.m
//  Drinder-ios
//
//  Created by Pavel N on 8/1/20.
//  Copyright © 2020 Pavel N. All rights reserved.
//

#import "RootCoordinator.h"
#import "LoginViewController.h"
#import "RootAssembly.h"
@interface RootCoordinator ()
@property (nonatomic, strong) UserDataModel* userModel;
@end

@implementation RootCoordinator

- (instancetype)initWithParent:(Coordinator *)parent and:(UserDataModel*)userModel
{
    self = [super initWithParent:parent];
    if (self) {
        _userModel = userModel;
        [self showLogin]; 
    }
    return self;
}

- (void) showLogin {
    LoginViewController *login = [RootAssembly makeLoginWith:self.userModel];
    
    __weak typeof(self)weakSelf = self;
    login.loginSuccess = ^(UserInfoSession * _Nonnull userInfo) {
        //
    };
    
    login.needRegistration = ^{
        [weakSelf showRegistration];
    };
    
    self.baseViewController = login;
    self.currentViewController = login;
}

- (void) showRegistration {
    RegistrationViewController *registration = [RootAssembly makeRegistrationWith:self.userModel];
    //registration.modalPresentationStyle = UIModalPresentationFullScreen; 
    [self presentViewController:registration]; 
}

@end
