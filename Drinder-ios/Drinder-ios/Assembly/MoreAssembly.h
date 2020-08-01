//
//  MoreAssembly.h
//  Drinder-ios
//
//  Created by Pavel N on 8/1/20.
//  Copyright © 2020 Pavel N. All rights reserved.
//

#import "MoreCoordinator.h"
#import "MoreViewController.h"
#import "Assembly.h"

NS_ASSUME_NONNULL_BEGIN

@interface MoreAssembly : Assembly
+ (MoreCoordinator*) makeMoreCoordinatorWithParent:(Coordinator*)parent;
+ (MoreViewController*) makeMore; 
@end

NS_ASSUME_NONNULL_END
