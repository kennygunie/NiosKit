//
//  NKCircularImageView.m
//  Pods
//
//  Created by Kien NGUYEN on 25/09/2015.
//
//

#import "NKCircularImageView.h"
#import "UIView+NiosKit.h"

@implementation NKCircularImageView

- (void)layoutSubviews {
    [super layoutSubviews];
    [self transformCircle];
}

@end
