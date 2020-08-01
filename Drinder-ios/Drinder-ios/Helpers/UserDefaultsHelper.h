//
//  UserDefaultsHelper.h
//  Drinder-ios
//
//  Created by Pavel N on 8/1/20.
//  Copyright © 2020 Pavel N. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface UserDefaultsHelper : NSObject
+ (NSString*)getUserName;
+ (void) setUserName:(NSString*)userName;
+ (NSString*)getPassword;
+ (void) setPassword:(NSString*)userName;
@end

NS_ASSUME_NONNULL_END
