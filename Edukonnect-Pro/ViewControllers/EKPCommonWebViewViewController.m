//
//  EKPCommonWebViewViewController.m
//  Edukonnect-Pro
//
//  Created by Edupsyche on 3/28/15.
//  Copyright (c) 2015 Kedar Desai. All rights reserved.
//

#import "EKPCommonWebViewViewController.h"

@interface EKPCommonWebViewViewController ()

@property (nonatomic, strong) NSString *urlString;

@end

@implementation EKPCommonWebViewViewController



#pragma mark UIViewLifeCycle Methods

- (void)viewDidLoad
{
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    _urlString = @"http://www.google.co.in";
    
    NSString *userRole = [EKPSingleton loadUserRole];
    if ([userRole isEqualToString:ADMIN_ROLE]) { // For Admin
        EKPStudent *currentStudent = [EKPSingleton loadStudent];
        NSArray *creds = [currentStudent.studentUsername componentsSeparatedByString:@"@"];
        _urlString = [NSString stringWithFormat:@"%@/index.php?login/loginmobi/admin/%@/%@/%@", currentStudent.studentBasePath, creds[0], creds[1], currentStudent.studentPassword];// url for Admin
        
    } else if ([userRole isEqualToString:STUDENT_ROLE]) { // For Student
//        _urlString = // url for Student
        
    } else if ([userRole isEqualToString:GUEST_ROLE]) { // For Guest
//        _urlString = // url for Guest
    }
    
    NSURL *url = [NSURL URLWithString:_urlString];
    NSURLRequest *urlRequest = [NSURLRequest requestWithURL:url];
    [_webView loadRequest:urlRequest];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


#pragma mark UIWebviewDelegate Methods

- (void)webViewDidStartLoad:(UIWebView *)webView
{
    [MBProgressHUD showHUDAddedTo:self.view animated:YES];
}

- (void)webViewDidFinishLoad:(UIWebView *)webView
{
    NSLog(@"Loaded Successfully...");
    [MBProgressHUD hideAllHUDsForView:self.view animated:YES];
}

- (void)webView:(UIWebView *)webView didFailLoadWithError:(NSError *)error
{
    NSLog(@"ERROR in Loading URL ::: %@", [error localizedDescription]);
    [MBProgressHUD hideAllHUDsForView:self.view animated:YES];
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
