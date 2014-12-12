//
//  EKPTimetableViewController.h
//  Edukonnect-Pro
//
//  Created by Edupsyche on 12/12/14.
//  Copyright (c) 2014 Kedar Desai. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface EKPTimetableViewController : UIViewController

@property (nonatomic, strong) IBOutlet UITableView *timeTableDayListTableView;

@property (nonatomic, strong) NSMutableDictionary *timeTableDayListDict;

@end
