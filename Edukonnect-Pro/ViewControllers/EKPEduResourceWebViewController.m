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

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    switch (_selectedMenu) {
        case kEKPDashboardMenuParenting:
            self.url = [NSURL URLWithString:EFFECTIVE_PARENTING_URL];
            break;
            
        case kEKPDashboardMenuBehavioralIssue:
            self.url = [NSURL URLWithString:BEHAVIOURAL_ISSUES_URL];
            break;
            
        case kEKPDashboardMenuLocator:
            self.url = [NSURL URLWithString:LOCATOR_URL];
            break;
            
        case kEKPDashboardMenuPersonCareerCounselling:
            self.url = [NSURL URLWithString:CAREER_COUNSELING_URL];
            break;
            
        case kEKPDashboardMenuKnowledgeCorner:
            self.url = [NSURL URLWithString:KNOWLEDGE_CENTRE_URL];
            break;
            
        default:
            break;
    }
    
    [self.webView loadRequest:[[NSURLRequest alloc] initWithURL:self.url]];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
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
