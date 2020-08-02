//
//  SearchViewController.h
//  Drinder-ios
//
//  Created by Юлия Лопатина on 8/1/20.
//  Copyright © 2020 Pavel N. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "SearchInteractor.h"

NS_ASSUME_NONNULL_BEGIN

@interface SearchViewController : UIViewController
- (instancetype)initWithInteractor:(SearchInteractor*)interactor;
@end

NS_ASSUME_NONNULL_END
