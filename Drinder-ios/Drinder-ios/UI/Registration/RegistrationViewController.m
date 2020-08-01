//
//  RegistrationViewController.m
//  Drinder-ios
//
//  Created by Pavel N on 8/1/20.
//  Copyright © 2020 Pavel N. All rights reserved.
//

#import "RegistrationViewController.h"
@interface RegistrationViewController ()
@property (nonatomic, strong) RegistrationInteractor* registrationInteractor;
@end

@implementation RegistrationViewController

- (instancetype)initWithInteractor:(RegistrationInteractor*)interactor
{
    self = [super init];
    if (self) {
        _registrationInteractor = interactor;
    }
    return self;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    [self hideWhenTappedAround];
}

- (IBAction)didTappedSignUpButton:(UIButton *)sender {
    self.registrationInteractor.firstPassword = self.firstPasswordTextField.text;
    self.registrationInteractor.repeatPassword = self.secondPasswordTextField.text;
    self.registrationInteractor.userName = self.emailTextField.text;
    
    __weak typeof(self)weakSelf = self;
    [self.registrationInteractor didTapRegistrationWithComplition:^(UserInfoSession * userInfo, NSString * message) {
        dispatch_async(dispatch_get_main_queue(), ^{
            if (userInfo) {
                weakSelf.registrationSuccess(userInfo);
            } else {
                [weakSelf showError:@"Login error" Text:message];
            }
        });
    }];
}

- (IBAction)didTapCloseButton:(UIButton *)sender {
    self.registrationCanceled();
}

- (IBAction)didTapSwitch:(UISwitch *)sender {
    self.registrationInteractor.overEighteen = [sender isOn];
}

@end
