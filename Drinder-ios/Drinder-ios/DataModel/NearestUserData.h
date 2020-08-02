//
//  NearestUserData.h
//  Drinder-ios
//
//  Created by Pavel N on 8/2/20.
//  Copyright © 2020 Pavel N. All rights reserved.
//

#import "BaseBackendOperations.h"
#import "UserLocation.h"
NS_ASSUME_NONNULL_BEGIN

@interface NearestUserData : BaseBackendOperations
@property (nonatomic,strong) UserLocation *location;
@property (nonatomic, copy, nullable)NSString* userID;
@property (nonatomic, copy, nullable)NSString* alcohol;
@property (nonatomic, copy, nullable)NSString* gender;
@property (nonatomic, copy, nullable)NSString* userName;
@property (nonatomic, strong, nullable)NSNumber* age;


-(instancetype)initWithLocationJSONDataDictionary:(NSDictionary*)dictionary;
@end

NS_ASSUME_NONNULL_END
