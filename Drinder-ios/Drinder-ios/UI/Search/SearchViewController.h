//
//  SearchViewController.h
//  Drinder-ios
//
//  Created by Юлия Лопатина on 8/1/20.
//  Copyright © 2020 Pavel N. All rights reserved.
//

#import "ViewController.h"
#import "SearchInteractor.h"

NS_ASSUME_NONNULL_BEGIN

@interface SearchViewController : ViewController
@property (nonatomic, copy, nullable) void (^showDetail)(NearestUserData* nearesUser);
- (instancetype)initWithInteractor:(SearchInteractor*)interactor;
@property (nonatomic, copy, nullable) void (^openEdit)(void);
@end

NS_ASSUME_NONNULL_END
