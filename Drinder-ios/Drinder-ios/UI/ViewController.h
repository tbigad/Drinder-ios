//
//  ViewController.h
//  Drinder-ios
//
//  Created by Pavel N on 8/1/20.
//  Copyright © 2020 Pavel N. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN
//Base class for all of UIViewController

@interface ViewController : UIViewController
- (void) showError:(NSString*)title Text:(NSString*)description;
- (void) setupContent;
- (void)hideWhenTappedAround;
@end

NS_ASSUME_NONNULL_END
