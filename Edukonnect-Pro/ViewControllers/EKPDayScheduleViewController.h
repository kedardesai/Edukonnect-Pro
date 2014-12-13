//
//  EKPDayScheduleViewController.h
//  Edukonnect-Pro
//
//  Created by Edupsyche on 12/13/14.
//  Copyright (c) 2014 Kedar Desai. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface EKPDayScheduleViewController : UIViewController <UITableViewDataSource, UITableViewDelegate>

@property (nonatomic, strong) NSMutableArray *dayScheduleArray;

@property (nonatomic, strong) IBOutlet UITableView *dayScheduleTableView;

@end
