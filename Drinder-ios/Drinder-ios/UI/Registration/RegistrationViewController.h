//
//  RegistrationViewController.h
//  Drinder-ios
//
//  Created by Pavel N on 8/1/20.
//  Copyright © 2020 Pavel N. All rights reserved.
//

#import "ViewController.h"
#import "RegistrationInteractor.h"
NS_ASSUME_NONNULL_BEGIN

@interface RegistrationViewController : ViewController
@property (nonatomic, copy, nullable) void (^registrationCanceled)(void);
@property (nonatomic, copy, nullable) void (^registrationSuccess)(UserInfoSession * userInfo);

- (instancetype)initWithInteractor:(RegistrationInteractor*)interactor; 
@end

NS_ASSUME_NONNULL_END
