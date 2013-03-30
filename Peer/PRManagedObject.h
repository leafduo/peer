//
//  PRManagedObject.h
//  Peer
//
//  Created by leafduo on 3/31/13.
//  Copyright (c) 2013 leafduo.com. All rights reserved.
//

#import "SSManagedObject.h"

@interface PRManagedObject : SSManagedObject

@property (nonatomic, copy) NSString *identifier;

+ (id)objectWithIdentifier:(NSString *)identifier;
+ (id)existingObjectWithIdentifier:(NSString *)identifier;

@end
