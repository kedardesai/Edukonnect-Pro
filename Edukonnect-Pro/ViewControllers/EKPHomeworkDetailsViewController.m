//
//  EKPHomeworkDetailsViewController.m
//  Edukonnect-Pro
//
//  Created by Edupsyche on 4/23/15.
//  Copyright (c) 2015 Kedar Desai. All rights reserved.
//

#import "EKPHomeworkDetailsViewController.h"

@interface EKPHomeworkDetailsViewController ()

@end

@implementation EKPHomeworkDetailsViewController


#pragma mark UIViewLifeCycle Methods

- (void)viewDidLoad
{
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    NSURL *url = [NSURL URLWithString:_urlString];
    NSURLRequest *urlRequest = [NSURLRequest requestWithURL:url];
    [_webView loadRequest:urlRequest];
}

- (void)viewWillAppear:(BOOL)animated
{
    self.navigationController.navigationBar.topItem.title = @"";
    self.title = [NSString stringWithFormat:@"%@", HOMEWORK_SCREEN_TITLE];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


#pragma mark UIWebViewDelegate Methods

- (void)webViewDidStartLoad:(UIWebView *)webView
{
    [MBProgressHUD showHUDAddedTo:self.view animated:YES];
}

- (void)webViewDidFinishLoad:(UIWebView *)webView
{
    NSLog(@"Finish Loading...");
    [MBProgressHUD hideAllHUDsForView:self.view animated:YES];
}

- (void)webView:(UIWebView *)webView didFailLoadWithError:(NSError *)error
{
    NSLog(@"ERROR ::: %@", [error localizedDescription]);
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
