//
//  EKPSwitchUserViewController.h
//  Edukonnect-Pro
//
//  Created by Edupsyche on 12/3/14.
//  Copyright (c) 2014 Kedar Desai. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface EKPSwitchUserViewController : UIViewController <UITableViewDataSource, UITableViewDelegate>

@property (nonatomic, strong) IBOutlet UITableView *studentListTableView;

@end
