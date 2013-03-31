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
@dynamic receiver;

+ (instancetype)objectWithXMLRepresentation:(XMPPMessage *)xmppMessage {
    NSString *bodyString = [[xmppMessage elementForName:@"body"] stringValue];
    if (!bodyString) {
        return nil;
    }
    
    Message *message = [[Message alloc] init];
    message.body = bodyString;
    
    Buddy *sender = [Buddy existingObjectWithIdentifier:[[xmppMessage from] bare]];
    [sender addSentObject:message];

    Buddy *receiver = [Buddy existingObjectWithIdentifier:[[xmppMessage to] bare]];
    [receiver addReceivedObject:message];
    return message;
}

@end
