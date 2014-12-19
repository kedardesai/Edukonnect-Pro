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
    
    self.configMenusArray = [[NSMutableArray alloc] initWithObjects:@"Edu Profile", @"Switch Child", @"School Info", @"Facebook", @"Twitter", @"Google +", nil];
    
    self.tableView = [[UITableView alloc] initWithFrame:CGRectMake(0, 0, 150, 264)];
    self.tableView.delegate = self;
    self.tableView.dataSource = self;
    
    self.navigationItem.rightBarButtonItem = [[UIBarButtonItem alloc] initWithTitle:@"Settings" style:UIBarButtonItemStylePlain target:self action:@selector(showExtraMenus:)];
    
    [self.eduResourcesWebView setOpaque:NO];
    [self.eduResourcesWebView setBackgroundColor:[UIColor loadScreenBackgroundColor]];
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
    if (self.menuTabs.selectedSegmentIndex == 0) {
        return 6;
        
    } else {
        return 5;
    }
}

- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath
{
    EKPMenuCollectionViewCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:@"DashboardMenuCollectionViewCell" forIndexPath:indexPath];
    
    EKPDashboardMenus dashboardMenu;
    if (self.menuTabs.selectedSegmentIndex == 0) {
        dashboardMenu = (EKPDashboardMenus) indexPath.row;
    } else {
        dashboardMenu = (EKPDashboardMenus) indexPath.row + 6;
    }
    
    cell.ekpDashboardMenu = dashboardMenu;
    
    return cell;
}


#pragma mark UICollectionViewDelegate Methods

- (void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath
{
    EKPMenuCollectionViewCell *cell = (EKPMenuCollectionViewCell *) [collectionView cellForItemAtIndexPath:indexPath];
    switch (cell.ekpDashboardMenu) {
        case kEKPDashboardMenuNoticeBoard:
            [self performSegueWithIdentifier:@"DashboardToNoticeListSegue" sender:self];
            break;
            
        case kEKPDashboardMenuAlert:
            [self performSegueWithIdentifier:@"DashboardToAlertSegue" sender:self];
            break;
            
        case kEKPDashboardMenuEvent:
            [self performSegueWithIdentifier:@"DashboardToEventListSegue" sender:self];
            break;
            
        case kEKPDashboardMenuResult:
            [self performSegueWithIdentifier:@"DashboardToExamListSegue" sender:self];
            break;
            
        case kEKPDashboardMenuTimeTable:
            [self performSegueWithIdentifier:@"DashboardToTimetableSegue" sender:self];
            break;
            
        case kEKPDashboardMenuGallary:
            [self performSegueWithIdentifier:@"DashboardToGalleryListSegue" sender:self];
            break;
            
        case kEKPDashboardMenuEduSen:
            [self performSegueWithIdentifier:@"DashboardToEduSenSegue" sender:self];
            break;
            
        case kEKPDashboardMenuLibrary:
            [self performSegueWithIdentifier:@"DashboardToLibrarySegue" sender:self];
            break;
            
        case kEKPDashboardMenuTransport:
            [self performSegueWithIdentifier:@"DashboardToTransportSegue" sender:self];
            break;
            
        case kEKPDashboardMenuBoarding:
            [self performSegueWithIdentifier:@"DashboardToBoardingSegue" sender:self];
            break;
            
        case kEKPDashboardMenuPayment:
            NSLog(@"Show Payment.");
            break;
            
        default:
            NSLog(@"Show Default Image.");
            break;
    }
}

#pragma mark UISegmentedControl Action Method

- (void)eduTabSelected:(UISegmentedControl *)segmentedControl
{
    if (segmentedControl.selectedSegmentIndex == 0) { // For Edu Notice
        [self.eduResourcesWebView setHidden:YES];
        [self.dashboardMenuCollectionView setHidden:NO];
        [self.dashboardMenuCollectionView reloadData];
        
    } else if (segmentedControl.selectedSegmentIndex == 1) { // For Edu Menu
        [self.eduResourcesWebView setHidden:YES];
        [self.dashboardMenuCollectionView setHidden:NO];
        [self.dashboardMenuCollectionView reloadData];
        
    } else if (segmentedControl.selectedSegmentIndex == 2) { // For Edu Resources
        [self.eduResourcesWebView setHidden:NO];
        [self.dashboardMenuCollectionView setHidden:YES];
        EKPStudent *currentStudent = [EKPSingleton loadStudent];
        NSLog(@"URL ::: %@",[NSString stringWithFormat:@"%@eduresources/%@username=%@&password=%@", BASE_API_URL, LOGIN_API_URL, currentStudent.studentUsername, currentStudent.studentPassword]);
        [self.eduResourcesWebView loadRequest:[NSURLRequest requestWithURL:[NSURL URLWithString:[NSString stringWithFormat:@"%@eduresources/%@username=%@&password=%@", BASE_API_URL, LOGIN_API_URL, currentStudent.studentUsername, currentStudent.studentPassword]]]];
    }
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
    [self performSegueWithIdentifier:@"DashboardToSwitchUserSegue" sender:self];
}

- (void)showEduProfile
{
    // Show Edu Profile Page
    [self performSegueWithIdentifier:@"DashboardToEduProfileSegue" sender:self];
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

#pragma mark UIWebViewDelegate Methods

- (void)webViewDidFinishLoad:(UIWebView *)webView
{
    NSLog(@"Loaded successfully.");
}

- (void)webView:(UIWebView *)webView didFailLoadWithError:(NSError *)error
{
    NSLog(@"Failed with ERROR ::: %@",[error localizedDescription]);
}


@end
