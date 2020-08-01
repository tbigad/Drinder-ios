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
    LoginInteractor* interactor = [RootAssembly makeLoginInteractorWith:self.userModel];
    LoginViewController *login = [RootAssembly makeLoginWith:interactor];
    self.baseViewController = login;
    self.currentViewController = login;
}
@end
