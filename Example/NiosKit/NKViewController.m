//
//  NKViewController.m
//  NiosKit
//
//  Created by Kien Nguyen on 08/25/2015.
//  Copyright (c) 2015 Kien Nguyen. All rights reserved.
//

#import "NKViewController.h"

@interface NKViewController ()

@end

@implementation NKViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Logs
    DDLogError(@"This is error log");
    DDLogWarn(@"This is warning log");
    DDLogInfo(@"This is info log");
    DDLogDebug(@"This is debug log");
    DDLogVerbose(@"This is verbose log");
    
    // Error
    NSError *error = [NSError errorWithDomain:@"Test error domain"
                                         code:42
                                     userInfo:@{@"key1":@"info 1",
                                                @"key2":@"info 2"}];
    [error logWithReason:@"Reason 1"];
    [error log:@"Reason %@, reason %@", @2, @3];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
