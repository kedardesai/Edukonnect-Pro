//
//  EKPLoginViewController.h
//  Edukonnect-Pro
//
//  Created by Dinesh Panwar on 30/09/14.
//  Copyright (c) 2014 Kedar Desai. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "KDTextField.h"

@interface EKPLoginViewController : UIViewController <KDTextFieldDelegate, UITextFieldDelegate>

@property (nonatomic, strong) IBOutlet UILabel *schoolCodeLabel;
@property (nonatomic, strong) IBOutlet UILabel *userNameLabel;
@property (nonatomic, strong) IBOutlet UILabel *passwordLabel;
@property (nonatomic, strong) IBOutlet KDTextField *schoolCodeTextField;
@property (nonatomic, strong) IBOutlet KDTextField *userNameTextField;
@property (nonatomic, strong) IBOutlet KDTextField *passwordTextField;
@property (nonatomic, strong) IBOutlet UIButton *loginButton;

@end
