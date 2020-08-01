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
- (instancetype)initWithLoginInteractor:(LoginInteractor*)interactor;
@end

NS_ASSUME_NONNULL_END
