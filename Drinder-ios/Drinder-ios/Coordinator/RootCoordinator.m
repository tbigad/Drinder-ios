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
@implementation RootCoordinator

- (instancetype)init
{
    self = [super init];
    if (self) {
        [self showLogin]; 
    }
    return self;
}

- (void) showLogin {
    LoginViewController *login = [RootAssembly makeLogin];
    self.baseViewController = login;
    self.currentViewController = login;
}
@end
