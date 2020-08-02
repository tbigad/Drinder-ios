//
//  BackendAPIHelper.h
//  rs.ios-stage2-task7
//
//  Created by Pavel N on 7/17/20.
//  Copyright © 2020 Pavel N. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "UserInfoSession.h"

NS_ASSUME_NONNULL_BEGIN

@interface BackendAPIHelper : NSObject
+ (void) loginWith:(NSString*)name password:(NSString*)pass complition:(void(^)(NSData* data, NSError* error))handler;
+ (void) registrationWith:(NSString*)name password:(NSString*)pass complition:(void(^)(NSData* data, NSError* error))handler;
+ (void) postLocationWithUser:(UserInfoSession*)user complition:(void(^)(NSError* error))handler;
+ (void) getLocationsWithID:(NSString*)userID complition:(void(^)(NSError* error))handler;
+ (void) postDetailsWithUser:(UserInfoSession*)user complition:(void(^)(NSData* data, NSError* error))handler;
+ (void) getDetails:(NSString*)userID complition:(void(^)(NSData* data, NSError* error))handler;
+ (void) findNearestWithUser:(UserInfoSession*)user complition:(void(^)(NSData* data, NSError* error))handler;
@end

NS_ASSUME_NONNULL_END
