//
//  UserInfoSession.h
//  Drinder-ios
//
//  Created by Pavel N on 8/1/20.
//  Copyright © 2020 Pavel N. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "UserDataModel.h"
#import "UserDetailsInfo.h"
NS_ASSUME_NONNULL_BEGIN

@interface UserInfoSession : NSObject
@property (nonatomic, strong) UserDataModel* userData;
@property (nonatomic, copy) NSString *password;
@property (nonatomic, strong) UserDetailsInfo* detailsInfo;

- (instancetype)initWithJSONDictionary:(NSDictionary*)dictionary;
@end

NS_ASSUME_NONNULL_END
