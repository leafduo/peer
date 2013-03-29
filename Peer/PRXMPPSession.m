//
//  PRXMPPSession.m
//  Peer
//
//  Created by leafduo on 3/29/13.
//  Copyright (c) 2013 leafduo.com. All rights reserved.
//

#import "PRXMPPSession.h"
#import "XMPP.h"

@implementation PRXMPPSession {
    XMPPStream *_stream;
}

static PRXMPPSession *_sharedSession;

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
    }
    return self;
}

- (void)connect {
    [_stream connect:nil];
}

- (void)setJabberID:(NSString *)jabberID {
    _jabberID = [jabberID copy];
    _stream.myJID = [XMPPJID jidWithString:jabberID];
}

- (void)xmppStreamDidDisconnect:(XMPPStream *)sender withError:(NSError *)error {
    NSLog(@"%@", error);
}

- (void)xmppStreamDidConnect:(XMPPStream *)sender {
    [_stream authenticateWithPassword:self.password error:nil];
}

- (void)xmppStreamDidAuthenticate:(XMPPStream *)sender {
    
}

@end
