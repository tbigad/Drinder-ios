//
//  SearchInteractor.m
//  Drinder-ios
//
//  Created by Pavel N on 8/2/20.
//  Copyright © 2020 Pavel N. All rights reserved.
//

#import "SearchInteractor.h"
@interface SearchInteractor()
@property (weak) UserInfoSession *userInfo;
@end

@implementation SearchInteractor
- (instancetype)initWithUserInfoSession:(UserInfoSession*)session
{
    self = [super init];
    if (self) {
        _userInfo = session; 
    }
    return self;
}
@end
