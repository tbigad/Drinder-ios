//
//  UserLocation.h
//  Drinder-ios
//
//  Created by Pavel N on 8/2/20.
//  Copyright © 2020 Pavel N. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <CoreLocation/CoreLocation.h>

NS_ASSUME_NONNULL_BEGIN

@interface UserLocation : NSObject
@property (nonatomic, copy)NSString* userID;
@property (nonatomic, strong)CLLocation *location;

-(instancetype)initWithJSONDataDictionary:(NSDictionary*)dictionary;
@end

NS_ASSUME_NONNULL_END
