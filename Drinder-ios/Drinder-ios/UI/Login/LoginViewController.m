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
    // Do any additional setup after loading the view from its nib.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
