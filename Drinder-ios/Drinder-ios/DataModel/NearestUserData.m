//
//  NearestUserData.m
//  Drinder-ios
//
//  Created by Pavel N on 8/2/20.
//  Copyright © 2020 Pavel N. All rights reserved.
//

#import "NearestUserData.h"

@implementation NearestUserData
-(instancetype)initWithLocationJSONDataDictionary:(NSDictionary*)dictionary
{
    self = [super init];
    if (self) {
        [self parseLocationDictionary:dictionary];
    }
    return self;
}
- (void) parseLocationDictionary:(NSDictionary *)dictionary{
    UserLocation *userLocation = [UserLocation new];
    
    NSString *lon = [dictionary valueForKey:@"lon"];
    NSString *lat = [dictionary valueForKey:@"lat"];
    NSString *userID = [dictionary valueForKey:@"id"];
    
    self.userID = userID;
    userLocation.userID = userID;
    CLLocationDegrees latitude = [lat doubleValue];
    CLLocationDegrees longitude = [lon doubleValue];
    userLocation.location = [[CLLocation alloc] initWithLatitude:latitude longitude:longitude];
    self.location = userLocation;
}

- (void) parseDetailsDictionary:(NSDictionary *)dictionary {
    NSString *alcohol = [dictionary valueForKey:@"alcohol"];
    NSString *gender = [dictionary valueForKey:@"gender"];
    NSString *userID = [dictionary valueForKey:@"id"];
    NSString *age = [dictionary valueForKey:@"age"];
    NSString *username = [dictionary valueForKey:@"username"];
    self.userID = userID;
    self.alcohol = alcohol;
    self.gender = gender;
    self.userName = username;
    self.age = [NSNumber numberWithInteger:[age integerValue]];
}
@end
