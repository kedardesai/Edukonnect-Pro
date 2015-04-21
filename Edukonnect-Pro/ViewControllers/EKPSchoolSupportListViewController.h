//
//  EKPSchoolSupportListViewController.h
//  Edukonnect-Pro
//
//  Created by Edupsyche on 4/19/15.
//  Copyright (c) 2015 Kedar Desai. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface EKPSchoolSupportListViewController : UIViewController <UITableViewDataSource, UITableViewDelegate>

@property (nonatomic, strong) IBOutlet UITableView *tableView;

@property (nonatomic, strong) IBOutlet UIButton *addQueryBtn;

@property (nonatomic, strong) NSMutableArray *dataArray;

@property (nonatomic) NSInteger pageId;

- (IBAction)addQueryBtnClicked:(id)sender;

@end
