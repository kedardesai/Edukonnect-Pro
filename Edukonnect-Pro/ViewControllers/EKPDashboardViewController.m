//
//  EKPDashboardViewController.m
//  Edukonnect-Pro
//
//  Created by Dinesh Panwar on 01/10/14.
//  Copyright (c) 2014 Kedar Desai. All rights reserved.
//

#import "EKPDashboardViewController.h"
#import "EKPMenuCollectionViewCell.h"

@interface EKPDashboardViewController ()

@end

@implementation EKPDashboardViewController

#pragma mark UIViewLifeCycle Methods

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    self.navigationController.navigationBar.topItem.title = @"";
    [self.view setBackgroundColor:[UIColor colorWithPatternImage:[UIImage loadScreenBackgroundImage]]];
}

- (void)viewWillAppear:(BOOL)animated
{
    self.title = [NSString stringWithFormat:@"%@", DASHBOARD_SCREEN_TITLE];
    
    EKPStudent *student = [EKPSingleton loadStudent];
//    [self.schoolLogoImage ] // Set Image
    [self.schoolName setText:student.studentSchoolName];
    [self.studentName setText:student.studentName];
    
    CGRect segmentedControlFrame = self.menuTabs.frame;
    segmentedControlFrame.size.height = 50;
    [self.menuTabs setFrame:segmentedControlFrame];
    [self.menuTabs setTintColor:[UIColor loadComponentNormalBackgroundColor]];
    [self.menuTabs setBackgroundColor:[UIColor loadScreenBackgroundColor]];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


#pragma mark UICollectionViewDatasource Methods

- (NSInteger)numberOfSectionsInCollectionView:(UICollectionView *)collectionView
{
    return 1;
}

- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section
{
    return 10;
}

- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath
{
    EKPMenuCollectionViewCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:@"DashboardMenuCollectionViewCell" forIndexPath:indexPath];
    
//    cell.menuIcon = // Set Image Icon here
    
    return cell;
}


#pragma mark UICollectionViewDelegate Methods

- (void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath
{
    NSLog(@"Selected CollectionViewCell : %ld", indexPath.row);
}

@end
