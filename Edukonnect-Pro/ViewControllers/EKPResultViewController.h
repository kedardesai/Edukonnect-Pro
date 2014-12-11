//
//  EKPResultViewController.h
//  Edukonnect-Pro
//
//  Created by Edupsyche on 12/12/14.
//  Copyright (c) 2014 Kedar Desai. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface EKPResultViewController : UIViewController <UITableViewDataSource, UITableViewDelegate>

@property (nonatomic, strong) IBOutlet UITableView *resultListTableView;

@property (nonatomic, strong) NSMutableArray *resultListArray;

@property (nonatomic, strong) NSString *examId;

@end
