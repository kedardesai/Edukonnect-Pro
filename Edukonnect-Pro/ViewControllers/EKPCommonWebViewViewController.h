//
//  EKPCommonWebViewViewController.h
//  Edukonnect-Pro
//
//  Created by Edupsyche on 3/28/15.
//  Copyright (c) 2015 Kedar Desai. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface EKPCommonWebViewViewController : UIViewController <UIWebViewDelegate>

@property (nonatomic, strong) IBOutlet UIWebView *webView;

@property (nonatomic, strong) IBOutlet UIBarButtonItem *backBtn;
@property (nonatomic, strong) IBOutlet UIBarButtonItem *stopBtn;
@property (nonatomic, strong) IBOutlet UIBarButtonItem *refreshBtn;
@property (nonatomic, strong) IBOutlet UIBarButtonItem *forwardBtn;

@end
