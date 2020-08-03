//
//  UserDetailsInfo.m
//  Drinder-ios
//
//  Created by Pavel N on 8/2/20.
//  Copyright © 2020 Pavel N. All rights reserved.
//

#import "UserDetailsInfo.h"
#import "UserDefaultsHelper.h"
@interface UserDetailsInfo()
@property (nonatomic, assign) double latitude;
@property (nonatomic, assign) double longitude;
@end


@implementation UserDetailsInfo
- (CLLocationCoordinate2D)getLocation {
    CLLocationCoordinate2D ret;
    ret.latitude = self.latitude;
    ret.longitude = self.longitude;
    return ret;
}

- (void)setLocation:(CLLocationCoordinate2D)coordinate {
    self.latitude = coordinate.latitude;
    self.longitude = coordinate.longitude;
}

- (instancetype)init
{
    self = [super init];
    if (self) {
        [self loadFromUserDefaults];
    }
    return self;
}

- (void)dealloc
{
    [self saveToUserDefaults];
}

- (void)saveToUserDefaults {
    [UserDefaultsHelper setAlcohol:self.alcohol];
    [UserDefaultsHelper setGender:self.gender];
    [UserDefaultsHelper setAge:self.age];
    [UserDefaultsHelper setUseName:self.userName];
}

- (void)loadFromUserDefaults {
    self.alcohol = [UserDefaultsHelper getAlcohol];
    self.age = [UserDefaultsHelper getAge];
    self.gender = [UserDefaultsHelper getGender];
    self.userName = [UserDefaultsHelper getUserName];
}
@end
