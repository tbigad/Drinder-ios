//
//  ModalCoordinator.h
//  Drinder-ios
//
//  Created by Pavel N on 8/1/20.
//  Copyright © 2020 Pavel N. All rights reserved.
//

#import "Coordinator.h"

NS_ASSUME_NONNULL_BEGIN

@interface ModalCoordinator : Coordinator
@property (nonatomic, strong)UIViewController *presentedViewController; 
- (void)presentViewController:(UIViewController*)controller;
- (void)dismissViewController;
@end

NS_ASSUME_NONNULL_END
