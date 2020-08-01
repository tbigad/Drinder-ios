//
//  ViewController.m
//  Drinder-ios
//
//  Created by Pavel N on 8/1/20.
//  Copyright © 2020 Pavel N. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self setupContent];
}

- (void) setupContent {
    
}

- (void)showError:(NSString *)title Text:(NSString *)description {
    UIAlertController* alert = [UIAlertController alertControllerWithTitle:title
                                                                   message:description
                                                            preferredStyle:UIAlertControllerStyleAlert];
    
    UIAlertAction* defaultAction = [UIAlertAction actionWithTitle:@"OK" style:UIAlertActionStyleDefault
                                                          handler:^(UIAlertAction * action) {}];
    
    [alert addAction:defaultAction];
    [self presentViewController:alert animated:YES completion:nil];
}

- (void)hideWhenTappedAround {
    UITapGestureRecognizer *gesture = [[UITapGestureRecognizer alloc] initWithTarget:self
                                                                               action:@selector(hideKeyboard)];
    [self.view addGestureRecognizer:gesture];
}
- (void)hideKeyboard {
    [self.view endEditing:true];//деактивирует всех ферст респондеров
  
}
@end
