//
//  GetDetailsOperation.m
//  Drinder-ios
//
//  Created by Pavel N on 8/2/20.
//  Copyright © 2020 Pavel N. All rights reserved.
//

#import "GetDetailsOperation.h"
#import "BackendAPIHelper.h"
#import "NearestUserData.h"
@interface GetDetailsOperation()
@property (nonatomic, weak)NearestUserData *user;
@property (nonatomic, copy)NSString *userID;
@end

@implementation GetDetailsOperation

- (instancetype)initWithUserData:(NearestUserData *)user
{
    self = [super init];
    if (self) {
        _user = user;
        _userID = _user.userID;
    }
    return self;
}

- (void)main {
    __weak typeof(self)wealSelf = self;
    [BackendAPIHelper getDetails:self.userID complition:^(NSData * _Nonnull data, NSError * _Nonnull error) {
        NSDictionary* jsonDict = [NSJSONSerialization JSONObjectWithData:data options:NSJSONReadingMutableContainers error:nil];
        [wealSelf.user parseDetailsDictionary:jsonDict];
        [wealSelf finish];
    }];
}
@end
