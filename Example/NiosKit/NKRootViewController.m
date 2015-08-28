//
//  NKViewController.m
//  NiosKit
//
//  Created by Kien Nguyen on 08/25/2015.
//  Copyright (c) 2015 Kien Nguyen. All rights reserved.
//

#import "NKRootViewController.h"
#import "NKRootCollectionViewCell.h"

@interface NKRootViewController () <UICollectionViewDataSource, UICollectionViewDelegate>

@property (nonatomic) NSArray *dataSource;

@end

@implementation NKRootViewController

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
    
    self.dataSource = @[@"show hide table view", @"other thing"];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - UICollectionViewDelegate

- (void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath {
    switch (indexPath.row) {
        case 0:
            [self performSegueWithIdentifier:@"menu1" sender:self];
            break;
            
        default:
            break;
    }
    
}

#pragma mark - UICollectionViewDataSource

- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section {
    return [self.dataSource count];
}

// The cell that is returned must be retrieved from a call to -dequeueReusableCellWithReuseIdentifier:forIndexPath:
- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath {
    NKRootCollectionViewCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:@"NKRootCollectionViewCell" forIndexPath:indexPath];
    cell.text = self.dataSource[indexPath.item];
    return cell;
}

@end
