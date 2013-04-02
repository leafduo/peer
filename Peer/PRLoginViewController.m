//
//  PRLoginViewController.m
//  Peer
//
//  Created by leafduo on 4/2/13.
//  Copyright (c) 2013 leafduo.com. All rights reserved.
//

#import "PRLoginViewController.h"

@interface PRLoginViewController ()

@property (nonatomic, strong) IBOutlet UITextField *usernameField;
@property (nonatomic, strong) IBOutlet UITextField *passwordField;
@property (nonatomic, strong) IBOutlet UIButton *loginButton;

@end

@implementation PRLoginViewController

- (void)awakeFromNib {
    // TODO: set login button availablity automatically
}

- (IBAction)login:(id)sender {
    
}

@end
