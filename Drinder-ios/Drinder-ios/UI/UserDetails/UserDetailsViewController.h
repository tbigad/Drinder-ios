//
//  UserDetailsViewController.h
//  Drinder-ios
//
//  Created by Pavel N on 8/3/20.
//  Copyright © 2020 Pavel N. All rights reserved.
//

#import "ViewController.h"
#import "NearestUserData.h"

NS_ASSUME_NONNULL_BEGIN

@interface UserDetailsViewController : ViewController
- (instancetype)initWithNearesUserData:(NearestUserData*)data;
@end

NS_ASSUME_NONNULL_END
