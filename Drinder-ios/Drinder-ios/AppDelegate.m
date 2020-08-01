//
//  AppDelegate.m
//  Drinder-ios
//
//  Created by Pavel N on 7/31/20.
//  Copyright © 2020 Pavel N. All rights reserved.
//

#import "AppDelegate.h"
#import "RootCoordinator.h"
#import "RootAssembly.h"

@interface AppDelegate ()
@property (nonatomic, strong) RootCoordinator *rootCoordinator;
@end

@implementation AppDelegate


- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    self.rootCoordinator = [RootAssembly makeRootCoordinator];
    
    self.window = [[UIWindow alloc] initWithFrame:[[UIScreen mainScreen] bounds]];
    [self.window setRootViewController:self.rootCoordinator.baseViewController];
    [self.window makeKeyAndVisible];
    [self.window setBackgroundColor:[UIColor clearColor]];
    return YES;
}

@end
