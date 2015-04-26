//
//  EKPEduSenViewController.h
//  Edukonnect-Pro
//
//  Created by Edupsyche on 12/15/14.
//  Copyright (c) 2014 Kedar Desai. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface EKPEduSenViewController : UIViewController <UIWebViewDelegate>

@property (nonatomic, strong) IBOutlet UIWebView *webView;

@property (nonatomic, strong) IBOutlet UIBarButtonItem *backBtn;
@property (nonatomic, strong) IBOutlet UIBarButtonItem *stopBtn;
@property (nonatomic, strong) IBOutlet UIBarButtonItem *refreshBtn;
@property (nonatomic, strong) IBOutlet UIBarButtonItem *forwardBtn;

@end
