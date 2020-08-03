//
//  GetDetailsOperation.h
//  Drinder-ios
//
//  Created by Pavel N on 8/2/20.
//  Copyright © 2020 Pavel N. All rights reserved.
//

#import "BaseBackendOperations.h"
#import "NearestUserData.h"

NS_ASSUME_NONNULL_BEGIN

@interface GetDetailsOperation : BaseBackendOperations
- (instancetype)initWithUserData:(NearestUserData *)user;
@property (nonatomic, copy, nullable) void (^resultBlock)(NSDictionary* _Nullable resultData, NSError* _Nullable  error);
@end

NS_ASSUME_NONNULL_END
