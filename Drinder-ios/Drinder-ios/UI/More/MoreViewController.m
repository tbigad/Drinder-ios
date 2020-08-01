//
//  MoreViewController.m
//  Drinder-ios
//
//  Created by Юлия Лопатина on 8/1/20.
//  Copyright © 2020 Pavel N. All rights reserved.
//

#import "MoreViewController.h"
#import "MoreTableViewCell.h"
@interface MoreViewController () <UITableViewDataSource, UITableViewDelegate>
@property (strong, nonatomic) UITableView *tableView;
@end

@implementation MoreViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self setUpTableView];

}
-(void)setUpTableView {
    self.tableView = [[UITableView alloc] init];
    self.tableView.translatesAutoresizingMaskIntoConstraints = NO;
       self.tableView.delegate = self;
       self.tableView.dataSource = self;
       [self.tableView registerNib:[UINib nibWithNibName:[MoreTableViewCell reusableId] bundle:[NSBundle mainBundle]] forCellReuseIdentifier:[MoreTableViewCell reusableId]];
       [self.view addSubview:self.tableView];
       [NSLayoutConstraint activateConstraints:@[
           [self.tableView.leadingAnchor constraintEqualToAnchor:self.view.leadingAnchor],
           [self.tableView.topAnchor constraintEqualToAnchor:self.view.topAnchor constant:250],
           [self.tableView.trailingAnchor constraintEqualToAnchor:self.view.trailingAnchor],
           [self.tableView.bottomAnchor constraintEqualToAnchor:self.view.bottomAnchor constant: - 80]
       ]];
}
#pragma mark - UITableViewDataSource

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
   return 1;
    
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    MoreTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:[MoreTableViewCell reusableId] forIndexPath:indexPath];

    return cell;

}

@end
