//
//  RegistrationInteractor.h
//  Drinder-ios
//
//  Created by Pavel N on 8/1/20.
//  Copyright © 2020 Pavel N. All rights reserved.
//

#import "Interactor.h"
#import "UserInfoSession.h"

NS_ASSUME_NONNULL_BEGIN

@interface RegistrationInteractor : Interactor
@property (nonatomic, copy)NSString *userName;
@property (nonatomic, copy)NSString *firstPassword;
@property (nonatomic, copy)NSString *repeatPassword;
@property (nonatomic, assign) BOOL overEighteen;

- (instancetype)initWithUserData:(UserDataModel*)userData;
- (void) didTapRegistrationWithComplition:(void(^)(UserInfoSession *userInfo, NSString* message))complition;
@end

NS_ASSUME_NONNULL_END
