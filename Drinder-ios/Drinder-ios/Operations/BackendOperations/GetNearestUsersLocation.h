//
//  GetNearestUsersLocation.h
//  Drinder-ios
//
//  Created by Pavel N on 8/2/20.
//  Copyright © 2020 Pavel N. All rights reserved.
//

#import "BaseBackendOperations.h"

NS_ASSUME_NONNULL_BEGIN

@interface GetNearestUsersLocation : BaseBackendOperations
- (instancetype)initWithSession:(UserInfoSession *)session;
@end

NS_ASSUME_NONNULL_END
