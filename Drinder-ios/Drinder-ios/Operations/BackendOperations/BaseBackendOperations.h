//
//  BaseBackendOperations.h
//  rs.ios-stage2-task7
//
//  Created by Pavel N on 7/18/20.
//  Copyright © 2020 Pavel N. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "AsyncOperation.h"
#import "BackendAPIHelper.h"

NS_ASSUME_NONNULL_BEGIN

@interface BaseBackendOperations : AsyncOperation
- (void) fail;
- (void) succes;
@end

NS_ASSUME_NONNULL_END
