//
//  Message.h
//  Peer
//
//  Created by leafduo on 3/30/13.
//  Copyright (c) 2013 leafduo.com. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <CoreData/CoreData.h>

@class Buddy;
@class XMPPMessage;

@interface Message : SSManagedObject

@property (nonatomic, retain) NSString * body;
@property (nonatomic) NSTimeInterval createdAt;
@property (nonatomic, retain) Buddy *sender;

+ (instancetype)objectWithXMLRepresentation:(XMPPMessage *)xmppMessage;

@end
