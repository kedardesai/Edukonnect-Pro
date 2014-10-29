//
//  EKPRegistrationViewController.h
//  Edukonnect-Pro
//
//  Created by Dinesh Panwar on 29/09/14.
//  Copyright (c) 2014 Kedar Desai. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "KDTextField.h"

@interface EKPRegistrationViewController : UIViewController <KDTextFieldDelegate, UITextFieldDelegate>

@property (nonatomic, strong) IBOutlet UILabel *nameLabel;
@property (nonatomic, strong) IBOutlet UILabel *mobileLabel;
@property (nonatomic, strong) IBOutlet UILabel *emailLabel;
@property (nonatomic, strong) IBOutlet KDTextField *nameTextField;
@property (nonatomic, strong) IBOutlet KDTextField *mobileTextField;
@property (nonatomic, strong) IBOutlet KDTextField *emailTextField;
@property (nonatomic, strong) IBOutlet UIButton *registrationBtn;


@end
