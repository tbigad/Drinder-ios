//
//  RegistrationViewController.m
//  Drinder-ios
//
//  Created by Pavel N on 8/1/20.
//  Copyright © 2020 Pavel N. All rights reserved.
//

#import "RegistrationViewController.h"

@interface RegistrationViewController ()
@property (strong, nonatomic) IBOutlet UITextField *emailTextField;
@property (strong, nonatomic) IBOutlet UITextField *firstPasswordTextField;
@property (strong, nonatomic) IBOutlet UITextField *secondPasswordTextField;
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
    // Do any additional setup after loading the view from its nib.
}

- (IBAction)didTappedSignUpButton:(UIButton *)sender {
    self.registrationInteractor.firstPassword = self.firstPasswordTextField.text;
    self.registrationInteractor.repeatPassword = self.secondPasswordTextField.text;
    self.registrationInteractor.userName = self.emailTextField.text;
    
    __weak typeof(self)weakSelf = self;
    [self.registrationInteractor didTapRegistrationWithComplition:^(UserInfoSession * userInfo, NSString * message) {
        if (userInfo) {
            weakSelf.registrationSuccess(userInfo);
        } else {
            [weakSelf showError:@"Login error" Text:message];
        }
    }];
}


@end
