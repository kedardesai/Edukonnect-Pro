//
//  EKPEventDetailsViewController.h
//  Edukonnect-Pro
//
//  Created by Edupsyche on 3/6/15.
//  Copyright (c) 2015 Kedar Desai. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "EKPEvent.h"

@interface EKPEventDetailsViewController : UIViewController

@property (nonatomic, strong) IBOutlet UILabel *eventNameLabel;
@property (nonatomic, strong) IBOutlet UIImageView *eventImageView;
@property (nonatomic, strong) IBOutlet UILabel *eventDate;
@property (nonatomic, strong) IBOutlet UILabel *eventTime;
@property (nonatomic, strong) IBOutlet UILabel *eventVenue;
@property (nonatomic, strong) IBOutlet UIButton *eventIsGoingBtn;

@property (nonatomic, strong) EKPEvent *selectedEvent;

- (IBAction)isGoingBtnClicked:(id)senderBtn;


@end
