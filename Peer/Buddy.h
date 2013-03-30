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

@interface Buddy : PRManagedObject

@property (nonatomic, copy) NSString * identifier;
@property (nonatomic, retain) NSString * show;
@property (nonatomic, retain) NSString * status;
@property (nonatomic, retain) NSSet *sent;
@property (nonatomic, retain) NSSet *presences;

- (void)updateStatus;

@end

@interface Buddy (CoreDataGeneratedAccessors)

- (void)addSentObject:(Message *)value;
- (void)removeSentObject:(Message *)value;
- (void)addSent:(NSSet *)values;
- (void)removeSent:(NSSet *)values;

- (void)addPresencesObject:(Presence *)value;
- (void)removePresencesObject:(Presence *)value;
- (void)addPresences:(NSSet *)values;
- (void)removePresences:(NSSet *)values;

@end
