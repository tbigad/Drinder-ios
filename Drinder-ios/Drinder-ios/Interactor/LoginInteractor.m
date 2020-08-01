//
//  LoginInteractor.m
//  Drinder-ios
//
//  Created by Pavel N on 8/1/20.
//  Copyright © 2020 Pavel N. All rights reserved.
//

#import "LoginInteractor.h"
#import "BackendAPIHelper.h"

@interface LoginInteractor()
@property (nonatomic, weak) UserDataModel* userData;
@end

@implementation LoginInteractor
- (instancetype)initWithUserDataModel:(UserDataModel*)model
{
    self = [super init];
    if (self) {
        _userData = model; 
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
        }
        NSString *pass = [jsonDict valueForKey:@"pass"];
        NSString *userID = [jsonDict valueForKey:@"id"];
        NSString *login = [jsonDict valueForKey:@"login"];
        UserDataModel *userDataModel = [UserDataModel new];
        userDataModel.userName = login;
        userDataModel.userID = userID;
        
        UserInfoSession *userInfoSession = [UserInfoSession new];
        userInfoSession.password = pass;
        userInfoSession.userData = userDataModel;
        
        complition(userInfoSession, nil); 
    }];
}
@end
