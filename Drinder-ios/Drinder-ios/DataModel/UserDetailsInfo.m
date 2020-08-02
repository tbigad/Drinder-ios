//
//  UserDetailsInfo.m
//  Drinder-ios
//
//  Created by Pavel N on 8/2/20.
//  Copyright © 2020 Pavel N. All rights reserved.
//

#import "UserDetailsInfo.h"
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
@end
