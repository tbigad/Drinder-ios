//
//  SearchInteractor.h
//  Drinder-ios
//
//  Created by Pavel N on 8/2/20.
//  Copyright © 2020 Pavel N. All rights reserved.
//

#import "Interactor.h"
#import "UserInfoSession.h"

NS_ASSUME_NONNULL_BEGIN

@interface SearchInteractor : Interactor

- (instancetype)initWithUserInfoSession:(UserInfoSession*)session;
@end

NS_ASSUME_NONNULL_END
