//
//  EKPMenuCollectionViewCell.h
//  Edukonnect-Pro
//
//  Created by Edupsyche on 11/26/14.
//  Copyright (c) 2014 Kedar Desai. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface EKPMenuCollectionViewCell : UICollectionViewCell

@property (nonatomic) EKPDashboardMenus ekpDashboardMenu;

@property (nonatomic, strong) IBOutlet UIImageView *menuIcon;

@property (nonatomic, strong) IBOutlet UIView *colorView;

@property (nonatomic, strong) IBOutlet UILabel *nameLabel;


@end
