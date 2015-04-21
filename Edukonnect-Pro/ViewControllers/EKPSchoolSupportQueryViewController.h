//
//  EKPSchoolSupportQueryViewController.h
//  Edukonnect-Pro
//
//  Created by Edupsyche on 4/19/15.
//  Copyright (c) 2015 Kedar Desai. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "KDTextField.h"

@interface EKPSchoolSupportQueryViewController : UIViewController <KDTextFieldDelegate, UITextFieldDelegate>

@property (nonatomic, strong) IBOutlet KDTextField *questionTextField;

@property (nonatomic, strong) IBOutlet UIButton *submitBtn;

- (IBAction)submitBtnClicked:(id)sender;

@end
