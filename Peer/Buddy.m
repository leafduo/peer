//
//  Buddy.m
//  Peer
//
//  Created by leafduo on 3/31/13.
//  Copyright (c) 2013 leafduo.com. All rights reserved.
//

#import "Buddy.h"
#import "Message.h"
#import "Presence.h"


@implementation Buddy

@dynamic identifier;
@dynamic show;
@dynamic status;
@dynamic presences;
@dynamic received;
@dynamic sent;

- (void)updateStatus {
    for (Presence *presence in self.presences) {
        self.show = presence.show;
    }
}

@end
