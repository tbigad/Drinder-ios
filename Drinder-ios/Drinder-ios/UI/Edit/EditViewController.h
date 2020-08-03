//
//  DetailViewController.h
//  Drinder-ios
//
//  Created by Юлия Лопатина on 8/2/20.
//  Copyright © 2020 Pavel N. All rights reserved.
//

#import "ViewController.h"
#import "UserInfoSession.h"

NS_ASSUME_NONNULL_BEGIN

typedef NS_ENUM(NSInteger, UserInfoEditType) {
    EditName = 0,
    EditAlcohol = 1,
    EditGender = 2,
    EditAge = 3
};

@interface EditViewController : ViewController

- (instancetype)initWithUserSession:(UserInfoSession*)session with:(NSUInteger)type;
@end

NS_ASSUME_NONNULL_END
