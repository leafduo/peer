//
//  PRNavigationController.m
//  Peer
//
//  Created by leafduo on 4/2/13.
//  Copyright (c) 2013 leafduo.com. All rights reserved.
//

#import "PRNavigationController.h"

@implementation PRNavigationController

- (void)awakeFromNib {
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(login:) name:@"XMPPStreamNotAuthorizedNotificationName" object:nil];
}

- (void)login:(NSNotification *)notification {
    [self performSegueWithIdentifier:@"login" sender:self];
}

@end
