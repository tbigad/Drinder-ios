//
//  PostLocationOperation.m
//  Drinder-ios
//
//  Created by Pavel N on 8/2/20.
//  Copyright © 2020 Pavel N. All rights reserved.
//

#import "PostLocationOperation.h"
@interface PostLocationOperation()
@property (nonatomic, weak) UserInfoSession *userSession;
@end
@implementation PostLocationOperation

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
    [BackendAPIHelper postDetailsWithUser:self.userSession complition:^(NSData * _Nonnull data, NSError * _Nonnull error) {
        [wealSelf finish];
    }];
}
@end
