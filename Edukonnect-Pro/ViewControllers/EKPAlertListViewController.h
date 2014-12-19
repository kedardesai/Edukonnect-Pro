//
//  EKPAlertListViewController.h
//  Edukonnect-Pro
//
//  Created by Edupsyche on 12/20/14.
//  Copyright (c) 2014 Kedar Desai. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface EKPAlertListViewController : UIViewController <UITableViewDataSource, UITableViewDelegate>

@property (nonatomic, strong) IBOutlet UITableView *alertListTableView;

@property (nonatomic, strong) NSMutableArray *alertListArray;

@property (nonatomic) NSInteger pageId;

@property (nonatomic) BOOL isNextPageAvailable;

@property (nonatomic) BOOL isFirstLoad;

@end
