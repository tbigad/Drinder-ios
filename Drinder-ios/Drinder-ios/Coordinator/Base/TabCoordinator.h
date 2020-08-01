//
//  TabCoordinator.h
//  Drinder-ios
//
//  Created by Pavel N on 8/1/20.
//  Copyright © 2020 Pavel N. All rights reserved.
//

#import "Coordinator.h"

NS_ASSUME_NONNULL_BEGIN

@interface TabCoordinator : Coordinator
- (void) setupTabs;
- (void) addTabbedCoordinator:(Coordinator*) coordinator;
@end

NS_ASSUME_NONNULL_END
