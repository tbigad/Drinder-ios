//
//  NavigationCoordinator.h
//  Drinder-ios
//
//  Created by Pavel N on 8/1/20.
//  Copyright © 2020 Pavel N. All rights reserved.
//

#import "Coordinator.h"

NS_ASSUME_NONNULL_BEGIN

@interface NavigationCoordinator : Coordinator
-(void) pushViewController:(UIViewController*)controller;
-(void) setFirstViewController:(UIViewController*)controller;
@end

NS_ASSUME_NONNULL_END
