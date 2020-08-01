//
//  LoginViewController.m
//  Drinder-ios
//
//  Created by Pavel N on 8/1/20.
//  Copyright © 2020 Pavel N. All rights reserved.
//

#import "LoginViewController.h"

@interface LoginViewController ()
@property (nonatomic, strong)LoginInteractor* loginInteractor;
@property (strong, nonatomic) IBOutlet UITextField *passwordTextField;
@property (strong, nonatomic) IBOutlet UITextField *emailTextField;
@end

@implementation LoginViewController
- (instancetype)initWithLoginInteractor:(LoginInteractor*)interactor
{
    self = [super init];
    if (self) {
        _loginInteractor = interactor; 
    }
    return self;
}

- (void)viewDidLoad {
    [super viewDidLoad];
}

- (void)setupContent {
    self.emailTextField.text = self.loginInteractor.login;
    self.passwordTextField.text = self.loginInteractor.password;
}

- (IBAction)didChangedTextFields:(id)sender {
    self.loginInteractor.login = self.emailTextField.text;
    self.loginInteractor.password = self.passwordTextField.text;
    NSLog(@"%@ %@",self.loginInteractor.login,self.loginInteractor.password);
}


- (IBAction)didTappedRegistrationButton:(UIButton *)sender {
    self.needRegistration();
}

- (IBAction)didTappedLoginButton:(UIButton *)sender {
    __weak typeof(self)weakSelf = self;
    self.loginInteractor.login = self.emailTextField.text;
    self.loginInteractor.password = self.passwordTextField.text;
    [self.loginInteractor didTapLoginWithComplition:^(UserInfoSession *userInfo, NSString * message) {
        if (userInfo) {
            weakSelf.loginSuccess(userInfo);
        } else {
            [weakSelf showError:@"Login error" Text:message];
        }
    }];
}


@end
