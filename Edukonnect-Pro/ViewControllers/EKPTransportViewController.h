//
//  EKPTransportViewController.h
//  Edukonnect-Pro
//
//  Created by Edupsyche on 12/16/14.
//  Copyright (c) 2014 Kedar Desai. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "EKPTransport.h"

@interface EKPTransportViewController : UIViewController <UITableViewDataSource, UITableViewDelegate, UIGestureRecognizerDelegate>

@property (nonatomic, strong) IBOutlet UITableView *transportListTableView;

@property (nonatomic, strong) NSMutableArray *transportListArray;

@property (nonatomic, strong) EKPTransport *selectedTransportObj;

@end
