//
//  NavigationCoordinator.m
//  Drinder-ios
//
//  Created by Pavel N on 8/1/20.
//  Copyright © 2020 Pavel N. All rights reserved.
//

#import "NavigationCoordinator.h"
@interface NavigationCoordinator()
@property UINavigationController* navigationController;
@end


@implementation NavigationCoordinator

- (instancetype)initWithParent:(Coordinator *)parent
{
    self = [super initWithParent:parent];
    if (self) {
        _navigationController = [UINavigationController new];
        self.baseViewController = _navigationController;
    }
    return self;
}

-(void) pushViewController:(UIViewController*)controller {
    [self.navigationController pushViewController:controller animated:YES];
}

-(void) setFirstViewController:(UIViewController*)controller {
    [self.navigationController setViewControllers:@[controller] animated:NO];
}
@end
