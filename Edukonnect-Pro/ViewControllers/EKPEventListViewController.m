//
//  EKPEventListViewController.m
//  Edukonnect-Pro
//
//  Created by Edupsyche on 12/9/14.
//  Copyright (c) 2014 Kedar Desai. All rights reserved.
//

#import "EKPEventListViewController.h"
#import "EKPEvent.h"
#import "EKPEventAPI.h"
#import "UIImageView+AFNetworking.h"

@interface EKPEventListViewController ()

@end

@implementation EKPEventListViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.navigationController.navigationBar.topItem.title = @"";
    
    self.eventListArray = [[NSMutableArray alloc] init];
    
    [self.eventListTableView setBackgroundView:nil];
    [self.eventListTableView setBackgroundColor:[UIColor loadScreenBackgroundColor]];
    [self.eventListTableView setSeparatorStyle:UITableViewCellSeparatorStyleNone];
    self.pageId = 0;
    self.isNextPageAvailable = YES;
    self.isFirstLoad = YES;
    [self callAPI];
    
    [self.eventListTableView setFrame:self.view.bounds];
}

- (void)viewWillAppear:(BOOL)animated
{
    self.title = @"Event List";
}

- (void)viewWillDisappear:(BOOL)animated
{
    self.eventListTableView.delegate = nil;
    self.eventListTableView = nil;
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


#pragma mark Reusable-Code Methods

- (void)callAPI
{
    if (self.isNextPageAvailable) {
        self.pageId++;
        NSMutableDictionary *resultDict = [EKPEventAPI getEventsForPageId:self.pageId];
        NSMutableArray *eventArray = [[resultDict objectForKey:EVENT_API_EVENT] mutableCopy];
        for (NSMutableDictionary *eventDict in eventArray) {
            EKPEvent *eventTemp = [[EKPEvent alloc] init];
            eventTemp.eventId = [eventDict objectForKey:EVENT_API_ID];
            eventTemp.eventName = [eventDict objectForKey:EVENT_API_NAME];
            eventTemp.eventImage = [eventDict objectForKey:EVENT_API_IMAGE];
            eventTemp.eventClassId = [eventDict objectForKey:EVENT_API_CLASS_ID];
            eventTemp.eventCreatedBy = [eventDict objectForKey:EVENT_API_CREATED_BY];
            eventTemp.eventCreatedDate = [eventDict objectForKey:EVENT_API_CREATED_DATE];
            eventTemp.eventEventDate = [eventDict objectForKey:EVENT_API_EVENT_DATE];
            eventTemp.eventEventTime = [eventDict objectForKey:EVENT_API_EVENT_TIME];
            eventTemp.eventVenue = [eventDict objectForKey:EVENT_API_VENUE];
            
            [self.eventListArray addObject:eventTemp];
        }
        
        if (self.pageId == 1) {
            // Save Notice List in Singleton
            [EKPSingleton saveEventList:self.eventListArray];
        }
        self.isNextPageAvailable = [[resultDict objectForKey:EVENT_API_NEXT_PAGE] boolValue];
        
        [self.eventListTableView reloadData];
    }
}


#pragma mark UITableViewDelegate and UITableViewDatasource Methods

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return [self.eventListArray count];
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"eventCell"];
    
    if (!cell) {
        cell =[[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"eventCell"];
    }
    
    self.isFirstLoad = NO;
    
    cell.selectionStyle = UITableViewCellSelectionStyleNone;
    
    [cell setBackgroundColor:[UIColor loadScreenBackgroundColor]];
    
    EKPEvent *currentEvent = [self.eventListArray objectAtIndex:indexPath.row];
    
    UIView *contentView = [cell.contentView viewWithTag:100];
    
    if (![currentEvent.eventImage isEqual:[NSNull null]]) {
        UIImageView *eventImage = (UIImageView *) [contentView viewWithTag:101];
        [eventImage setImageWithURL:[NSURL URLWithString:currentEvent.eventImage]];
    }
    
    UILabel *headingLabel = (UILabel *) [contentView viewWithTag:102];
    [headingLabel setText:currentEvent.eventName];
    
    UILabel *venueLabel = (UILabel *) [contentView viewWithTag:104];
    [venueLabel setText:currentEvent.eventVenue];
    
    UILabel *dateLabel = (UILabel *) [contentView viewWithTag:106];
    [dateLabel setText:currentEvent.eventEventDate];
    
    UILabel *timeLabel = (UILabel *) [contentView viewWithTag:108];
    [timeLabel setText:currentEvent.eventEventTime];
    
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
