//
//  SearchInteractor.m
//  Drinder-ios
//
//  Created by Pavel N on 8/2/20.
//  Copyright © 2020 Pavel N. All rights reserved.
//

#import "SearchInteractor.h"
#import "AfterLoginGetInfoOperation.h"

@interface SearchInteractor() <CLLocationManagerDelegate>
@property (weak) UserInfoSession *userInfo;
@property CLLocationManager *locationManager;
@property (nonatomic, strong)NSOperationQueue *queue;
@end

@implementation SearchInteractor
- (instancetype)initWithUserInfoSession:(UserInfoSession*)session
{
    self = [super init];
    if (self) {
        _userInfo = session;
        _locationManager = [[CLLocationManager alloc] init];
        _locationManager.desiredAccuracy = kCLLocationAccuracyNearestTenMeters;
        _queue = [NSOperationQueue new];
        [self.locationManager setDelegate:self];
    }
    return self;
}

- (void) requestLocation {
    [self.locationManager requestLocation];
}

- (void) sendLocation {
    
}

- (void) requestInfo {
    AfterLoginGetInfoOperation *operation = [[AfterLoginGetInfoOperation alloc] initWithUserSession:self.userInfo];
    [operation setCompletionBlock:^{
        NSLog(@"AfterLoginGetInfoOperation");
    }];
    [self.queue addOperation:operation];
}

- (void)locationManager:(CLLocationManager *)manager didChangeAuthorizationStatus:(CLAuthorizationStatus)status {
    switch (status) {
        case kCLAuthorizationStatusNotDetermined:
        case kCLAuthorizationStatusDenied:
        case kCLAuthorizationStatusRestricted:
            [self.locationManager requestWhenInUseAuthorization];
            break;
        case kCLAuthorizationStatusAuthorizedAlways:
        case kCLAuthorizationStatusAuthorizedWhenInUse:
            [self.locationManager requestLocation];
            break;
    }
}

- (void)locationManager:(CLLocationManager *)manager didUpdateLocations:(NSArray<CLLocation *> *)locations {
    CLLocation * location = [locations.firstObject copy];
    self.userInfo.detailsInfo.latitude = location.coordinate.latitude;
    self.userInfo.detailsInfo.longitude = location.coordinate.longitude;
    [self requestInfo];
}

- (void)locationManager:(CLLocationManager *)manager didFailWithError:(NSError *)error {
    self.showErrorMessage(@"Location error", error.localizedDescription);
}

@end
