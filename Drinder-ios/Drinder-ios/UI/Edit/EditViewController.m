//
//  DetailViewController.m
//  Drinder-ios
//
//  Created by Юлия Лопатина on 8/2/20.
//  Copyright © 2020 Pavel N. All rights reserved.
//

#import "EditViewController.h"

@interface  EditViewController  () <UIPickerViewDelegate , UIPickerViewDataSource, UITextFieldDelegate>
@property (strong, nonatomic) IBOutlet UILabel *titleLabel;
@property (strong, nonatomic) IBOutlet UIStackView *stackView;
@property (strong, nonatomic) IBOutlet UIPickerView *pickerView;
@property (strong, nonatomic) IBOutlet UITextField *userName;
@property (strong, nonatomic) IBOutlet UITextField *alcohol;
@property (nonatomic, weak)UserInfoSession *userSession;
@property (strong, nonatomic) IBOutlet UITextField *gender;
@property (nonatomic, assign)UserInfoEditType type;
@property (nonatomic, strong)NSArray<NSString*> *pickerItems;
@end

@implementation  EditViewController 

- (instancetype)initWithUserSession:(UserInfoSession*)session with:(NSUInteger)type
{
    self = [super init];
    if (self) {
        _userSession = session;
        _type = type;
    }
    return self;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    [self.navigationController setNavigationBarHidden:NO animated:YES];
    self.navigationItem.rightBarButtonItem = [[UIBarButtonItem alloc] initWithTitle:@"Save" style:UIBarButtonItemStyleDone target:self action:@selector(didTapSaveButton)];
    self.navigationItem.rightBarButtonItem.title = @"Save";
    
    for (UIView *view in self.stackView.arrangedSubviews) {
        [view setHidden:YES];
    }
    
    if (@available(iOS 13.0, *)) {
        [self.titleLabel setTextColor:UIColor.labelColor];
    }
    
    NSMutableArray<NSString*> *pickerMutableItems = [NSMutableArray new];
    for (int i = 18; i<100; i++) {
        [pickerMutableItems addObject:[NSString stringWithFormat:@"%d",i]];
    }
    self.pickerItems = [pickerMutableItems copy];
    [self.pickerView setDelegate:self];
    [self.pickerView setDataSource:self];
    [self setupView];
    self.alcohol.delegate = self;
    self.gender.delegate = self;
    self.userName.delegate = self;
}

- (void) setupView {
    switch (self.type) {
        case EditName:
            [self.titleLabel setText:@"Enter your name"];
            [self.userName setHidden:NO];
            [self.userName setText:self.userSession.detailsInfo.userName];
            break;
        case EditAlcohol:
            [self.titleLabel setText:@"Enter preffered alcohol"];
            [self.alcohol setHidden:NO];
            [self.alcohol setText:self.userSession.detailsInfo.alcohol];
            break;
        case EditGender:
            [self.titleLabel setText:@"Enter your gender"];
            [self.gender setHidden:NO];
            [self.gender setText:self.userSession.detailsInfo.gender];
            break;
        case EditAge:
            [self.titleLabel setText:@"Select your age"];
            [self.pickerView setHidden:NO];
            NSInteger row;
            if(!self.userSession.detailsInfo.age) {
                row = 0;
            } else {
                row = [self.userSession.detailsInfo.age integerValue] - 18;
            }
            [self.pickerView selectedRowInComponent: row];
            break;
    }
}

- (NSString *)pickerView:(UIPickerView *)pickerView titleForRow:(NSInteger)row forComponent:(NSInteger)component {
    return self.pickerItems[row];
}
- (NSInteger)numberOfComponentsInPickerView:(nonnull UIPickerView *)pickerView {
    return 1;
}

- (NSInteger)pickerView:(nonnull UIPickerView *)pickerView numberOfRowsInComponent:(NSInteger)component {
    return [self.pickerItems count];
}

- (void) didTapSaveButton {
    switch (self.type) {
        case EditName:
            self.userSession.detailsInfo.userName = self.userName.text;
            break;
        case EditAlcohol:
            self.userSession.detailsInfo.alcohol = self.alcohol.text;
            break;
        case EditGender:
            self.userSession.detailsInfo.gender = self.gender.text;
            break;
        case EditAge:
            self.userSession.detailsInfo.age = [self getAge];
            break;
    }
    [self.userSession.detailsInfo saveToUserDefaults];
    [self.navigationController popViewControllerAnimated:YES];
}

- (NSNumber*) getAge {
    NSNumber* ret = [NSNumber numberWithInteger:[self.pickerView selectedRowInComponent:0] + 18];
    return ret;
}

@end
