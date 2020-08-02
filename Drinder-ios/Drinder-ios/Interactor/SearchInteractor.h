//
//  SearchInteractor.h
//  Drinder-ios
//
//  Created by Pavel N on 8/2/20.
//  Copyright © 2020 Pavel N. All rights reserved.
//

#import "Interactor.h"
#import "UserInfoSession.h"
#import <CoreLocation/CoreLocation.h>
#import <MapKit/MapKit.h>
#import "AfterLoginGetInfoOperation.h"

NS_ASSUME_NONNULL_BEGIN

@interface SearchInteractor : Interactor
@property (nonatomic, strong) NSArray<MKPointAnnotation*>* mapAnatation;
@property (nonatomic, copy, nullable) void (^showErrorMessage)(NSString* title, NSString* message);
@property (nonatomic, copy, nullable) void (^usersUpdated)(void);

- (instancetype)initWithUserInfoSession:(UserInfoSession*)session;
- (NSString*)userName;
- (NSString*) userAge;
- (NSString*)userAlcohol;
- (NSString*)userGender;
- (CLLocationCoordinate2D)userCoordinate;
- (void) checkLocationAuthorization;
- (NearestUserData*) didTapOnAnototation:(MKPointAnnotation*)anotation;
@end

NS_ASSUME_NONNULL_END
