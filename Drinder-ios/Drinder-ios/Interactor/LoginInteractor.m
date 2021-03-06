//
//  LoginInteractor.m
//  Drinder-ios
//
//  Created by Pavel N on 8/1/20.
//  Copyright © 2020 Pavel N. All rights reserved.
//

#import "LoginInteractor.h"
#import "BackendAPIHelper.h"
#import "UserDefaultsHelper.h"

@interface LoginInteractor()
@property (nonatomic, weak) UserDataModel* userData;
@end

@implementation LoginInteractor
- (instancetype)initWithUserDataModel:(UserDataModel*)model
{
    self = [super init];
    if (self) {
        _userData = model;
        [self loadFromUserDefaults];
    }
    return self;
}

- (void)didTapLoginWithComplition:(void (^)(UserInfoSession *, NSString *))complition {
    [BackendAPIHelper loginWith:self.login password:self.password complition:^(NSData * _Nonnull data, NSError * _Nonnull error) {
        if(error) {
            complition(nil,error.localizedDescription);
            return;
        }
        NSDictionary* jsonDict = [NSJSONSerialization JSONObjectWithData:data options:NSJSONReadingMutableContainers error:nil];
        if ([jsonDict valueForKey:@"error"]) {
            NSString *msg = [jsonDict valueForKey:@"error"];
            complition(nil, msg);
            return;
        }
        UserInfoSession *userInfoSession = [[UserInfoSession alloc] initWithJSONDictionary:jsonDict];
        [UserDefaultsHelper setPassword:userInfoSession.password];
        [UserDefaultsHelper setLogin:userInfoSession.userData.login];
        complition(userInfoSession, nil); 
    }];
}

- (void)loadFromUserDefaults {
    self.login = [UserDefaultsHelper getLogin];
    self.password = [UserDefaultsHelper getPassword];
}
@end
