//
//  EKPEduResourceWebViewController.h
//  Edukonnect-Pro
//
//  Created by Edupsyche on 4/4/15.
//  Copyright (c) 2015 Kedar Desai. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface EKPEduResourceWebViewController : UIViewController <UIWebViewDelegate, UIAlertViewDelegate>

@property (nonatomic) EKPDashboardMenus selectedMenu;

@property (nonatomic, strong) IBOutlet UIWebView *webView;

@property (nonatomic, strong) IBOutlet UIBarButtonItem *backBtn;
@property (nonatomic, strong) IBOutlet UIBarButtonItem *stopBtn;
@property (nonatomic, strong) IBOutlet UIBarButtonItem *refreshBtn;
@property (nonatomic, strong) IBOutlet UIBarButtonItem *forwardBtn;

@property (nonatomic, strong) NSString *refreshUrlString;

@end
