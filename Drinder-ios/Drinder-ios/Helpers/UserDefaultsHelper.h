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
+ (NSString*)getLogin;
+ (void) setLogin:(NSString*)userName;
+ (NSString*)getPassword;
+ (void) setPassword:(NSString*)userName;
+ (void) setAlcohol:(NSString*)userName;
+ (NSString*)getAlcohol;
+ (void) setGender:(NSString*)userName;
+ (NSString*)getGender;
+ (void) setAge:(NSNumber*)userName;
+ (NSNumber*)getAge;
+ (NSString *)getUserName;
+ (void)setUseName:(NSString *)userName;
+ (void) cleanUser;
@end

NS_ASSUME_NONNULL_END
