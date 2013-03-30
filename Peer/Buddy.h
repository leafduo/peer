//
//  Buddy.h
//  Peer
//
//  Created by leafduo on 3/30/13.
//  Copyright (c) 2013 leafduo.com. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <CoreData/CoreData.h>

@class Message, Presence;

@interface Buddy : SSManagedObject

@property (nonatomic, retain) NSString * jid;
@property (nonatomic, retain) NSString * show;
@property (nonatomic, retain) NSString * status;
@property (nonatomic, retain) NSSet *sent;
@property (nonatomic, retain) NSSet *resources;
@end

@interface Buddy (CoreDataGeneratedAccessors)

- (void)addSentObject:(Message *)value;
- (void)removeSentObject:(Message *)value;
- (void)addSent:(NSSet *)values;
- (void)removeSent:(NSSet *)values;

- (void)addResourcesObject:(Presence *)value;
- (void)removeResourcesObject:(Presence *)value;
- (void)addResources:(NSSet *)values;
- (void)removeResources:(NSSet *)values;

@end
