//
//  PostLocationOperation.h
//  Drinder-ios
//
//  Created by Pavel N on 8/2/20.
//  Copyright © 2020 Pavel N. All rights reserved.
//

#import "BaseBackendOperations.h"

NS_ASSUME_NONNULL_BEGIN

@interface PostLocationOperation : BaseBackendOperations
- (instancetype)initWithSession:(UserInfoSession *)session;
@property (nonatomic, copy, nullable) void (^resultBlock)(NSError* _Nullable  error);
@end

NS_ASSUME_NONNULL_END
