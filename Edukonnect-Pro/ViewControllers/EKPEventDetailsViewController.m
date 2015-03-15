//
//  EKPEventDetailsViewController.m
//  Edukonnect-Pro
//
//  Created by Edupsyche on 3/6/15.
//  Copyright (c) 2015 Kedar Desai. All rights reserved.
//

#import "EKPEventDetailsViewController.h"
#import "UIImageView+AFNetworking.h"
#import "EKPEventAPI.h"

@interface EKPEventDetailsViewController ()

@property (nonatomic) BOOL isGoingForEvent;

@end

@implementation EKPEventDetailsViewController

#pragma mark UIViewLifeCycle Methods

- (void)viewDidLoad
{
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    self.eventNameLabel.text = self.selectedEvent.eventName;
    self.eventDate.text = [EKPUtility getDateForTimeStamp:self.selectedEvent.eventEventDate];
    self.eventTime.text = self.selectedEvent.eventEventTime;
    self.eventVenue.text = self.selectedEvent.eventVenue;
    [self.eventImageView setImageWithURL:[NSURL URLWithString:self.selectedEvent.eventImage]];
    
    if (![self.selectedEvent.eventIsGoingControlToShow boolValue]) {
        [self.eventIsGoingBtn setHidden:YES];
        [self.eventIsGoingLabel setHidden:YES];
    } else {
        self.isGoingForEvent = [EKPEventAPI checkIsGoing:self.selectedEvent.eventId];
        if (self.isGoingForEvent) {
            [self.eventIsGoingBtn setImage:[UIImage imageNamed:@"Checkbox_Selected"] forState:UIControlStateNormal];
            [self.eventIsGoingBtn setEnabled:NO];
            [self.eventIsGoingLabel setEnabled:NO];
        }
    }
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark IBAction Methods

- (IBAction)isGoingBtnClicked:(id)senderBtn
{
    NSLog(@"Call isGoingAPI and Disable Button.");
    if (!self.isGoingForEvent) {
        self.isGoingForEvent = [EKPEventAPI userIsGoingToEvent:self.selectedEvent.eventId];
        if (self.isGoingForEvent) {
            [self.eventIsGoingBtn setImage:[UIImage imageNamed:@"Checkbox_Selected"] forState:UIControlStateNormal];
            [self.eventIsGoingBtn setEnabled:NO];
            [self.eventIsGoingLabel setEnabled:NO];
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
