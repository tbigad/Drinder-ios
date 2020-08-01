//
//  RegistrationInteractor.m
//  Drinder-ios
//
//  Created by Pavel N on 8/1/20.
//  Copyright © 2020 Pavel N. All rights reserved.
//

#import "RegistrationInteractor.h"
@interface RegistrationInteractor ()
@property (nonatomic, weak) UserDataModel* userData;
@end

@implementation RegistrationInteractor
- (instancetype)initWithUserData:(UserDataModel*)userData
{
    self = [super init];
    if (self) {
        _userData = userData;
    }
    return self;
}
@end
