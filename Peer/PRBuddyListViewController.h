//
//  PRBuddyListViewController.h
//  Peer
//
//  Created by leafduo on 3/29/13.
//  Copyright (c) 2013 leafduo.com. All rights reserved.
//

#import <UIKit/UIKit.h>

#import <CoreData/CoreData.h>

@interface PRBuddyListViewController : UITableViewController <NSFetchedResultsControllerDelegate>

@property (strong, nonatomic) NSFetchedResultsController *fetchedResultsController;

@end
