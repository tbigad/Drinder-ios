//
//  LoginViewController.h
//  Drinder-ios
//
//  Created by Pavel N on 8/1/20.
//  Copyright © 2020 Pavel N. All rights reserved.
//

#import "ViewController.h"
#import "LoginInteractor.h"

NS_ASSUME_NONNULL_BEGIN

@interface LoginViewController : ViewController
@property (nonatomic, copy, nullable) void (^needRegistration)(void);
@property (nonatomic, copy, nullable) void (^loginSuccess)(UserInfoSession * userInfo);
- (instancetype)initWithLoginInteractor:(LoginInteractor*)interactor;
@end

NS_ASSUME_NONNULL_END
