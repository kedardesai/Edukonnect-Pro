//
//  EKPLeaveAppicationViewController.h
//  Edukonnect-Pro
//
//  Created by Edupsyche on 4/17/15.
//  Copyright (c) 2015 Kedar Desai. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "KDTextField.h"

@interface EKPLeaveAppicationViewController : UIViewController <KDTextFieldDelegate, UITextFieldDelegate>

@property (nonatomic, strong) IBOutlet KDTextField *leaveStartDay;
@property (nonatomic, strong) IBOutlet KDTextField *leaveStartMonth;
@property (nonatomic, strong) IBOutlet KDTextField *leaveStartYear;

@property (nonatomic, strong) IBOutlet KDTextField *leaveEndDay;
@property (nonatomic, strong) IBOutlet KDTextField *leaveEndMonth;
@property (nonatomic, strong) IBOutlet KDTextField *leaveEndYear;

@property (nonatomic, strong) IBOutlet UILabel *leaveTypeLabel;
@property (nonatomic, strong) IBOutlet UISwitch *leaveTypeSwitch;
@property (nonatomic, strong) IBOutlet KDTextField *leaveNote;

@property (nonatomic, strong) IBOutlet UIButton *submitBtn;


- (IBAction)submitBtnClicked:(id)senderBtn;

@end
