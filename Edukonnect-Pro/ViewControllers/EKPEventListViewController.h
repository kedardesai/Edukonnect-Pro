//
//  EKPEventListViewController.h
//  Edukonnect-Pro
//
//  Created by Edupsyche on 12/9/14.
//  Copyright (c) 2014 Kedar Desai. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface EKPEventListViewController : UIViewController <UITableViewDataSource, UITableViewDelegate>

@property (nonatomic, strong) NSMutableArray *eventListArray;

@property (nonatomic, strong) IBOutlet UITableView *eventListTableView;

@property (nonatomic) NSInteger pageId;
@property (nonatomic) BOOL isNextPageAvailable;
@property (nonatomic) BOOL isFirstLoad;

@property (nonatomic, strong) NSIndexPath *selectedIndexPath;

@end
