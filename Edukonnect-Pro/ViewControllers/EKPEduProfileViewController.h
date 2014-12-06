//
//  EKPEduProfileViewController.h
//  Edukonnect-Pro
//
//  Created by Edupsyche on 12/6/14.
//  Copyright (c) 2014 Kedar Desai. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "KDTextField.h"
#import "EKPStudent.h"
#import "EKPUser.h"
#import "EKPProfile.h"

@interface EKPEduProfileViewController : UIViewController <KDTextFieldDelegate, UITextFieldDelegate, UIScrollViewDelegate>

@property (nonatomic, strong) IBOutlet UIScrollView *parentScrollView;

@property (nonatomic, strong) IBOutlet UILabel *schoolCodeLabel;
@property (nonatomic, strong) IBOutlet KDTextField *schoolCodeTextField;

@property (nonatomic, strong) IBOutlet UILabel *grNoLabel;
@property (nonatomic, strong) IBOutlet KDTextField *grNoTextField;

@property (nonatomic, strong) IBOutlet UILabel *parentNameLabel;
@property (nonatomic, strong) IBOutlet KDTextField *parentNameTextField;

@property (nonatomic, strong) IBOutlet UILabel *passwordLabel;
@property (nonatomic, strong) IBOutlet KDTextField *passwordTextField;

@property (nonatomic, strong) IBOutlet UILabel *confirmPasswordLabel;
@property (nonatomic, strong) IBOutlet KDTextField *confirmPasswordTextField;

@property (nonatomic, strong) IBOutlet UILabel *relationLabel;
@property (nonatomic, strong) IBOutlet KDTextField *relationTextField;

@property (nonatomic, strong) IBOutlet UILabel *contactNoLabel;
@property (nonatomic, strong) IBOutlet KDTextField *contactNoTextField;

@property (nonatomic, strong) IBOutlet UILabel *addressLabel;
@property (nonatomic, strong) IBOutlet KDTextField *addressTextField;

@property (nonatomic, strong) IBOutlet UILabel *professionLabel;
@property (nonatomic, strong) IBOutlet KDTextField *professionTextField;

@property (nonatomic, strong) IBOutlet UIButton *updateButton;

@property (nonatomic, strong) EKPStudent *currentStudent;
@property (nonatomic, strong) EKPUser *currentUser;
@property (nonatomic, strong) EKPProfile *currentProfile;

- (IBAction)updateButtonClicked:(id)sender;

@end
