//
//  EKPRegistrationViewController.h
//  Edukonnect-Pro
//
//  Created by Dinesh Panwar on 29/09/14.
//  Copyright (c) 2014 Kedar Desai. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface EKPRegistrationViewController : UIViewController <UITableViewDataSource, UITableViewDelegate>

@property (nonatomic, strong) IBOutlet UITableView *registrationTableView;
@property (nonatomic, strong) IBOutlet UIView *registrationTableHeaderView;

@end
