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
#import "UIImageView+AFNetworking.h"

//static CGFloat randomFloatBetweenLowAndHigh(CGFloat low, CGFloat high)
//{
//    CGFloat diff = high - low;
//    return (((CGFloat) rand() / RAND_MAX) * diff) + low;
//}

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
- (void)showFBLink;
- (void)showGooglePlusLink;
- (void)showTwitterLink;

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
    self.navigationController.navigationItem.hidesBackButton = YES;
    
    self.popOver = [DXPopover new];
    _popoverWidth = 150;// CGRectGetWidth(self.view.bounds);
    
    self.configMenusArray = [[NSMutableArray alloc] initWithObjects:@"Edu Profile", @"Switch Child", @"School Info", @"Facebook", @"Twitter", @"Google +", nil];
    
    self.tableView = [[UITableView alloc] initWithFrame:CGRectMake(0, 0, 150, 264)];
    self.tableView.delegate = self;
    self.tableView.dataSource = self;
    
    UIButton *backBtn = [UIButton buttonWithType:UIButtonTypeCustom];
    UIImage *backBtnImage = [UIImage imageNamed:@"Settings"];
    [backBtn setBackgroundImage:backBtnImage forState:UIControlStateNormal];
    [backBtn addTarget:self action:@selector(showExtraMenus:) forControlEvents:UIControlEventTouchUpInside];
    backBtn.frame = CGRectMake(0, 0, 25, 25);
    UIView *backButtonView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, 25, 25)];
    [backButtonView addSubview:backBtn];
    UIBarButtonItem *backButton = [[UIBarButtonItem alloc] initWithCustomView:backButtonView];
    self.navigationItem.rightBarButtonItem = backButton;
    
    [self.eduResourcesWebView setOpaque:NO];
    [self.eduResourcesWebView setBackgroundColor:[UIColor loadScreenBackgroundColor]];
    [self.dashboardMenuCollectionView setBackgroundColor:[UIColor loadScreenBackgroundColor]];
    [self.dashboardMenuCollectionView setBackgroundView:nil];
}

- (void)viewWillAppear:(BOOL)animated
{
    self.title = [NSString stringWithFormat:@"%@", DASHBOARD_SCREEN_TITLE];
    [self.navigationItem setHidesBackButton:YES animated:YES];
    
    EKPStudent *student = [EKPSingleton loadStudent];
    [self.schoolName setText:student.studentSchoolName];
    [self.studentName setText:student.studentName];
    
//    NSData *data = [NSData dataWithContentsOfURL:[NSURL URLWithString:[NSString stringWithFormat:@"http://%@/uploads/logo.png", student.studentBasePath]]];
//    UIImage *logoImage = [UIImage imageWithData:data];
//    [self.schoolLogoImage setImage:logoImage];
    
    [self.schoolLogoImage setImageWithURL:[NSURL URLWithString:[NSString stringWithFormat:@"%@/uploads/logo.png", student.studentBasePath]]];
    [self.schoolLogoImage setContentMode:UIViewContentModeScaleAspectFit];
    NSLog(@"%@",[NSString stringWithFormat:@"%@/uploads/logo.png", student.studentBasePath]);
    
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
    [cell setBackgroundColor:[UIColor clearColor]];
    
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
            [self performSegueWithIdentifier:@"DashboardToPaymentSegue" sender:self];
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
//        [self.eduResourcesWebView loadRequest:[NSURLRequest requestWithURL:[NSURL URLWithString:[NSString stringWithFormat:@"%@eduresources/%@username=%@&password=%@", BASE_API_URL, LOGIN_API_URL, currentStudent.studentUsername, currentStudent.studentPassword]]]];
        [self.eduResourcesWebView loadRequest:[NSURLRequest requestWithURL:[NSURL URLWithString:@"http://www.4parents.mobi/index.php"]]];
    }
}

#pragma mark IBAction Methods

- (void)showSchoolInfo
{
    EKPSchoolInfoViewController *aboutUsVC = [[EKPSchoolInfoViewController alloc] initWithNibName:@"EKPSchoolInfoViewController" bundle:nil];
    EKPStudent *currentStudent = [EKPSingleton loadStudent];
    aboutUsVC.aboutUsData = currentStudent.studentAboutSchool;
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

- (void)showFBLink
{
    EKPStudent *student = [EKPSingleton loadStudent];
    NSLog(@"student.studentFBLink::: %@",student.studentFBLink);
    BOOL isValid = [[UIApplication sharedApplication] openURL:[NSURL URLWithString:student.studentFBLink]];
    if (!isValid) {
        [EKPUtility showAlertWithTitle:ERROR_TITLE andMessage:INVALID_FB_LINK];
    }
}

- (void)showGooglePlusLink
{
    EKPStudent *student = [EKPSingleton loadStudent];
    NSLog(@"student.studentGooglePlusLink::: %@",student.studentGooglePlusLink);
    BOOL isValid = [[UIApplication sharedApplication] openURL:[NSURL URLWithString:student.studentGooglePlusLink]];
    if (!isValid) {
        [EKPUtility showAlertWithTitle:ERROR_TITLE andMessage:INVALID_GOOGLEPLUS_LINK];
    }
}

- (void)showTwitterLink
{
    EKPStudent *student = [EKPSingleton loadStudent];
    NSLog(@"student.studentTwitterLink::: %@",student.studentTwitterLink);
    BOOL isValid = [[UIApplication sharedApplication] openURL:[NSURL URLWithString:student.studentTwitterLink]];
    if (!isValid) {
        [EKPUtility showAlertWithTitle:ERROR_TITLE andMessage:INVALID_TWITTER_LINK];
    }
}

- (void)showExtraMenus:(id)sender
{
    UIBarButtonItem *settingButton = self.navigationItem.rightBarButtonItem;
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
    cell.textLabel.text = self.configMenusArray[indexPath.row];
    
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
            
        case 3:
            [self showFBLink];
            break;
            
        case 4:
            [self showTwitterLink];
            break;
            
        case 5:
            [self showGooglePlusLink];
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
