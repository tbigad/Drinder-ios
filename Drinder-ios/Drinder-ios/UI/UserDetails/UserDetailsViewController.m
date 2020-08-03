//
//  UserDetailsViewController.m
//  Drinder-ios
//
//  Created by Pavel N on 8/3/20.
//  Copyright © 2020 Pavel N. All rights reserved.
//

#import "UserDetailsViewController.h"

@interface UserDetailsViewController ()
@property (strong, nonatomic) IBOutlet UILabel *labelTitle;
@property (strong, nonatomic) IBOutlet UILabel *genderLabel;
@property (strong, nonatomic) IBOutlet UILabel *alcohol;
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
    [self.navigationController setNavigationBarHidden:NO animated:YES];
    [self.navigationController.navigationBar setPrefersLargeTitles:YES];
    [self setTitle:self.userData.userName];
    [self.labelTitle setText:[NSString stringWithFormat:@"%@, %d",self.userData.userName, [self.userData.age intValue]]];
    [self.genderLabel setText:[NSString stringWithFormat:@"%@",self.userData.gender]];
    [self.alcohol setText:[NSString stringWithFormat:@"I preferred: %@",self.userData.alcohol]];
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
