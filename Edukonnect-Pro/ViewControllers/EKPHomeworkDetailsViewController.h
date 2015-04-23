//
//  EKPHomeworkDetailsViewController.h
//  Edukonnect-Pro
//
//  Created by Edupsyche on 4/23/15.
//  Copyright (c) 2015 Kedar Desai. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface EKPHomeworkDetailsViewController : UIViewController <UIWebViewDelegate>

@property (nonatomic, strong) IBOutlet UIWebView *webView;

@property (nonatomic, strong) NSString *urlString;

@end
