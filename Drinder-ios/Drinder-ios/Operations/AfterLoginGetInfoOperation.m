//
//  AfterLoginGetInfoOperation.m
//  Drinder-ios
//
//  Created by Pavel N on 8/2/20.
//  Copyright © 2020 Pavel N. All rights reserved.
//

#import "AfterLoginGetInfoOperation.h"

@interface AfterLoginGetInfoOperation ()
@property (nonatomic, strong)NSOperationQueue *queue;
@property (nonatomic, weak)UserInfoSession *userSession;
@end
@implementation AfterLoginGetInfoOperation
- (instancetype)initWithUserSession:(UserInfoSession*)session
{
    self = [super init];
    if (self) {
        _userSession = session;
        _queue = [NSOperationQueue new];
    }
    return self;
}

- (void)main {
    self.queue.maxConcurrentOperationCount = 1;
    __weak typeof(self)wealSelf = self;
    PostLocationOperation* postLocation = [[PostLocationOperation alloc] initWithSession:self.userSession];
    GetNearestUsersLocation *getNearest = [[GetNearestUsersLocation alloc] initWithSession:self.userSession];
    [getNearest setResultingData:^(NSArray<NearestUserData *> * data) {
        wealSelf.resultingData(data);
    }];
    [self.queue addOperations:@[postLocation, getNearest] waitUntilFinished:YES];
    [self finish];
}


@end
