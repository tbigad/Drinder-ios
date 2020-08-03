//
//  MoreCoordinator.m
//  Drinder-ios
//
//  Created by Pavel N on 8/1/20.
//  Copyright © 2020 Pavel N. All rights reserved.
//

#import "MoreCoordinator.h"
#import "MoreAssembly.h"

@implementation MoreCoordinator

- (instancetype)initWithParent:(Coordinator *)parent
{
    self = [super initWithParent:parent];
    if (self) {
        [self showMore];
    }
    return self;
}

- (void) showMore {
    MoreViewController *moreViewController = [MoreAssembly makeMore];
    moreViewController.logoutBlock = self.logoutBlock;
    self.baseViewController = moreViewController; 
}
@end
