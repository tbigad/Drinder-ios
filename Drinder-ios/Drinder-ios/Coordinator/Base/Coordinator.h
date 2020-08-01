//
//  Coordinator.h
//  Drinder-ios
//
//  Created by Pavel N on 8/1/20.
//  Copyright © 2020 Pavel N. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface Coordinator : NSObject
@property (nonatomic, strong) UIViewController *currentViewController;
@property (nonatomic, strong) UIViewController *baseViewController;
- (instancetype)initWithParent:(Coordinator*)parent;
- (void) addChildCoordinator:(Coordinator*)childCoordinator;
@end

NS_ASSUME_NONNULL_END
