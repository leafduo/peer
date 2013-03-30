//
//  PRManagedObject.m
//  Peer
//
//  Created by leafduo on 3/31/13.
//  Copyright (c) 2013 leafduo.com. All rights reserved.
//

#import "PRManagedObject.h"

@implementation PRManagedObject

@dynamic identifier;

+ (id)existingObjectWithIdentifier:(NSString *)identifier {
	// Create the fetch request for the ID
	NSFetchRequest *fetchRequest = [[NSFetchRequest alloc] init];
	fetchRequest.entity = [self entity];
	fetchRequest.predicate = [NSPredicate predicateWithFormat:@"identifier = %@", identifier];
	fetchRequest.fetchLimit = 1;

	// Execute the fetch request
	NSArray *results = [[SSManagedObject mainQueueContext] executeFetchRequest:fetchRequest error:nil];

	// If the object is not found, return nil
	if (results.count == 0) {
		return nil;
	}

	// Return the object
	return [results objectAtIndex:0];
}

+ (id)objectWithIdentifier:(NSString *)identifier {
    PRManagedObject *object = [self existingObjectWithIdentifier:identifier];
    if (!object) {
        object = [[self alloc] init];
        object.identifier = identifier;
    }
    return object;
}

@end
