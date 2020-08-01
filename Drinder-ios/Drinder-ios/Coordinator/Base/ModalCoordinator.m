//
//  ModalCoordinator.m
//  Drinder-ios
//
//  Created by Pavel N on 8/1/20.
//  Copyright © 2020 Pavel N. All rights reserved.
//

#import "ModalCoordinator.h"

@implementation ModalCoordinator

- (instancetype)initWithParent:(Coordinator*)parent
{
    self = [super init];
    if (self) {
        [parent addChild:self];
    }
    return self;
}

- (void)presentViewController:(UIViewController *)controller {
    if(self.presentedViewController == controller) {
        return;
    }
    self.presentedViewController = controller;
    self.currentViewController = controller;
    [self.baseViewController presentViewController:controller animated:YES completion:nil];
}
@end
