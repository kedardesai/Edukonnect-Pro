//
//  EKPMenuCollectionViewCell.m
//  Edukonnect-Pro
//
//  Created by Edupsyche on 11/26/14.
//  Copyright (c) 2014 Kedar Desai. All rights reserved.
//

#import "EKPMenuCollectionViewCell.h"

@interface EKPMenuCollectionViewCell ()

@property (nonatomic, strong) IBOutlet UIView *cellView;

- (void)loadXib;
- (void)showData;

@end

@implementation EKPMenuCollectionViewCell

#pragma mark UIViewLifeCycle Methods

- (id)initWithCoder:(NSCoder *)aDecoder
{
    self = [super initWithCoder:aDecoder];
    [self loadXib];
    return self;
}


#pragma mark Code-Reusable Methods

- (void)loadXib
{
    if ([EKPUtility getUserDeviceType] == kEKPUserDeviceIPhone) {
        [[NSBundle mainBundle] loadNibNamed:@"EKPMenuCollectionViewCell_iPhone" owner:self options:nil];
    } else {
        [[NSBundle mainBundle] loadNibNamed:@"EKPMenuCollectionViewCell_iPad" owner:self options:nil];
    }
    
    [self addSubview:self.cellView];
    
    self.cellView.layer.borderColor = [[UIColor loadDarkGrayBorderColor] CGColor];
    self.cellView.layer.borderWidth = 1.0f;
}

- (void)showData
{
    switch (self.ekpDashboardMenu) {
        case kEKPDashboardMenuNotice:
            NSLog(@"Show Notice.");
            break;
            
        case kEKPDashboardMenuEvent:
            NSLog(@"Show Events.");
            break;
            
        case kEKPDashboardMenuResult:
            NSLog(@"Show Results.");
            break;
            
        case kEKPDashboardMenuTimeTable:
            NSLog(@"Show Timetable.");
            break;
            
        case kEKPDashboardMenuGallary:
            NSLog(@"Show Photo Gallary.");
            break;
            
        case kEKPDashboardMenuEduSen:
            NSLog(@"Show WebView.");
            break;
            
        case kEKPDashboardMenuLibrary:
            NSLog(@"Show Library.");
            break;
            
        case kEKPDashboardMenuTransport:
            NSLog(@"Show Transport.");
            break;
            
        case kEKPDashboardMenuBoarding:
            NSLog(@"Show Boarding.");
            break;
            
        case kEKPDashboardMenuPayment:
            NSLog(@"Show Payment.");
            break;
            
        default:
            NSLog(@"Show Default Image.");
            break;
    }
}


#pragma mark Setter Methods

- (void)setEkpDashboardMenu:(EKPDashboardMenus)ekpDashboardMenu
{
    _ekpDashboardMenu = ekpDashboardMenu;
    [self showData];
}


@end
