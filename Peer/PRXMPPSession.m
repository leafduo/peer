//
//  PRXMPPSession.m
//  Peer
//
//  Created by leafduo on 3/29/13.
//  Copyright (c) 2013 leafduo.com. All rights reserved.
//

#import "PRXMPPSession.h"
#import "XMPP.h"
#import "Message.h"
#import "Presence.h"
#import "SSKeychain.h"

@implementation PRXMPPSession {
    XMPPStream *_stream;
}

@synthesize jabberID = _jabberID;

static PRXMPPSession *_sharedSession;

#pragma mark - Initializers

+ (instancetype)sharedSession {
    if (!_sharedSession) {
        _sharedSession = [[PRXMPPSession alloc] init];
    }
    return _sharedSession;
}

- (instancetype)init {
    self = [super init];
    if (self) {
        _stream = [[XMPPStream alloc] init];
        [_stream addDelegate:self delegateQueue:dispatch_get_main_queue()];

        NSArray *accounts = [SSKeychain accountsForService:@"XMPP"];
        if (accounts) {
            NSDictionary *account = accounts[0];
            self.jabberID = account[@"acct"];
            self.password = [SSKeychain passwordForService:@"XMPP" account:self.jabberID];
        }
    }
    return self;
}

#pragma mark - Properties

- (void)setJabberID:(NSString *)jabberID {
    _jabberID = [jabberID copy];
    _stream.myJID = [XMPPJID jidWithString:jabberID];
}

#pragma mark - Actions

- (void)connect {
    if (!self.jabberID) {
        [[NSNotificationCenter defaultCenter] postNotificationName:@"XMPPStreamNotAuthorizedNotificationName" object:nil];
        return;
    }
    if ([_stream isConnected]) {
        [_stream disconnect];
    }
    [_stream connect:nil];
}

- (void)goOnline {
	XMPPPresence *presence = [XMPPPresence presence];
	[_stream sendElement:presence];
}

- (void)sendMessage:(NSString *)message toUser:(NSString *)user {
    NSXMLElement *body = [NSXMLElement elementWithName:@"body"];
    [body setStringValue:message];

    NSXMLElement *messageElement = [NSXMLElement elementWithName:@"message"];
    [messageElement addAttributeWithName:@"type" stringValue:@"chat"];
    [messageElement addAttributeWithName:@"to" stringValue:user];
    [messageElement addChild:body];

    [_stream sendElement:messageElement];
}

#pragma mark - XMPPStreamDelelgate methods

- (void)xmppStreamDidDisconnect:(XMPPStream *)sender withError:(NSError *)error {
    NSLog(@"%@", error);
}

- (void)xmppStreamDidConnect:(XMPPStream *)sender {
    [_stream authenticateWithPassword:self.password error:nil];
}

- (void)xmppStreamDidAuthenticate:(XMPPStream *)sender {
    [self goOnline];
}

- (void)xmppStream:(XMPPStream *)sender socketDidConnect:(GCDAsyncSocket *)socket {

}


- (void)xmppStream:(XMPPStream *)sender didNotAuthenticate:(DDXMLElement *)error {
    // TODO: check for more errors
    [[NSNotificationCenter defaultCenter] postNotificationName:@"XMPPStreamNotAuthorizedNotificationName" object:nil];
}

- (void)xmppStream:(XMPPStream *)sender didReceiveMessage:(XMPPMessage *)message {
    [Message objectWithXMLRepresentation:message];
}

- (void)xmppStream:(XMPPStream *)sender didSendMessage:(XMPPMessage *)message {
    [Message objectWithXMLRepresentation:message];
}

- (void)xmppStream:(XMPPStream *)sender didReceivePresence:(XMPPPresence *)presence {
    [Presence objectWithXMLRepresentation:presence];
}

@end
