//
//  EKPEduSenViewController.m
//  Edukonnect-Pro
//
//  Created by Edupsyche on 12/15/14.
//  Copyright (c) 2014 Kedar Desai. All rights reserved.
//

#import "EKPEduSenViewController.h"

@interface EKPEduSenViewController ()

@end

@implementation EKPEduSenViewController

#pragma mark UIViewLifeCycle Methods

- (void)viewDidLoad
{
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    self.navigationController.navigationBar.topItem.title = @"";
    
    [self.view setBackgroundColor:[UIColor loadScreenBackgroundColor]];
    
    [self.webView setOpaque:NO];
    [self.webView setBackgroundColor:[UIColor loadScreenBackgroundColor]];
    
//    EKPStudent *currentStudent = [EKPSingleton loadStudent];
//    [self.webView loadRequest:[NSURLRequest requestWithURL:[NSURL URLWithString:[NSString stringWithFormat:@"%@edusen/%@username=%@&password=%@", BASE_API_URL, LOGIN_API_URL, currentStudent.studentUsername, currentStudent.studentPassword]]]];
    
    [self.webView loadRequest:[NSURLRequest requestWithURL:[NSURL URLWithString:@"http://www.edusen.net.in/index.php"]]];
}

- (void)viewWillAppear:(BOOL)animated
{
    self.title = @"EduSen";
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
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

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
