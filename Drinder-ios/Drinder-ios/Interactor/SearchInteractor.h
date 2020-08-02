//
//  SearchInteractor.h
//  Drinder-ios
//
//  Created by Pavel N on 8/2/20.
//  Copyright © 2020 Pavel N. All rights reserved.
//

#import "Interactor.h"
#import "UserInfoSession.h"
#import <CoreLocation/CoreLocation.h>

NS_ASSUME_NONNULL_BEGIN

@interface SearchInteractor : Interactor
@property (nonatomic, copy, nullable) void (^showErrorMessage)(NSString* title, NSString* message);

- (instancetype)initWithUserInfoSession:(UserInfoSession*)session;
@end

NS_ASSUME_NONNULL_END
