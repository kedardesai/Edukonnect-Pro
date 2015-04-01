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
    
    self.cellView.layer.borderColor = [[UIColor loadScreenBackgroundColor] CGColor];
    self.colorView.layer.borderWidth = 0.6f;
    self.colorView.layer.borderColor = [[UIColor loadScreenBackgroundColor] CGColor];
    self.colorView.layer.cornerRadius = 6.0f;
}

- (void)showData
{
    switch (self.ekpDashboardMenu) {
        case kEKPDashboardMenuNoticeBoard:
        {
//            [self.colorView setBackgroundColor:[UIColor loadMenuBgDarkGreen]];
            [self.menuIcon setImage:[UIImage imageNamed:@"Noticeboard"]];
//            [self.nameLabel setText:@"Noticeboard"];
            
        }
            break;
            
        case kEKPDashboardMenuAlert:
        {
//            [self.colorView setBackgroundColor:[UIColor loadMenuBgLightSkyBlue]];
            [self.menuIcon setImage:[UIImage imageNamed:@"Alert"]];
//            [self.nameLabel setText:@"Alert"];
            
        }
            break;
            
        case kEKPDashboardMenuEvent:
        {
//            [self.colorView setBackgroundColor:[UIColor loadMenuBgDarkGreen]];
            [self.menuIcon setImage:[UIImage imageNamed:@"Events"]];
//            [self.nameLabel setText:@"Events"];
            
        }
            break;
            
        case kEKPDashboardMenuResult:
        {
//            [self.colorView setBackgroundColor:[UIColor loadMenuBgDarkOrange]];
            [self.menuIcon setImage:[UIImage imageNamed:@"Results"]];
//            [self.nameLabel setText:@"Results"];
            
        }
            break;
            
        case kEKPDashboardMenuTimeTable:
        {
//            [self.colorView setBackgroundColor:[UIColor loadMenuBgLightSkyBlue]];
            [self.menuIcon setImage:[UIImage imageNamed:@"Timetable"]];
//            [self.nameLabel setText:@"Timetable"];
            
        }
            break;
            
        case kEKPDashboardMenuGallary:
        {
//            [self.colorView setBackgroundColor:[UIColor loadMenuBgLightOrange]];
            [self.menuIcon setImage:[UIImage imageNamed:@"PhotoGallery"]];
//            [self.nameLabel setText:@"Gallery"];
            
        }
            break;
            
        case kEKPDashboardMenuEduSen:
        {
//            [self.colorView setBackgroundColor:[UIColor loadMenuBgLightOrange]];
            [self.menuIcon setImage:[UIImage imageNamed:@"EduSen"]];
//            [self.nameLabel setText:@"EduSen"];
            
        }
            break;
            
        case kEKPDashboardMenuLibrary:
        {
//            [self.colorView setBackgroundColor:[UIColor loadMenuBgLightSkyBlue]];
            [self.menuIcon setImage:[UIImage imageNamed:@"Library"]];
//            [self.nameLabel setText:@"Library"];
            
        }
            break;
            
        case kEKPDashboardMenuTransport:
        {
//            [self.colorView setBackgroundColor:[UIColor loadMenuBgDarkOrange]];
            [self.menuIcon setImage:[UIImage imageNamed:@"Transport"]];
//            [self.nameLabel setText:@"Transport"];
            
        }
            break;
            
        case kEKPDashboardMenuBoarding:
        {
//            [self.colorView setBackgroundColor:[UIColor loadMenuBgDarkGreen]];
            [self.menuIcon setImage:[UIImage imageNamed:@"Dormiatry"]];
//            [self.nameLabel setText:@"Dormiotry"];
            
        }
            break;
            
        case kEKPDashboardMenuPayment:
        {
//            [self.colorView setBackgroundColor:[UIColor loadMenuBgLightOrange]];
            [self.menuIcon setImage:[UIImage imageNamed:@"Fees"]];
//            [self.nameLabel setText:@"Payment"];
            
        }
            break;
            
        case kEKPDashboardMenuParenting:
        {
//            [self.colorView setBackgroundColor:[UIColor loadMenuBgDarkGreen]];
            [self.menuIcon setImage:[UIImage imageNamed:@"Dormiatry"]];
//            [self.nameLabel setText:@"Dormiotry"];
            
        }
            break;
            
        case kEKPDashboardMenuBehavioralIssue:
        {
//            [self.colorView setBackgroundColor:[UIColor loadMenuBgDarkGreen]];
            [self.menuIcon setImage:[UIImage imageNamed:@"Dormiatry"]];
//            [self.nameLabel setText:@"Dormiotry"];
            
        }
            break;
            
        case kEKPDashboardMenuBehavioralLocator:
        {
//            [self.colorView setBackgroundColor:[UIColor loadMenuBgDarkGreen]];
            [self.menuIcon setImage:[UIImage imageNamed:@"Dormiatry"]];
//            [self.nameLabel setText:@"Dormiotry"];
            
        }
            break;
            
        case kEKPDashboardMenuPersonCareerCounselling:
        {
//            [self.colorView setBackgroundColor:[UIColor loadMenuBgDarkGreen]];
            [self.menuIcon setImage:[UIImage imageNamed:@"Dormiatry"]];
//            [self.nameLabel setText:@"Dormiotry"];
            
        }
            break;
            
        case kEKPDashboardMenuKnowledgeCorner:
        {
//            [self.colorView setBackgroundColor:[UIColor loadMenuBgDarkGreen]];
            [self.menuIcon setImage:[UIImage imageNamed:@"Dormiatry"]];
//            [self.nameLabel setText:@"Dormiotry"];
            
        }
            break;
            
        case kEKPDashboardMenuComingSoon:
        {
//            [self.colorView setBackgroundColor:[UIColor loadMenuBgDarkGreen]];
            [self.menuIcon setImage:[UIImage imageNamed:@"Dormiatry"]];
//            [self.nameLabel setText:@"Dormiotry"];
            
        }
            break;
            
        default:
            NSLog(@"Show Default Image.");
            break;
    }
    
    self.nameLabel.adjustsFontSizeToFitWidth = YES;
}


#pragma mark Setter Methods

- (void)setEkpDashboardMenu:(EKPDashboardMenus)ekpDashboardMenu
{
    _ekpDashboardMenu = ekpDashboardMenu;
    [self showData];
}


@end
