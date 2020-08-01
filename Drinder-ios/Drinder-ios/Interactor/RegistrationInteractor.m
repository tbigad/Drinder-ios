//
//  RegistrationInteractor.m
//  Drinder-ios
//
//  Created by Pavel N on 8/1/20.
//  Copyright © 2020 Pavel N. All rights reserved.
//

#import "RegistrationInteractor.h"
#import "BackendAPIHelper.h"
#import "RegistrationViewController.h"
@interface RegistrationInteractor ()
@property (nonatomic, weak) UserDataModel* userData;
@end

@implementation RegistrationInteractor
- (instancetype)initWithUserData:(UserDataModel*)userData
{
    self = [super init];
    if (self) {
        _userData = userData;
        _overEighteen = NO;
    }
    return self;
}

- (void)didTapRegistrationWithComplition:(void (^)(UserInfoSession *, NSString *))complition {
    if (![self isValidRegistrationData]) {
        complition(nil,@"User name or password incorrect");
    }
    
    [BackendAPIHelper registrationWith:self.userName password:self.firstPassword complition:^(NSData * _Nonnull data, NSError * _Nonnull error) {
        if(error) {
            complition(nil,error.localizedDescription);
            return;
        }
        NSDictionary* jsonDict = [NSJSONSerialization JSONObjectWithData:data options:NSJSONReadingMutableContainers error:nil];
        if ([jsonDict valueForKey:@"error"]) {
            NSString *msg = [jsonDict valueForKey:@"error"];
            complition(nil, msg);
            return;
        }
        UserInfoSession *userInfoSession = [[UserInfoSession alloc] initWithJSONDictionary:jsonDict];
        
        complition(userInfoSession, nil);
    }];
    
    
}

- (BOOL) isValidRegistrationData {
    RegistrationViewController *registrarionViewColntroller = [RegistrationViewController new];
    if (registrarionViewColntroller.emailTextField.text.length >= 8 && registrarionViewColntroller.firstPasswordTextField.text.length >= 3 && [registrarionViewColntroller.secondPasswordTextField.text isEqualToString:registrarionViewColntroller.firstPasswordTextField.text] && self.overEighteen) {
    }
    return YES;
}
@end
