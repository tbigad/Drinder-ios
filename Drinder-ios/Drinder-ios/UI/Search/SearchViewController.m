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
@property (strong, nonatomic) IBOutlet UIActivityIndicatorView *activityIndicator;
@property (nonatomic, strong) SearchInteractor* searchInteractor;
@end

@implementation SearchViewController
- (instancetype)initWithInteractor:(SearchInteractor*)interactor
{
    self = [super init];
    if (self) {
        __weak typeof(self)weakSelf = self;
        _searchInteractor = interactor;
        _searchInteractor.showErrorMessage = ^(NSString * _Nonnull title, NSString * _Nonnull message) {
            NSLog(@"%@ %@",title,message);
        };
        
        _searchInteractor.usersUpdated = ^{
            [weakSelf fillMap];
        };
    }
    return self;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self.tableView registerNib:[UINib nibWithNibName:[SearchTableViewCell reusableId] bundle:[NSBundle mainBundle]] forCellReuseIdentifier:[SearchTableViewCell reusableId]];
    
    [self.tableView setDelegate:self];
    [self.tableView setDataSource:self];
    [self.mapKitView setUserTrackingMode:MKUserTrackingModeFollow];
    [self.mapKitView setScrollEnabled:NO];
    [self.mapKitView setDelegate:self];
    [self.mapKitView registerClass:[MKMarkerAnnotationView class] forAnnotationViewWithReuseIdentifier:NSStringFromClass([MKMarkerAnnotationView class])];
}

- (void)viewDidLayoutSubviews {
    [super viewDidLayoutSubviews];
}

- (void)viewWillAppear:(BOOL)animated {
    [self.navigationController setNavigationBarHidden:YES animated:YES];
    [super viewWillAppear:animated];
    [self.searchInteractor checkLocationAuthorization];
    [self.activityIndicator startAnimating];
    [self.tableView reloadData];
}

#pragma mark - UITableViewDataSource

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return 4;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    SearchTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:[SearchTableViewCell reusableId] forIndexPath:indexPath];
    switch (indexPath.row) {
        case 0:
            [cell.titleTextLabel setText:@"My name"];
            [cell.descriptionTextLabel setText:[self.searchInteractor userName]];
            break;
        case 1:
            [cell.titleTextLabel setText:@"My alcohol"];
            [cell.descriptionTextLabel setText:[self.searchInteractor userAlcohol]];
            break;
        case 2:
            [cell.titleTextLabel setText:@"My gender"];
            [cell.descriptionTextLabel setText:[self.searchInteractor userGender]];
            break;
        case 3:
            [cell.titleTextLabel setText:@"My age"];
            [cell.descriptionTextLabel setText:[self.searchInteractor userAge]];
            break;
        default:
            break;
    }
    return cell;
}

-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    self.openEdit(indexPath.row);
    [self.tableView deselectRowAtIndexPath:indexPath animated:NO];
}

#pragma mark - Methods from inteactor
-(void) fillMap {
    CLLocationCoordinate2D center = [self.searchInteractor userCoordinate];
    [self.mapKitView setCenterCoordinate:center animated:YES];
    [self.mapKitView addAnnotations:self.searchInteractor.mapAnatation];
    [self.activityIndicator stopAnimating];
}

#pragma mark - MapKit Delegate

- (MKAnnotationView *)mapView:(MKMapView *)mapView viewForAnnotation:(id<MKAnnotation>)annotation {
    MKMarkerAnnotationView *marker = (MKMarkerAnnotationView *)[mapView dequeueReusableAnnotationViewWithIdentifier:NSStringFromClass([MKMarkerAnnotationView class])];
    [marker setAnimatesWhenAdded:YES];
    [marker setCanShowCallout:YES];
    UIButton *btn = [UIButton buttonWithType:UIButtonTypeInfoLight];
    marker.rightCalloutAccessoryView = btn;
    return marker;
}

- (void)mapView:(MKMapView *)mapView annotationView:(MKAnnotationView *)view calloutAccessoryControlTapped:(UIControl *)control {
    if([view.annotation isKindOfClass:[MKPointAnnotation class]]) {
        MKPointAnnotation *tapped = (MKPointAnnotation*)view.annotation;
        NearestUserData* user = [self.searchInteractor didTapOnAnototation:tapped];
        if(user){
            self.showDetail(user);
        }
    }
}

-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    return 80;
}
@end

