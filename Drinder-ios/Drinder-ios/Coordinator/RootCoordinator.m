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
#import "MainAssembly.h"
#import "UserDefaultsHelper.h"
#import "AppDelegate.h"
@interface RootCoordinator ()
@property (nonatomic, strong) UserDataModel* userModel;
@end

@implementation RootCoordinator

- (instancetype)initWithDataModel:(UserDataModel*)userModel
{
    self = [super init];
    if (self) {
        _userModel = userModel;
        [self showLogin]; 
    }
    return self;
}

- (void) showLogin {
    LoginViewController *login = [RootAssembly makeLoginWith:self.userModel];
    if(self.baseViewController) {
        AppDelegate* appDelegate = (AppDelegate*)[UIApplication sharedApplication].delegate;
        [appDelegate.window setRootViewController:login];
    }
    
    __weak typeof(self)weakSelf = self;
    login.loginSuccess = ^(UserInfoSession * _Nonnull userInfo) {
        [weakSelf showMainTabWith:userInfo];
    };
    
    login.needRegistration = ^{
        [weakSelf showRegistration];
    };
    
    self.baseViewController = login;
    self.currentViewController = login;
}

- (void) showRegistration {
    __weak typeof(self)weakSelf = self;
    RegistrationViewController *registration = [RootAssembly makeRegistrationWith:self.userModel];
    registration.registrationSuccess = ^(UserInfoSession * _Nonnull userInfo) {
        [weakSelf dismissViewController];
        [weakSelf showMainTabWith:userInfo];
    };
    
    registration.registrationCanceled = ^{
        [weakSelf dismissViewController];
    };
    
    registration.modalPresentationStyle = UIModalPresentationFullScreen; 
    [self presentViewController:registration]; 
}

- (void) showMainTabWith:(UserInfoSession*)session {
    __weak typeof(self)weakSelf = self;
    MainTabCoordinator *tabCoordinator = [MainAssembly makeMainCoordinatorWithUserInfoSession:session andParent:self];
    tabCoordinator.baseViewController.modalPresentationStyle = UIModalPresentationFullScreen;
    tabCoordinator.logoutBlock = ^{
        [UserDefaultsHelper cleanUser];
        weakSelf.userModel.login = @"";
        weakSelf.userModel.userID = @"";
        [weakSelf showLogin];
    };
    
    [self presentViewController:tabCoordinator.baseViewController];
}
@end
