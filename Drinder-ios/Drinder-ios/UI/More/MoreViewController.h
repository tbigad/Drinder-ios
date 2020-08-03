//
//  MoreViewController.h
//  Drinder-ios
//
//  Created by Юлия Лопатина on 8/1/20.
//  Copyright © 2020 Pavel N. All rights reserved.
//

#import "ViewController.h"

NS_ASSUME_NONNULL_BEGIN

@interface MoreViewController : ViewController
@property (nonatomic, copy, nullable) void (^logoutBlock)(void);
@end

NS_ASSUME_NONNULL_END
