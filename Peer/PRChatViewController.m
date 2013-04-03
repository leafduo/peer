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

#pragma mark - UIViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.title = self.buddy.identifier;

    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(shortenViewForKeyboard:) name:UIKeyboardWillShowNotification object:nil];
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(restoreViewSize:) name:UIKeyboardWillHideNotification object:nil];
}

- (void)viewWillDisappear:(BOOL)animated {
    [super viewWillDisappear:animated];
    [[NSNotificationCenter defaultCenter] removeObserver:self];
}

- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    if ([[segue identifier] isEqualToString:@"embedMessageList"]) {
        [[segue destinationViewController] setBuddy:self.buddy];
    }
}


#pragma mark - UITextViewDelegate methods

- (BOOL)textView:(UITextView *)textView shouldChangeTextInRange:(NSRange)range replacementText:(NSString *)text {
    if ([text isEqualToString:@"\n"]) {
        [[PRXMPPSession sharedSession] sendMessage:textView.text toUser:self.buddy.identifier];
        textView.text = nil;
        return NO;
    }
    return YES;
}

#pragma mark Keyboard handling methods

- (void)shortenViewForKeyboard:(NSNotification *)notification {
    NSTimeInterval interval = [notification.userInfo[UIKeyboardAnimationDurationUserInfoKey] doubleValue];
    float endKeyboardHeight = [notification.userInfo[UIKeyboardFrameEndUserInfoKey] CGRectValue].size.height;
    float beginKeyboardHeight = [notification.userInfo[UIKeyboardFrameBeginUserInfoKey] CGRectValue].size.height;
    [UIView animateWithDuration:interval animations:^{
        if (beginKeyboardHeight == endKeyboardHeight) {
            self.view.frame = CGRectMake(0, 0, 320, self.view.frame.size.height - endKeyboardHeight);
        } else {
            self.view.frame = CGRectMake(0, 0, 320, self.view.frame.size.height - (endKeyboardHeight - beginKeyboardHeight));
        }
    }];
//    [self.view scrollToBottomAnimated:YES];
}

- (void)restoreViewSize:(NSNotification *)notification {
    NSTimeInterval interval = [notification.userInfo[UIKeyboardAnimationDurationUserInfoKey] doubleValue];
    float keyboardHeight = [notification.userInfo[UIKeyboardFrameEndUserInfoKey] CGRectValue].size.height;
    [UIView animateWithDuration:interval animations:^{
        self.view.frame = CGRectMake(0, 0, 320, self.view.frame.size.height + keyboardHeight);
    }];
}

@end
