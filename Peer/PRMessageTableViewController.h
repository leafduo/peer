//
//  PRMessageTableViewController.h
//  Peer
//
//  Created by leafduo on 4/1/13.
//  Copyright (c) 2013 leafduo.com. All rights reserved.
//

#import <UIKit/UIKit.h>

@class Buddy;

@interface PRMessageTableViewController : UITableViewController <NSFetchedResultsControllerDelegate>

@property (nonatomic, strong) Buddy *buddy;

@end
