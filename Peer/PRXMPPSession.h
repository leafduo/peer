//
//  PRXMPPSession.h
//  Peer
//
//  Created by leafduo on 3/29/13.
//  Copyright (c) 2013 leafduo.com. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "XMPP.h"

@interface PRXMPPSession : NSObject<XMPPStreamDelegate>

@property (nonatomic, copy) NSString *jabberID;
@property (nonatomic, copy) NSString *password;

+ (instancetype)sharedSession;
- (void)connect;
- (void)sendMessage:(NSString *)message toUser:(NSString *)user;

@end
