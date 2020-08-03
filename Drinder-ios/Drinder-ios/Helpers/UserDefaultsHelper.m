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
    NSString *ret = [[NSUserDefaults standardUserDefaults] valueForKey:@"password"];
    // NSData from the Base64 encoded str
    if (ret != 0){
    NSData *nsdataFromBase64String = [[NSData alloc]initWithBase64EncodedString:ret options:0];

    // Decoded NSString from the NSData
    NSString *base64Decoded = [[NSString alloc] initWithData:nsdataFromBase64String encoding:NSUTF8StringEncoding];
        return base64Decoded;}
    else return nil;
}

+ (void)setPassword:(NSString *)userName {
    [[NSUserDefaults standardUserDefaults] setValue:userName forKeyPath:@"password"];
    // NSData from the Base64 encoded str
    NSData *data = [userName dataUsingEncoding:NSUTF8StringEncoding];
    // Decoded NSString from the NSData
    NSString *base64String = [data base64EncodedStringWithOptions:0];
    [[NSUserDefaults standardUserDefaults] setValue:base64String forKeyPath:@"password"];
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

+(void)cleanUser {
    [[NSUserDefaults standardUserDefaults] setValue:@"" forKeyPath:@"userName"];
    [[NSUserDefaults standardUserDefaults] setValue:@"" forKeyPath:@"alcohol"];
    [[NSUserDefaults standardUserDefaults] setValue:nil forKeyPath:@"age"];
    [[NSUserDefaults standardUserDefaults] setValue:@"" forKeyPath:@"gender"];
    [[NSUserDefaults standardUserDefaults] setValue:@"" forKeyPath:@"login"];
    [[NSUserDefaults standardUserDefaults] setValue:@"" forKeyPath:@"password"];
}
@end
