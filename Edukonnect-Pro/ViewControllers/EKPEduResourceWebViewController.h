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

@end
