//
//  EKPBookListViewController.h
//  Edukonnect-Pro
//
//  Created by Edupsyche on 12/19/14.
//  Copyright (c) 2014 Kedar Desai. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface EKPBookListViewController : UIViewController <UITableViewDataSource, UITableViewDelegate>

@property (nonatomic, strong) IBOutlet UITableView *bookListTableView;

@property (nonatomic, strong) NSMutableDictionary *bookListDict;

@property (nonatomic, strong) NSMutableArray *bookListArray;

@property (nonatomic) NSInteger pageId;
@property (nonatomic) NSInteger bookListType;
@property (nonatomic) BOOL isNextPageAvailable;
@property (nonatomic) BOOL isFirstLoad;

@end
