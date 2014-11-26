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
    [[NSBundle mainBundle] loadNibNamed:@"EKPMenuCollectionViewCell" owner:self options:nil];
    [self addSubview:self.cellView];
    
    self.layer.borderColor = [[UIColor loadDarkGrayBorderColor] CGColor];
    self.layer.borderWidth = 0.6f;
    
    switch (self.ekpDashboardMenu) {
        case kEKPDashboardMenuMyChild:
            NSLog(@"Show My child Image.");
            break;
            
        default:
            NSLog(@"Show Default Image.");
            break;
    }
}


@end
