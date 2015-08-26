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
	// Test logs
    DDLogError(@"This is error log");
    DDLogWarn(@"This is warning log");
    DDLogInfo(@"This is info log");
    DDLogDebug(@"This is debug log");
    DDLogVerbose(@"This is verbose log");
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
