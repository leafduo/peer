//
//  Presence.m
//  Peer
//
//  Created by leafduo on 3/30/13.
//  Copyright (c) 2013 leafduo.com. All rights reserved.
//

#import "Presence.h"
#import "Buddy.h"
#import "XMPP.h"

@implementation Presence

@dynamic identifier;
@dynamic show;
@dynamic status;
@dynamic owner;

+ (instancetype)objectWithXMLRepresentation:(XMPPPresence *)xmppPresence {
    Presence *presence = [Presence objectWithIdentifier:xmppPresence.fromStr];
    presence.identifier = xmppPresence.fromStr;
    presence.show = xmppPresence.show;
    presence.status = xmppPresence.status;

    Buddy *associateBuddy = [Buddy objectWithIdentifier:xmppPresence.from.bare];
    [associateBuddy addPresencesObject:presence];
    [associateBuddy updateStatus];

    return presence;
}

@end
