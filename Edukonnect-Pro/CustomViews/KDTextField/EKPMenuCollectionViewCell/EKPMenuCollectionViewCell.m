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
    self.colorView.layer.borderColor = [[UIColor loadMenuBorderColor] CGColor];
    self.colorView.layer.cornerRadius = 6.0f;
}

- (void)showData
{
    switch (self.ekpDashboardMenu) {
        case kEKPDashboardMenuNoticeBoard:
        {
            [self.menuIcon setImage:[UIImage imageNamed:@"Noticeboard"]];
            [self.nameLabel setText:@"Noticeboard"];
        }
            break;
            
        case kEKPDashboardMenuAlert:
        {
            [self.menuIcon setImage:[UIImage imageNamed:@"Alert"]];
            [self.nameLabel setText:@"Alert"];
        }
            break;
            
        case kEKPDashboardMenuEvent:
        {
            [self.menuIcon setImage:[UIImage imageNamed:@"Events"]];
            [self.nameLabel setText:@"Events"];
        }
            break;
            
        case kEKPDashboardMenuResult:
        {
            if ([[EKPSingleton loadUserRole] isEqualToString:PARENT_ROLE]) {
                [self.menuIcon setImage:[UIImage imageNamed:@"Results"]];
                [self.nameLabel setText:@"Results"];
            } else {
                [self.menuIcon setImage:[UIImage imageNamed:@"Leave"]];
                [self.nameLabel setText:@"Leave"];
            }
        }
            break;
            
        case kEKPDashboardMenuTimeTable:
        {
            [self.menuIcon setImage:[UIImage imageNamed:@"Timetable"]];
            [self.nameLabel setText:@"Timetable"];
        }
            break;
            
        case kEKPDashboardMenuGallary:
        {
            [self.menuIcon setImage:[UIImage imageNamed:@"PhotoGallery"]];
            [self.nameLabel setText:@"Gallery"];
        }
            break;
            
        case kEKPDashboardMenuEduSen:
        {
            [self.menuIcon setImage:[UIImage imageNamed:@"EduSen"]];
            [self.nameLabel setText:@"EduSen"];
        }
            break;
            
        case kEKPDashboardMenuLibrary:
        {
            [self.menuIcon setImage:[UIImage imageNamed:@"Library"]];
            [self.nameLabel setText:@"Library"];
        }
            break;
            
        case kEKPDashboardMenuTransport:
        {
            [self.menuIcon setImage:[UIImage imageNamed:@"Transport"]];
            [self.nameLabel setText:@"Transport"];
        }
            break;
            
        case kEKPDashboardMenuHomework:
        {
            [self.menuIcon setImage:[UIImage imageNamed:@"Homework"]];
            [self.nameLabel setText:@"Homework"];
        }
            break;
            
        case kEKPDashboardMenuSchoolSupport:
        {
            [self.menuIcon setImage:[UIImage imageNamed:@"SchoolSupport"]];
            [self.nameLabel setText:@"School Support"];
        }
            break;
            
        case kEKPDashboardMenuPayment:
        {
            [self.menuIcon setImage:[UIImage imageNamed:@"Fees"]];
            [self.nameLabel setText:@"Payment"];
        }
            break;
            
        case kEKPDashboardMenuParenting:
        {
            [self.menuIcon setImage:[UIImage imageNamed:@"EffectiveParenting"]];
            [self.nameLabel setText:@"Effective Parenting"];
        }
            break;
            
        case kEKPDashboardMenuBehavioralIssue:
        {
            [self.menuIcon setImage:[UIImage imageNamed:@"BehaviouralIssues"]];
            [self.nameLabel setText:@"Behavioural Issues"];
        }
            break;
            
        case kEKPDashboardMenuLocator:
        {
            [self.menuIcon setImage:[UIImage imageNamed:@"Locator"]];
            [self.nameLabel setText:@"Locator"];
        }
            break;
            
        case kEKPDashboardMenuPersonCareerCounselling:
        {
            [self.menuIcon setImage:[UIImage imageNamed:@"PersonCareerCounseling"]];
            [self.nameLabel setText:@"Career Counseling"];
        }
            break;
            
        case kEKPDashboardMenuKnowledgeCorner:
        {
            if ([[EKPSingleton loadUserRole] isEqualToString:TEACHER_ROLE]) {
                [self.menuIcon setImage:[UIImage imageNamed:@"KnowledgeCentre"]];
                [self.nameLabel setText:@"Knowledge Centre"];
                
            } else {
                [self.menuIcon setImage:[UIImage imageNamed:@"ComingSoon"]];
                [self.nameLabel setText:@"Coming Soon..."];
            }
        }
            break;
            
        case kEKPDashboardMenuComingSoon:
        {
            [self.menuIcon setImage:[UIImage imageNamed:@"ComingSoon"]];
            [self.nameLabel setText:@"Coming Soon..."];
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
