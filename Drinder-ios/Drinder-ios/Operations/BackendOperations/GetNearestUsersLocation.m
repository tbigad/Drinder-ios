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
        if(error) {
            wealSelf.resultingData(nil, error);
            [wealSelf fail];
            return;
        }
        NSDictionary* jsonDict = [NSJSONSerialization JSONObjectWithData:data options:NSJSONReadingMutableContainers error:nil];
        NSMutableArray<NearestUserData*> *nearest = [NSMutableArray new];
        
        for (NSDictionary *user in jsonDict) {
            NearestUserData *nearestUser = [[NearestUserData alloc] initWithLocationJSONDataDictionary:user];
            if(nearestUser) {
                [nearest addObject:nearestUser];
            }
        }
        wealSelf.resultingData([nearest copy], nil);
        [wealSelf finish];
    }];
}
@end
