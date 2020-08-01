//
//  ModalCoordinator.m
//  Drinder-ios
//
//  Created by Pavel N on 8/1/20.
//  Copyright © 2020 Pavel N. All rights reserved.
//

#import "ModalCoordinator.h"

@implementation ModalCoordinator

- (void)presentViewController:(UIViewController *)controller {
    if(self.presentedViewController == controller) {
        return;
    }
    self.presentedViewController = controller;
    self.currentViewController = controller;
    [self.baseViewController presentViewController:controller animated:YES completion:nil];
}

- (void)dismissViewController {
    [self.baseViewController dismissViewControllerAnimated:YES completion:nil];
}
@end
