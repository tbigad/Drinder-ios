//
//  MoreCoordinator.h
//  Drinder-ios
//
//  Created by Pavel N on 8/1/20.
//  Copyright © 2020 Pavel N. All rights reserved.
//

#import "ModalCoordinator.h"

NS_ASSUME_NONNULL_BEGIN

@interface MoreCoordinator : ModalCoordinator
@property (nonatomic, copy, nullable) void (^logoutBlock)(void);
@end

NS_ASSUME_NONNULL_END
