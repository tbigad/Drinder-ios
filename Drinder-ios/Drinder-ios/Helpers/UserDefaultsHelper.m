//
//  UserDefaultsHelper.m
//  Drinder-ios
//
//  Created by Pavel N on 8/1/20.
//  Copyright © 2020 Pavel N. All rights reserved.
//

#import "UserDefaultsHelper.h"

@implementation UserDefaultsHelper
- (instancetype)init
{
    [NSException raise:@"init" format:@"UserDefaultsHelper only for class method"];
    return nil;
}

+ (NSString *)getLogin {
    NSString *ret = [[NSUserDefaults standardUserDefaults] valueForKey:@"login"] ;
    return ret;
}

+ (void)setLogin:(NSString *)userName {
    [[NSUserDefaults standardUserDefaults] setValue:userName forKeyPath:@"login"];
}

+ (NSString *)getPassword {
    //TODO: ADD DECODING
    NSString *ret = [[NSUserDefaults standardUserDefaults] valueForKey:@"password"];
    return ret;
}

+ (void)setPassword:(NSString *)userName {
    //TODO: ADD ENCODING
    [[NSUserDefaults standardUserDefaults] setValue:userName forKeyPath:@"password"];
}

+ (void)setAge:(NSNumber *)userName {
    [[NSUserDefaults standardUserDefaults] setValue:userName forKeyPath:@"age"];
}
+ (NSNumber *)getAge {
    NSNumber *ret = [[NSUserDefaults standardUserDefaults] valueForKey:@"age"] ;
    return ret;
}

+ (void)setGender:(NSString *)userName {
    [[NSUserDefaults standardUserDefaults] setValue:userName forKeyPath:@"gender"];
}

+ (NSString *)getGender {
    NSString *ret = [[NSUserDefaults standardUserDefaults] valueForKey:@"gender"];
    return ret;
}

+ (void)setAlcohol:(NSString *)userName {
    [[NSUserDefaults standardUserDefaults] setValue:userName forKeyPath:@"alcohol"];
}

+ (NSString *)getAlcohol {
    NSString *ret = [[NSUserDefaults standardUserDefaults] valueForKey:@"alcohol"];
    return ret;
}

+ (NSString *)getUserName {
    NSString *ret = [[NSUserDefaults standardUserDefaults] valueForKey:@"userName"] ;
    return ret;
}

+ (void)setUseName:(NSString *)userName {
    [[NSUserDefaults standardUserDefaults] setValue:userName forKeyPath:@"userName"];
}
@end
