//
//  EKPLeaveViewController.h
//  Edukonnect-Pro
//
//  Created by Edupsyche on 4/12/15.
//  Copyright (c) 2015 Kedar Desai. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "WYPopoverController.h"

@interface EKPLeaveViewController : UIViewController <UITableViewDataSource, UITableViewDelegate, WYPopoverControllerDelegate>

@property (nonatomic, strong) IBOutlet UITableView *tableView;

@property (nonatomic, strong) IBOutlet UIButton *applyLeaveButton;

@property (nonatomic, strong) NSMutableArray *dataArray;

@property (nonatomic) NSInteger pageId;
@property (nonatomic) BOOL isNextPageAvailable;

- (IBAction)applyLeavesClicked:(UIButton *)applyLeaveButton;

@end
