//
//  UserDetailsViewController.m
//  Drinder-ios
//
//  Created by Pavel N on 8/3/20.
//  Copyright © 2020 Pavel N. All rights reserved.
//

#import "UserDetailsViewController.h"
#import "NearestUserData.h"

@interface UserDetailsViewController ()
@property (nonatomic, weak) NearestUserData* userData;
@end

@implementation UserDetailsViewController
- (instancetype)initWithNearesUserData:(NearestUserData*)data
{
    self = [super init];
    if (self) {
        _userData = data;
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
