//
//  EKPLibraryViewController.m
//  Edukonnect-Pro
//
//  Created by Edupsyche on 12/18/14.
//  Copyright (c) 2014 Kedar Desai. All rights reserved.
//

#import "EKPLibraryViewController.h"

@interface EKPLibraryViewController ()

@end

@implementation EKPLibraryViewController

#pragma mark UIViewLifeCycle Methods

- (void)viewDidLoad
{
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    self.navigationController.navigationBar.topItem.title = @"";
    
    self.libraryMenuListArray = [[NSMutableArray alloc] initWithObjects:@"All Books", @"Search Book", @"My Books", nil];
    
    [self.libraryMenuListTableView setBackgroundView:nil];
    [self.libraryMenuListTableView setBackgroundColor:[UIColor loadScreenBackgroundColor]];
}

- (void)viewWillAppear:(BOOL)animated
{
    self.title = @"Library";
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark UITableViewDatasource Methods

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return [self.libraryMenuListArray count];
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    NSString *reuseIdentifier = @"libraryCell";
    UITableViewCell *cell = [self.libraryMenuListTableView dequeueReusableCellWithIdentifier:reuseIdentifier];
    
    [cell setBackgroundColor:[UIColor loadScreenBackgroundColor]];
    cell.selectionStyle = UITableViewCellSelectionStyleNone;
    
    UILabel *nameLabel = (UILabel *) [cell.contentView viewWithTag:100];
    [nameLabel setText:[self.libraryMenuListArray objectAtIndex:indexPath.row]];
    
    return cell;
}

#pragma mark UITableViewDelegate Methods

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    NSLog(@"Clicked...");
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
