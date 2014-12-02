//
//  EKPDashboardViewController.h
//  Edukonnect-Pro
//
//  Created by Dinesh Panwar on 01/10/14.
//  Copyright (c) 2014 Kedar Desai. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "DXPopover.h"

@interface EKPDashboardViewController : UIViewController <UICollectionViewDataSource, UICollectionViewDelegate>

@property (nonatomic, strong) IBOutlet UIImageView *schoolLogoImage;
@property (nonatomic, strong) IBOutlet UILabel *schoolName;
@property (nonatomic, strong) IBOutlet UILabel *studentName;
@property (nonatomic, strong) IBOutlet UISegmentedControl *menuTabs;
@property (nonatomic, strong) IBOutlet UICollectionView *dashboardMenuCollectionView;
@property (nonatomic, strong) UITableView *tableView;
@property (nonatomic, strong) UIButton *settingBtn;

@property (nonatomic, strong) NSMutableArray *configMenusArray;

@property (nonatomic, strong) DXPopover *popOver;

- (void)showExtraMenus:(id)sender;

@end
