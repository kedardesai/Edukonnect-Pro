//
//  EKPDashboardViewController.m
//  Edukonnect-Pro
//
//  Created by Dinesh Panwar on 01/10/14.
//  Copyright (c) 2014 Kedar Desai. All rights reserved.
//

#import "EKPDashboardViewController.h"
#import "EKPMenuCollectionViewCell.h"
#import "EKPSchoolInfoViewController.h"
#import "UIViewController+MJPopupViewController.h"

static CGFloat randomFloatBetweenLowAndHigh(CGFloat low, CGFloat high)
{
    CGFloat diff = high - low;
    return (((CGFloat) rand() / RAND_MAX) * diff) + low;
}

@interface EKPDashboardViewController ()<UITableViewDataSource, UITableViewDelegate>
{
    CGFloat _popoverWidth;
//    CGSize _popoverArrowSize;
//    CGFloat _popoverCornerRadius;
//    CGFloat _animationIn;
//    CGFloat _animationOut;
//    BOOL _animationSpring;
}

- (void)eduTabSelected:(UISegmentedControl *)segmentedControl;
- (void)showEduProfile;
- (void)showSwitchUser;
- (void)showSchoolInfo;

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
    
    self.popOver = [DXPopover new];
    _popoverWidth = 150;// CGRectGetWidth(self.view.bounds);
    
    self.configMenusArray = [[NSMutableArray alloc] initWithObjects:@"Edu Profile", @"Switch Child", @"School Info", nil];
    
    self.tableView = [[UITableView alloc] initWithFrame:CGRectMake(0, 0, 150, 132)];
    self.tableView.delegate = self;
    self.tableView.dataSource = self;
    
    self.navigationItem.rightBarButtonItem = [[UIBarButtonItem alloc] initWithTitle:@"Reset" style:UIBarButtonItemStylePlain target:self action:@selector(showExtraMenus:)];
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
    [self.menuTabs setBackgroundColor:[UIColor loadScreenBackgroundColor]];
    [self.menuTabs addTarget:self action:@selector(eduTabSelected:) forControlEvents:UIControlEventValueChanged];
    
    [[UISegmentedControl appearance] setTintColor:[UIColor loadComponentNormalColor]];
    
    NSMutableDictionary *textAttributes = [[NSMutableDictionary alloc] initWithObjects:[NSArray arrayWithObjects:[UIFont loadHelveticaNueueRegular17], [UIColor loadComponentNormalColor], nil] forKeys:[NSArray arrayWithObjects:NSFontAttributeName, NSForegroundColorAttributeName, nil]];
    [[UISegmentedControl appearance] setTitleTextAttributes:textAttributes forState:UIControlStateNormal];
    
    NSDictionary *highlightedAttributes = [NSDictionary dictionaryWithObject:[UIColor whiteColor] forKey:NSForegroundColorAttributeName];
    [[UISegmentedControl appearance] setTitleTextAttributes:highlightedAttributes forState:UIControlStateHighlighted];

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
    
//    cell.backgroundColor = [UIColor loadScreenBackgroundColor];
//    cell.menuIcon = // Set Image Icon here
    
    return cell;
}


#pragma mark UICollectionViewDelegate Methods

- (void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath
{
    NSLog(@"Selected CollectionViewCell : %ld", indexPath.row);
}

#pragma mark UISegmentedControl Action Method

- (void)eduTabSelected:(UISegmentedControl *)segmentedControl
{
}

#pragma mark IBAction Methods

- (void)showSchoolInfo
{
    EKPSchoolInfoViewController *aboutUsVC = [[EKPSchoolInfoViewController alloc] initWithNibName:@"EKPSchoolInfoViewController" bundle:nil];
    [self presentPopupViewController:aboutUsVC animationType:MJPopupViewAnimationFade];
}

- (void)showSwitchUser
{
    // Show Switch User Page
}

- (void)showEduProfile
{
    // Show Edu Profile Page
}

- (void)showExtraMenus:(id)sender
{
    UIBarButtonItem *settingButton = (UIBarButtonItem *)sender;
    [self updateTableViewFrame];
    UIView *settingView = [settingButton valueForKey:@"view"];
    CGPoint startPoint = CGPointMake(CGRectGetMidX(settingView.frame), CGRectGetMaxY(settingView.frame) + 20);
    
    [self.tableView reloadData];
    [self.popOver showAtPoint:startPoint popoverPostion:DXPopoverPositionDown withContentView:self.tableView inView:self.navigationController.view];
    __weak typeof(self)weakSelf = self;
    self.popOver.didDismissHandler = ^{
        [weakSelf bounceTargetView:settingView];
    };
}

#pragma mark UITableViewDelegate and UITableViewDatasource Methods

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return [self.configMenusArray count];
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *cellId = @"cellIdentifier";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:cellId];
    if (!cell) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:cellId];
    }
    cell.textLabel.text = self.self.configMenusArray[indexPath.row];
    
    return cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    [self.popOver dismiss];
    
    // check Which option got selected
    switch (indexPath.row) {
        case 0:
            [self showEduProfile];
            break;
            
        case 1:
            [self showSwitchUser];
            break;
            
        case 2:
            [self showSchoolInfo];
            break;
            
        default:
            break;
    }
}

#pragma mark Code Reusable Methods

- (void)updateTableViewFrame
{
    CGRect tableViewFrame = self.tableView.frame;
    tableViewFrame.size.width = _popoverWidth;
    self.tableView.frame = tableViewFrame;
}

- (void)bounceTargetView:(UIView *)targetView
{
    [UIView animateWithDuration:0.1 animations:^{
        targetView.transform = CGAffineTransformMakeScale(0.9, 0.9);
    } completion:^(BOOL finished) {
        [UIView animateWithDuration:0.1 animations:^{
            targetView.transform = CGAffineTransformMakeScale(1.1, 1.1);
        } completion:^(BOOL finished) {
            [UIView animateWithDuration:0.1 animations:^{
                targetView.transform = CGAffineTransformIdentity;
            } completion:^(BOOL finished) {
                
            }];
        }];
    }];
}


@end
