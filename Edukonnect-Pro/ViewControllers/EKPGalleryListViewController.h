//
//  EKPGalleryListViewController.h
//  Edukonnect-Pro
//
//  Created by Edupsyche on 12/13/14.
//  Copyright (c) 2014 Kedar Desai. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "MWPhotoBrowser.h"

@interface EKPGalleryListViewController : UIViewController <UITableViewDataSource, UITableViewDelegate, MWPhotoBrowserDelegate>

@property (nonatomic, strong) IBOutlet UITableView *galleryListTableView;

@property (nonatomic, strong) NSMutableArray *galleryListArray;

@property (nonatomic, strong) NSMutableArray *photoListArray;

@property (nonatomic) NSInteger pageId;
@property (nonatomic) BOOL isNextPageAvailable;
@property (nonatomic) BOOL isFirstLoad;

@end
