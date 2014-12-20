//
//  EKPDormitoriesViewController.m
//  Edukonnect-Pro
//
//  Created by Edupsyche on 12/17/14.
//  Copyright (c) 2014 Kedar Desai. All rights reserved.
//

#import "EKPDormitoriesViewController.h"
#import "EKPDormitory.h"
#import "EKPDormitoryAPI.h"

@interface EKPDormitoriesViewController ()

- (void)callAPI;

@end

@implementation EKPDormitoriesViewController

#pragma mark UIViewLifeCycle Methods

- (void)viewDidLoad
{
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    self.navigationController.navigationBar.topItem.title = @"";
    
    self.dormitoriesListArray = [[NSMutableArray alloc] init];
    
    [self.dormitoriesListTableView setBackgroundView:nil];
    [self.dormitoriesListTableView setBackgroundColor:[UIColor loadScreenBackgroundColor]];
    [self.dormitoriesListTableView setSeparatorStyle:UITableViewCellSeparatorStyleNone];
    self.pageId = 0;
    self.isNextPageAvailable = YES;
    self.isFirstLoad = YES;
    [self callAPI];
}

- (void)viewWillAppear:(BOOL)animated
{
    self.title = [NSString stringWithFormat:@"Dormitory List"];
    self.dormitoriesListTableView.delegate = self;
}

- (void)viewWillDisappear:(BOOL)animated
{
    self.dormitoriesListTableView.delegate = nil;
//    self.dormitoriesListTableView = nil;
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark Code-Reusable Methods

- (void)callAPI
{
    if (self.isNextPageAvailable) {
        self.pageId++;
        NSMutableDictionary *resultDict = [EKPDormitoryAPI getDormitoryListWithPageId:self.pageId];
        NSMutableArray *dormitoryArray = [[resultDict objectForKey:DORMITORIES_API_TAG] mutableCopy];
        for (NSMutableDictionary *dormitoryDict in dormitoryArray) {
            EKPDormitory *obj = [[EKPDormitory alloc] init];
            obj.dormitoryId = [dormitoryDict objectForKey:DORMITORIES_API_ID];
            obj.dormitoryName = [dormitoryDict objectForKey:DORMITORIES_API_NAME];
            obj.dormitoryNumberOfRooms = [dormitoryDict objectForKey:DORMITORIES_API_ROOMS];
            obj.dormitoryDesc = [dormitoryDict objectForKey:DORMITORIES_API_DESC];
            
            [self.dormitoriesListArray addObject:obj];
        }
        
        self.isNextPageAvailable = [[resultDict objectForKey:DORMITORIES_API_NEXT_PAGE] boolValue];
        
        [self.dormitoriesListTableView reloadData];
    }
}

#pragma mark UITableViewDatasource Methods

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return [self.dormitoriesListArray count];
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    NSString *reuseIdentifier = @"dormitoryCell";
    
    UITableViewCell *cell = [self.dormitoriesListTableView dequeueReusableCellWithIdentifier:reuseIdentifier];
    
    cell.selectionStyle = UITableViewCellSelectionStyleNone;
    [cell setBackgroundColor:[UIColor loadScreenBackgroundColor]];
    
    EKPDormitory *obj = [self.dormitoriesListArray objectAtIndex:indexPath.row];
    
    UIView *contentView = [cell.contentView viewWithTag:100];
    
    UILabel *nameLabel = (UILabel *) [contentView viewWithTag:101];
    [nameLabel setText:obj.dormitoryName];
    
    UILabel *numberOfRoomsLabel = (UILabel *) [contentView viewWithTag:103];
    if (![obj.dormitoryNumberOfRooms isEqual:[NSNull null]]) {
        [numberOfRoomsLabel setText:obj.dormitoryNumberOfRooms];
    } else {
        [numberOfRoomsLabel setText:@"-"];
    }
    
    UILabel *descLabel = (UILabel *) [contentView viewWithTag:104];
    if (![obj.dormitoryDesc isEqual:[NSNull null]]) {
        [descLabel setText:obj.dormitoryDesc];
    } else {
        [descLabel setText:@"-"];
    }
    
    return cell;
}


#pragma mark UIScrollViewDelegate

- (void)scrollViewDidScroll:(UIScrollView *)scrollView
{
    if ((scrollView.contentOffset.y + scrollView.frame.size.height) >= scrollView.contentSize.height)
    {
        if (!self.isFirstLoad) {
            [self callAPI];
        }
    }
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
