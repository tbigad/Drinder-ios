//
//  UserInfoSession.m
//  Drinder-ios
//
//  Created by Pavel N on 8/1/20.
//  Copyright © 2020 Pavel N. All rights reserved.
//

#import "UserInfoSession.h"

@implementation UserInfoSession

- (instancetype)initWithJSONDictionary:(NSDictionary*)dictionary
{
    self = [super init];
    if (self) {
        NSString *pass = [dictionary valueForKey:@"pass"];
        NSString *userID = [dictionary valueForKey:@"id"];
        NSString *login = [dictionary valueForKey:@"login"];
        UserDataModel *userDataModel = [UserDataModel new];
        userDataModel.login = login;
        userDataModel.userID = userID;
        
        _password = pass;
        _userData = userDataModel;
        _detailsInfo = [UserDetailsInfo new];
    }
    return self;
}

@end
