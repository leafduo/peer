//
//  Presence.h
//  Peer
//
//  Created by leafduo on 3/30/13.
//  Copyright (c) 2013 leafduo.com. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <CoreData/CoreData.h>

@class Buddy;
@class XMPPPresence;

@interface Presence : PRManagedObject

@property (nonatomic, copy) NSString * identifier;
@property (nonatomic, retain) NSString * show;
@property (nonatomic, retain) NSString * status;
@property (nonatomic, retain) Buddy *owner;

+ (instancetype)objectWithXMLRepresentation:(XMPPPresence *)xmppPresence;

@end
