//
//  BackendAPIHelper.h
//  rs.ios-stage2-task7
//
//  Created by Pavel N on 7/17/20.
//  Copyright © 2020 Pavel N. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface BackendAPIHelper : NSObject
+ (void) loginWith:(NSString*)name password:(NSString*)pass complition:(void(^)(NSData* data, NSError* error))handler;
+ (void) registrationWith:(NSString*)name password:(NSString*)pass complition:(void(^)(NSData* data, NSError* error))handler;
@end

NS_ASSUME_NONNULL_END
