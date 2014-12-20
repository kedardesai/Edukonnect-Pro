//
//  EKPGalleryListViewController.m
//  Edukonnect-Pro
//
//  Created by Edupsyche on 12/13/14.
//  Copyright (c) 2014 Kedar Desai. All rights reserved.
//

#import "EKPGalleryListViewController.h"
#import "EKPGalleryAPI.h"

@interface EKPGalleryListViewController ()

- (void)callAPI;

@end

@implementation EKPGalleryListViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    self.galleryListArray = [[NSMutableArray alloc] init];
    self.photoListArray = [[NSMutableArray alloc] init];
    
    self.pageId = 0;
    self.isNextPageAvailable = YES;
    self.isFirstLoad = YES;

    [self.galleryListTableView setBackgroundView:nil];
    [self.galleryListTableView setBackgroundColor:[UIColor loadScreenBackgroundColor]];
    
    self.navigationController.navigationBar.topItem.title = @"";
    [self callAPI];
}

- (void)viewWillAppear:(BOOL)animated
{
    self.title = [NSString stringWithFormat:@"Gallery List"];
    self.galleryListTableView.delegate = self;
}

- (void)viewWillDisappear:(BOOL)animated
{
    self.galleryListTableView.delegate = nil;
//    self.galleryListTableView = nil;
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
    return [self.galleryListArray count];
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    NSString *reuseIdentifier = @"galleryFolderCell";
    UITableViewCell *cell = [self.galleryListTableView dequeueReusableCellWithIdentifier:reuseIdentifier];
    
    NSDictionary *folderDict = [self.galleryListArray objectAtIndex:indexPath.row];
    
    UILabel *folderName = (UILabel *) [cell.contentView viewWithTag:100];
    [folderName setText:[folderDict objectForKey:GALLERY_API_GALLERY_NAME]];
    
    UILabel *folderDesc = (UILabel *) [cell.contentView viewWithTag:101];
    [folderDesc setText:[folderDict objectForKey:GALLERY_API_GALLERY_DESC]];
    
    [cell setBackgroundColor:[UIColor loadScreenBackgroundColor]];
    cell.selectionStyle = UITableViewCellSelectionStyleNone;
    
    return cell;
}

#pragma mark UITableViewDelegate Methods

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    NSDictionary *folderDict = [self.galleryListArray objectAtIndex:indexPath.row];
    NSMutableArray *photos = [[EKPGalleryAPI getPhotoListForGalleryId:[folderDict objectForKey:GALLERY_API_GALLERY_ID]] mutableCopy];
    
    // basePath/uploads/gallery_image/imagePath
    
    [self.photoListArray removeAllObjects];
    
    EKPStudent *student = [EKPSingleton loadStudent];
    
    for (NSDictionary *imageDict in photos) {
        
        NSLog(@"%@", [NSString stringWithFormat:@"http://%@/uploads/gallery_image/%@", student.studentBasePath, [imageDict objectForKey:GALLERY_API_GALLERY_IMAGE_LINK]]);
        
        [self.photoListArray addObject:[MWPhoto photoWithURL:[NSURL URLWithString:[NSString stringWithFormat:@"http://%@/uploads/gallery_image/%@", student.studentBasePath, [imageDict objectForKey:GALLERY_API_GALLERY_IMAGE_LINK]]]]];
    }
    
//    [self.photoListArray addObject:[MWPhoto photoWithURL:[NSURL URLWithString:@"http://farm4.static.flickr.com/3629/3339128908_7aecabc34b.jpg"]]];
//    [self.photoListArray addObject:[MWPhoto photoWithURL:[NSURL URLWithString:@"http://farm4.static.flickr.com/3590/3329114220_5fbc5bc92b.jpg"]]];
    
    // Create browser (must be done each time photo browser is
    // displayed. Photo browser objects cannot be re-used)
    MWPhotoBrowser *browser = [[MWPhotoBrowser alloc] initWithDelegate:self];
    
    // Set options
    browser.displayActionButton = YES; // Show action button to allow sharing, copying, etc (defaults to YES)
    browser.displayNavArrows = NO; // Whether to display left and right nav arrows on toolbar (defaults to NO)
    browser.displaySelectionButtons = NO; // Whether selection buttons are shown on each image (defaults to NO)
    browser.zoomPhotosToFill = YES; // Images that almost fill the screen will be initially zoomed to fill (defaults to YES)
    browser.alwaysShowControls = NO; // Allows to control whether the bars and controls are always visible or whether they fade away to show the photo full (defaults to NO)
    browser.enableGrid = YES; // Whether to allow the viewing of all the photo thumbnails on a grid (defaults to YES)
    browser.startOnGrid = NO; // Whether to start on the grid of thumbnails instead of the first photo (defaults to NO)
    
    // Optionally set the current visible photo before displaying
    [browser setCurrentPhotoIndex:1];
    
    // Present
    [self.navigationController pushViewController:browser animated:YES];
    
    // Manipulate
    [browser showNextPhotoAnimated:YES];
    [browser showPreviousPhotoAnimated:YES];
    [browser setCurrentPhotoIndex:10];
}

#pragma mark MWPhotoBrowserDelegate Methods

- (NSUInteger)numberOfPhotosInPhotoBrowser:(MWPhotoBrowser *)photoBrowser
{
    return self.photoListArray.count;
}

- (id <MWPhoto>)photoBrowser:(MWPhotoBrowser *)photoBrowser photoAtIndex:(NSUInteger)index
{
    if (index < self.photoListArray.count)
        return [self.photoListArray objectAtIndex:index];
    
    return nil;
}

#pragma mark Reusable-Code Methods

- (void)callAPI
{
    if (self.isNextPageAvailable) {
        
        [MBProgressHUD showHUDAddedTo:self.view animated:YES];
        dispatch_async(dispatch_get_global_queue( DISPATCH_QUEUE_PRIORITY_HIGH, 0), ^{
            // Do something...
            
            self.pageId++;
            NSMutableDictionary *resultDict = [EKPGalleryAPI getGalleryFolderListForPageId:self.pageId];
            self.galleryListArray = [[resultDict objectForKey:GALLERY_API_GALLERY] mutableCopy];
            
            self.isNextPageAvailable = [[resultDict objectForKey:GALLERY_API_GALLERY_NEXT_PAGE] boolValue];
            
            dispatch_async(dispatch_get_main_queue(), ^{
                [MBProgressHUD hideHUDForView:self.view animated:YES];
                [self.galleryListTableView reloadData];
            });
        });
        
    }
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
