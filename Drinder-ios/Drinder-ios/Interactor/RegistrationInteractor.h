//
//  RegistrationInteractor.h
//  Drinder-ios
//
//  Created by Pavel N on 8/1/20.
//  Copyright © 2020 Pavel N. All rights reserved.
//

#import "Interactor.h"
#import "UserDataModel.h"

NS_ASSUME_NONNULL_BEGIN

@interface RegistrationInteractor : Interactor
- (instancetype)initWithUserData:(UserDataModel*)userData;
@end

NS_ASSUME_NONNULL_END
