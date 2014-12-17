//
//  EKPLibraryViewController.h
//  Edukonnect-Pro
//
//  Created by Edupsyche on 12/18/14.
//  Copyright (c) 2014 Kedar Desai. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface EKPLibraryViewController : UIViewController <UITableViewDataSource, UITableViewDelegate>

@property (nonatomic, strong) IBOutlet UITableView *libraryMenuListTableView;

@property (nonatomic, strong) NSMutableArray *libraryMenuListArray;

@end
