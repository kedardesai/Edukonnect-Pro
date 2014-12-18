//
//  EKPSearchBookViewController.h
//  Edukonnect-Pro
//
//  Created by Edupsyche on 12/19/14.
//  Copyright (c) 2014 Kedar Desai. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "KDTextField.h"

@interface EKPSearchBookViewController : UIViewController <KDTextFieldDelegate, UITextFieldDelegate>

@property (nonatomic, strong) IBOutlet KDTextField *keywordTextField;

@property (nonatomic, strong) IBOutlet UILabel *keywordLabel;

@property (nonatomic, strong) IBOutlet UIButton *searchBtn;

@property (nonatomic) NSInteger bookListType;

- (IBAction)searchBtnClicked:(id)sender;

@end
