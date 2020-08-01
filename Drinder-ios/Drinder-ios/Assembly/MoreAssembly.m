//
//  MoreAssembly.m
//  Drinder-ios
//
//  Created by Pavel N on 8/1/20.
//  Copyright © 2020 Pavel N. All rights reserved.
//

#import "MoreAssembly.h"

@implementation MoreAssembly
+ (MoreCoordinator *)makeMoreCoordinatorWithParent:(Coordinator *)parent {
    return [[MoreCoordinator alloc] initWithParent:parent]; 
}

+ (MoreViewController *)makeMore {
    return [MoreViewController new];
}
@end
