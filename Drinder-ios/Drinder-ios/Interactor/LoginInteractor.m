//
//  LoginInteractor.m
//  Drinder-ios
//
//  Created by Pavel N on 8/1/20.
//  Copyright © 2020 Pavel N. All rights reserved.
//

#import "LoginInteractor.h"
@interface LoginInteractor()
@property (nonatomic, weak) UserDataModel* userData;
@end

@implementation LoginInteractor
- (instancetype)initWithUserDataModel:(UserDataModel*)model
{
    self = [super init];
    if (self) {
        _userData = model; 
    }
    return self;
}
@end
