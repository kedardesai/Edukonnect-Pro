//
//  EKPGuestInfoViewController.h
//  Edukonnect-Pro
//
//  Created by Edupsyche on 3/31/15.
//  Copyright (c) 2015 Kedar Desai. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface EKPGuestInfoViewController : UIViewController <UITableViewDataSource, UITableViewDelegate>

@property (nonatomic, strong) IBOutlet UITableView *guestFormTableView;

@property (nonatomic, strong) NSMutableArray *dataArray;

@end
