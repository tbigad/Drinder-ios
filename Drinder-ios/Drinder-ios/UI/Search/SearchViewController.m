//
//  SearchViewController.m
//  Drinder-ios
//
//  Created by Юлия Лопатина on 8/1/20.
//  Copyright © 2020 Pavel N. All rights reserved.
//

#import "SearchViewController.h"
#import "SearchTableViewCell.h"
#import "MapKit/MapKit.h"

@interface SearchViewController () <UITableViewDataSource, UITableViewDelegate, MKMapViewDelegate>
@property (strong, nonatomic) IBOutlet MKMapView *mapKitView;
@property (weak, nonatomic) IBOutlet UITableView *tableView;
@property (nonatomic, strong) SearchInteractor* searchInteractor;
//@property (nonatomic, strong)
@end

@implementation SearchViewController
- (instancetype)initWithInteractor:(SearchInteractor*)interactor
{
    self = [super init];
    if (self) {
        _searchInteractor = interactor;
        _searchInteractor.showErrorMessage = ^(NSString * _Nonnull title, NSString * _Nonnull message) {
            NSLog(@"%@ %@",title,message);
        };
    }
    return self;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    [self.tableView registerNib:[UINib nibWithNibName:[SearchTableViewCell reusableId] bundle:[NSBundle mainBundle]] forCellReuseIdentifier:[SearchTableViewCell reusableId]];
    
    [self.tableView setDelegate:self];
    [self.tableView setDataSource:self];
    [self.navigationController setNavigationBarHidden:YES animated:YES];}

- (void)viewDidLayoutSubviews {
    [super viewDidLayoutSubviews];
}


#pragma mark - UITableViewDataSource

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return 4;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    SearchTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:[SearchTableViewCell reusableId] forIndexPath:indexPath];
    [cell.titleTextLabel setText:@"Title"];
    [cell.detailTextLabel setText:@"Description"];
    return cell;
}

-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    
}


@end

