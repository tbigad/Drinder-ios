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
@property (nonatomic, copy, nullable) void (^needRegistration)(void);
@property (nonatomic, copy, nullable) void (^loginSuccess)(void);
@end

NS_ASSUME_NONNULL_END
