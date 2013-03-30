//
//  PRChatViewController.h
//  Peer
//
//  Created by leafduo on 3/31/13.
//  Copyright (c) 2013 leafduo.com. All rights reserved.
//

#import <UIKit/UIKit.h>

@class Buddy;

@interface PRChatViewController : UIViewController<UITextViewDelegate>

@property (nonatomic, strong) Buddy* buddy;

@end
