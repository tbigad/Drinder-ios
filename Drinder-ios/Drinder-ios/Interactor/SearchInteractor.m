//
//  SearchInteractor.m
//  Drinder-ios
//
//  Created by Pavel N on 8/2/20.
//  Copyright © 2020 Pavel N. All rights reserved.
//

#import "SearchInteractor.h"

@interface SearchInteractor() <CLLocationManagerDelegate>
@property (weak) UserInfoSession *userInfo;
@property CLLocationManager *locationManager;
@property (nonatomic, strong)NSOperationQueue *queue;
@property (nonatomic, strong) NSArray<NearestUserData*> *nearestUsers;
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

- (void) checkLocationAuthorization {
    CLAuthorizationStatus status = [CLLocationManager authorizationStatus];
    switch (status) {
        case kCLAuthorizationStatusNotDetermined:
        case kCLAuthorizationStatusRestricted:
        case kCLAuthorizationStatusDenied:
            [self.locationManager requestWhenInUseAuthorization];
            break;
        case kCLAuthorizationStatusAuthorizedAlways:
        case kCLAuthorizationStatusAuthorizedWhenInUse:
            [self requestLocation];
            break;
    }
}

- (void) requestLocation {
    [self.locationManager requestLocation];
}

- (void) sendLocation {
    
}

- (void) nearestUsersUpdated {
    NSMutableArray<MKPointAnnotation*>* anotations = [NSMutableArray<MKPointAnnotation*> new];
    for (NearestUserData* user in self.nearestUsers) {        
        MKPointAnnotation* anotation = [[MKPointAnnotation alloc] init];
        [anotation setCoordinate:user.location.location.coordinate];
        [anotation setTitle:user.userName];
        [anotation setSubtitle:user.alcohol];
        [anotations addObject:anotation];
    }
    self.mapAnatation = [anotations copy];
    __weak typeof(self)weakSelf = self;
    dispatch_async(dispatch_get_main_queue(), ^{
        weakSelf.usersUpdated();
    });
}

-(NSString*)userName {
    NSString* ret = self.userInfo.detailsInfo.userName;
    if (!ret || [ret isEqualToString:@""]) {
        ret = @"Unknow. Tap to edit";
    }
    return ret;
}

-(NSString*) userAge {
    NSString* ret = [NSString stringWithFormat:@"%d",[self.userInfo.detailsInfo.age intValue]];
    if (!ret || [ret isEqualToString:@"0"]) {
        ret = @"Unknow. Tap to edit";
    }
    return ret;
}

-(NSString*)userAlcohol {
    NSString* ret = self.userInfo.detailsInfo.alcohol;
    if (!ret || [ret isEqualToString:@""]) {
        ret = @"Unknow. Tap to edit";
    }
    return ret;
}

-(NSString*)userGender {
    NSString* ret = self.userInfo.detailsInfo.gender;
    if (!ret || [ret isEqualToString:@""]) {
        ret = @"Unknow. Tap to edit";
    }
    return ret;
}

-(CLLocationCoordinate2D)userCoordinate {
    return [self.userInfo.detailsInfo getLocation];
}

- (void) requestInfo {
    AfterLoginGetInfoOperation *operation = [[AfterLoginGetInfoOperation alloc] initWithUserSession:self.userInfo];
    __weak typeof(self)wealSelf = self;
    [operation setResultingData:^(NSArray<NearestUserData *> * _Nonnull resultData) {
        wealSelf.nearestUsers = resultData;
        [wealSelf nearestUsersUpdated];
    }];
    [self.queue addOperation:operation];
}

- (void)locationManager:(CLLocationManager *)manager didChangeAuthorizationStatus:(CLAuthorizationStatus)status {
    switch (status) {
        case kCLAuthorizationStatusNotDetermined:
        case kCLAuthorizationStatusDenied:
        case kCLAuthorizationStatusRestricted:
            //
            break;
        case kCLAuthorizationStatusAuthorizedAlways:
        case kCLAuthorizationStatusAuthorizedWhenInUse:
            [self requestLocation];
            break;
    }
}

- (void)locationManager:(CLLocationManager *)manager didUpdateLocations:(NSArray<CLLocation *> *)locations {
    CLLocation * location = [locations.firstObject copy];
    CLLocationCoordinate2D coordinate = {location.coordinate.latitude,location.coordinate.longitude};
    [self.userInfo.detailsInfo setLocation:coordinate];
    [self requestInfo];
}

- (void)locationManager:(CLLocationManager *)manager didFailWithError:(NSError *)error {
    self.showErrorMessage(@"Location error", error.localizedDescription);
}

- (NearestUserData*)didTapOnAnototation:(MKPointAnnotation*)anotation {
    NSUInteger index = [self.mapAnatation indexOfObject:anotation];
    return [self.nearestUsers objectAtIndex:index];
}

@end
