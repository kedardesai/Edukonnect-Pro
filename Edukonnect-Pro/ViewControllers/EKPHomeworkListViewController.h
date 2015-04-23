//
//  EKPHomeworkListViewController.h
//  Edukonnect-Pro
//
//  Created by Edupsyche on 4/23/15.
//  Copyright (c) 2015 Kedar Desai. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface EKPHomeworkListViewController : UIViewController <UITableViewDataSource, UITableViewDelegate>

@property (nonatomic, strong) IBOutlet UITableView *tableView;

@property (nonatomic, strong) NSMutableArray *dataArray;

@property (nonatomic) NSInteger pageId;

@end
