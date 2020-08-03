//
//  AfterLoginGetInfoOperation.m
//  Drinder-ios
//
//  Created by Pavel N on 8/2/20.
//  Copyright © 2020 Pavel N. All rights reserved.
//

#import "AfterLoginGetInfoOperation.h"
#import "GetDetailsOperation.h"
#import "PostUserDetailsOperation.h"

@interface AfterLoginGetInfoOperation ()
@property (nonatomic, strong)NSOperationQueue *queue;
@property (nonatomic, weak)UserInfoSession *userSession;
@property (nonatomic, strong) NSArray<NearestUserData *> * nearestUserData;

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
    __weak typeof(self)wealSelf = self;
    PostLocationOperation* postLocation = [[PostLocationOperation alloc] initWithSession:self.userSession];
    GetNearestUsersLocation *getNearest = [[GetNearestUsersLocation alloc] initWithSession:self.userSession];
    PostUserDetailsOperation *postUser = [[PostUserDetailsOperation alloc] initWithSession:self.userSession];
    [getNearest setResultingData:^(NSArray<NearestUserData *> * data) {
        wealSelf.nearestUserData = data;
    }];
    [self.queue addOperations:@[postLocation, getNearest, postUser] waitUntilFinished:YES];
    
    NSMutableArray<NSOperation*> *detailsOperations = [NSMutableArray new];
    
    NSBlockOperation *finishBlock = [NSBlockOperation blockOperationWithBlock:^{
        wealSelf.resultingData([wealSelf.nearestUserData copy]);
    }];
    
    for (NearestUserData *user in self.nearestUserData) {
        GetDetailsOperation* operation = [[GetDetailsOperation alloc] initWithUserData:user];
        [finishBlock addDependency:operation];
        [detailsOperations addObject:operation];
    }
    [detailsOperations addObject:finishBlock];
    [self.queue addOperations:detailsOperations waitUntilFinished:YES];

    
    [self finish];
}


@end
