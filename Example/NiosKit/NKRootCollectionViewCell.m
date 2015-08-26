//
//  NKRootCollectionViewCell.m
//  NiosKit
//
//  Created by Kien NGUYEN on 26/08/2015.
//  Copyright (c) 2015 Kien Nguyen. All rights reserved.
//

#import "NKRootCollectionViewCell.h"

@interface NKRootCollectionViewCell ()
@property (weak, nonatomic) IBOutlet UILabel *textLabel;

@end

@implementation NKRootCollectionViewCell

- (void)setText:(NSString *)text {
    self.textLabel.text = text;
}

@end
