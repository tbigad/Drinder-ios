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
    return [RootCoordinator new];
}

+ (LoginViewController *)makeLogin {
    return [LoginViewController new];
}
@end
