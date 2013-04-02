//
//  PRLoginViewController.m
//  Peer
//
//  Created by leafduo on 4/2/13.
//  Copyright (c) 2013 leafduo.com. All rights reserved.
//

#import "PRLoginViewController.h"
#import <ReactiveCocoa/ReactiveCocoa.h>
#import "PRXMPPSession.h"
#import "SSKeychain.h"

@interface PRLoginViewController ()

@property (nonatomic, strong) IBOutlet UITextField *usernameField;
@property (nonatomic, strong) IBOutlet UITextField *passwordField;
@property (nonatomic, strong) IBOutlet UIButton *loginButton;

@end

@implementation PRLoginViewController

- (void)viewDidLoad {
    self.usernameField.text = [[PRXMPPSession sharedSession] jabberID];
    self.passwordField.text = [[PRXMPPSession sharedSession] password];

    RAC(self.loginButton.enabled) = [RACSignal combineLatest:@[self.usernameField.rac_textSignal, self.passwordField.rac_textSignal] reduce:^(NSString *username, NSString *password) {
        return @(username.length && password.length);
    }];
}

- (IBAction)login:(id)sender {
    [[PRXMPPSession sharedSession] setJabberID:self.usernameField.text];
    [[PRXMPPSession sharedSession] setPassword:self.passwordField.text];
    [self deleteAllAccounts];
    [SSKeychain setPassword:self.passwordField.text forService:@"XMPP" account:self.usernameField.text];
    [[PRXMPPSession sharedSession] connect];
    [self dismissViewControllerAnimated:YES completion:nil];
}

- (void)deleteAllAccounts {
    for (NSDictionary *account in [SSKeychain accountsForService:@"XMPP"]) {
        [SSKeychain deletePasswordForService:@"XMPP" account:account[@"acct"]];
    }
}

@end
