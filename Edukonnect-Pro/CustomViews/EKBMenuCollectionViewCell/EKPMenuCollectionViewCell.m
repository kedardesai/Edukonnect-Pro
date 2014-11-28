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
    
//    switch (self.ekpDashboardMenu) {
//        case kEKPDashboardMenuMyChild:
//            NSLog(@"Show My child Image.");
//            break;
//            
//        default:
//            NSLog(@"Show Default Image.");
//            break;
//    }
}


@end
