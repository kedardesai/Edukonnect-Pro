//
//  EKPDormitoriesViewController.h
//  Edukonnect-Pro
//
//  Created by Edupsyche on 12/17/14.
//  Copyright (c) 2014 Kedar Desai. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface EKPDormitoriesViewController : UIViewController <UITableViewDataSource, UITableViewDelegate>

@property (nonatomic, strong) IBOutlet UITableView *dormitoriesListTableView;

@property (nonatomic, strong) NSMutableArray *dormitoriesListArray;

@property (nonatomic) NSInteger pageId;
@property (nonatomic) BOOL isNextPageAvailable;
@property (nonatomic) BOOL isFirstLoad;


@end
