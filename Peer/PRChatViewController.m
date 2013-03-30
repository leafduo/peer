//
//  PRChatViewController.m
//  Peer
//
//  Created by leafduo on 3/31/13.
//  Copyright (c) 2013 leafduo.com. All rights reserved.
//

#import "PRChatViewController.h"
#import "Buddy.h"
#import "PRXMPPSession.h"

@interface PRChatViewController ()

@property (nonatomic, strong) UITextView *inputView;

@end

@implementation PRChatViewController

#pragma mark - UIView methods

- (void)viewDidLoad {
    self.title = self.buddy.identifier;
}

#pragma mark - UITextViewDelegate methods

- (BOOL)textView:(UITextView *)textView shouldChangeTextInRange:(NSRange)range replacementText:(NSString *)text {
    if ([text isEqualToString:@"\n"]) {
        [textView resignFirstResponder];
        [[PRXMPPSession sharedSession] sendMessage:textView.text toUser:self.buddy.identifier];
        textView.text = nil;
        return NO;
    }
    return YES;
}

@end
