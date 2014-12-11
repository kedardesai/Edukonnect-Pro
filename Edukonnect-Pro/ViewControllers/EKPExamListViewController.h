//
//  EKPExamListViewController.h
//  Edukonnect-Pro
//
//  Created by Edupsyche on 12/12/14.
//  Copyright (c) 2014 Kedar Desai. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface EKPExamListViewController : UIViewController <UITableViewDataSource, UITableViewDelegate>

@property (nonatomic, strong) IBOutlet UITableView *examListTableView;

@property (nonatomic, strong) NSMutableArray *examListArray;

@property (nonatomic, strong) NSString *selectedExamId;

@end
