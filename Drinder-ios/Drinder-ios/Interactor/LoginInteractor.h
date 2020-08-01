//
//  LoginInteractor.h
//  Drinder-ios
//
//  Created by Pavel N on 8/1/20.
//  Copyright © 2020 Pavel N. All rights reserved.
//

#import "Interactor.h"
#import "UserInfoSession.h"

NS_ASSUME_NONNULL_BEGIN

@interface LoginInteractor : Interactor
@property (nonatomic, strong) NSString* login;
@property (nonatomic, strong) NSString* password;

- (instancetype)initWithUserDataModel:(UserDataModel*)model;
- (void) didTapLoginWithComplition:(void(^)(UserInfoSession *userInfo, NSString* message))complition;

@end

NS_ASSUME_NONNULL_END
