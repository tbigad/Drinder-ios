//
//  PostUserDetails.m
//  Drinder-ios
//
//  Created by Pavel N on 8/3/20.
//  Copyright © 2020 Pavel N. All rights reserved.
//

#import "PostUserDetailsOperation.h"

@interface PostUserDetailsOperation()
@property (nonatomic, weak) UserInfoSession *userSession;
@end

@implementation PostUserDetailsOperation
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
        if(error) {
            wealSelf.resultBlock(nil, error);
            [wealSelf fail];
            return;
        }
        NSDictionary* jsonDict = [NSJSONSerialization JSONObjectWithData:data options:NSJSONReadingMutableContainers error:nil];
        wealSelf.resultBlock(jsonDict, nil);
        [wealSelf succes];
    }];
}
@end
