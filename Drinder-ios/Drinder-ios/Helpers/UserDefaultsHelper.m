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

+ (NSString *)getUserName {
    NSString *ret = [[[NSUserDefaults standardUserDefaults] valueForKey:@"userName"] stringValue];
    return ret;
}

+ (void)setUserName:(NSString *)userName {
    [[NSUserDefaults standardUserDefaults] setValue:userName forKeyPath:@"userName"];
}

+ (NSString *)getPassword {
    //TODO: ADD DECODING
    NSString *ret = [[[NSUserDefaults standardUserDefaults] valueForKey:@"password"] stringValue];
    return ret;
}

+ (void)setPassword:(NSString *)userName {
    //TODO: ADD ENCODING
    [[NSUserDefaults standardUserDefaults] setValue:userName forKeyPath:@"password"];
}
@end
