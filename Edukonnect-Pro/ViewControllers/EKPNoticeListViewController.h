//
//  EKPNoticeListViewController.h
//  Edukonnect-Pro
//
//  Created by Edupsyche on 12/7/14.
//  Copyright (c) 2014 Kedar Desai. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface EKPNoticeListViewController : UIViewController <UITableViewDataSource, UITableViewDelegate>

@property (nonatomic, strong) IBOutlet UITableView *noticeListTableView;

@property (nonatomic, strong) NSMutableArray *noticeListArray;

@end
