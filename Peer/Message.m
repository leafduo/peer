//
//  Message.m
//  Peer
//
//  Created by leafduo on 3/30/13.
//  Copyright (c) 2013 leafduo.com. All rights reserved.
//

#import "Message.h"
#import "Buddy.h"
#import "XMPP.h"

@implementation Message

@dynamic body;
@dynamic createdAt;
@dynamic sender;

+ (instancetype)objectWithXMLRepresentation:(XMPPMessage *)xmppMessage {
    Message *message = [[Message alloc] init];
    message.body = [[xmppMessage elementForName:@"body"] stringValue];
    XMPPJID *senderJID = [[xmppMessage from] bareJID];
    // TODO: link message & resource
    return message;
}

@end
