//
//  GetNearestUsersLocation.m
//  Drinder-ios
//
//  Created by Pavel N on 8/2/20.
//  Copyright © 2020 Pavel N. All rights reserved.
//

#import "GetNearestUsersLocation.h"
@interface GetNearestUsersLocation()
@property (nonatomic, weak) UserInfoSession *userSession;
@end

@implementation GetNearestUsersLocation

- (instancetype)initWithSession:(UserInfoSession *)session
{
    self = [super init];
    if (self) {
        _userSession = session;
    }
    return self;
}

- (void)main {
    __weak typeof(self)wealSelf = self;
    [BackendAPIHelper findNearestWithUser:self.userSession complition:^(NSData *data, NSError *error) {
        [wealSelf finish];
    }];
}
@end
