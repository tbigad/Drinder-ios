//
//  RootCoordinator.h
//  Drinder-ios
//
//  Created by Pavel N on 8/1/20.
//  Copyright © 2020 Pavel N. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "ModalCoordinator.h"
#import "UserDataModel.h"

NS_ASSUME_NONNULL_BEGIN

@interface RootCoordinator : ModalCoordinator
- (instancetype)initWithParent:(Coordinator *)parent and:(UserDataModel*)userModel;
@end

NS_ASSUME_NONNULL_END
