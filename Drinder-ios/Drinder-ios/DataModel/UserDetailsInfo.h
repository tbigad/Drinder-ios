//
//  UserDetailsInfo.h
//  Drinder-ios
//
//  Created by Pavel N on 8/2/20.
//  Copyright © 2020 Pavel N. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <CoreLocation/CoreLocation.h>

NS_ASSUME_NONNULL_BEGIN

@interface UserDetailsInfo : NSObject
@property (nonatomic, copy)NSString *alcohol;
@property (nonatomic, copy)NSString *gender;
@property (nonatomic, strong)NSNumber *age;
@property (nonatomic, copy)NSString *userName;
-(CLLocationCoordinate2D) getLocation;
-(void) setLocation:(CLLocationCoordinate2D)coordinate;
@end

NS_ASSUME_NONNULL_END
