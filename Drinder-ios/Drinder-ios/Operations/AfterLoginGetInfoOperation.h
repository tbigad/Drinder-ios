//
//  AfterLoginGetInfoOperation.h
//  Drinder-ios
//
//  Created by Pavel N on 8/2/20.
//  Copyright © 2020 Pavel N. All rights reserved.
//

#import "AsyncOperation.h"
#import "PostLocationOperation.h"
#import "GetNearestUsersLocation.h"

NS_ASSUME_NONNULL_BEGIN

@interface AfterLoginGetInfoOperation : AsyncOperation
- (instancetype)initWithUserSession:(UserInfoSession*)session;
@end

NS_ASSUME_NONNULL_END
