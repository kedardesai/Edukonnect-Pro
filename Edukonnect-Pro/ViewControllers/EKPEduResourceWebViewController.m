//
//  EKPEduResourceWebViewController.m
//  Edukonnect-Pro
//
//  Created by Edupsyche on 4/4/15.
//  Copyright (c) 2015 Kedar Desai. All rights reserved.
//

#import "EKPEduResourceWebViewController.h"

@interface EKPEduResourceWebViewController ()

@property (nonatomic, strong) NSURL *url;

@end

@implementation EKPEduResourceWebViewController


#pragma mark UIViewLifeCycle Methods

- (void)viewDidLoad
{
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    self.navigationController.navigationBar.topItem.title = @"";
    [self.view setBackgroundColor:[UIColor loadScreenBackgroundColor]];
    [self.webView setBackgroundColor:[UIColor loadScreenBackgroundColor]];
}

- (void)viewWillAppear:(BOOL)animated
{
    switch (_selectedMenu) {
        case kEKPDashboardMenuParenting:
            self.url = [NSURL URLWithString:EFFECTIVE_PARENTING_URL];
            self.title = [NSString stringWithFormat:@"Effective Parenting"];
            break;
            
        case kEKPDashboardMenuBehavioralIssue:
            self.url = [NSURL URLWithString:BEHAVIOURAL_ISSUES_URL];
            self.title = [NSString stringWithFormat:@"Behavioural Issues"];
            break;
            
        case kEKPDashboardMenuLocator:
            self.url = [NSURL URLWithString:LOCATOR_URL];
            self.title = [NSString stringWithFormat:@"Locator"];
            break;
            
        case kEKPDashboardMenuPersonCareerCounselling:
            self.url = [NSURL URLWithString:CAREER_COUNSELING_URL];
            self.title = [NSString stringWithFormat:@"Career Counseling"];
            break;
            
        case kEKPDashboardMenuKnowledgeCorner:
            self.url = [NSURL URLWithString:KNOWLEDGE_CENTRE_URL];
            self.title = [NSString stringWithFormat:@"Knowledge Corner"];
            break;
            
        case kEKPDashboardMenuComingSoon:
            [EKPUtility showAlertWithTitle:@"Coming Soon..." andMessage:nil withDelegate:self];
//            self.url = [NSURL URLWithString:KNOWLEDGE_CENTRE_URL];
//            self.title = [NSString stringWithFormat:@"Knowledge Corner"];
            break;
            
        default:
            break;
    }
    
    if (_selectedMenu != kEKPDashboardMenuComingSoon) {
        [self.webView loadRequest:[[NSURLRequest alloc] initWithURL:self.url]];
    }
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


#pragma mark UIWebViewDelegate Methods

- (void)webViewDidFinishLoad:(UIWebView *)webView
{
    NSLog(@"Loaded Succesfully...");
    
//    webView
}

- (void)webView:(UIWebView *)webView didFailLoadWithError:(NSError *)error
{
    NSLog(@"ERROR ::: %@",[error localizedDescription]);
}


#pragma mark UIAlertViewDelegate Methods

- (void)alertView:(UIAlertView *)alertView clickedButtonAtIndex:(NSInteger)buttonIndex
{
    [self.navigationController popViewControllerAnimated:YES];
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
