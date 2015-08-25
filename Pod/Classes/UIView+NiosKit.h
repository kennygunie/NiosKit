//
//  UIView+NiosKit.h
//  NiosKit
//
//  Created by Kien NGUYEN on 26/09/2014.
//  Copyright (c) 2014 NiosKit. All rights reserved.
//

#pragma mark - Imports

#import <UIKit/UIKit.h>

#define ConstraintsWithVisualFormatAndViews(Format, ...) ([NSLayoutConstraint constraintsWithVisualFormat:Format options:0 metrics:nil views:NSDictionaryOfVariableBindings(__VA_ARGS__)])

#pragma mark - Interface

@interface UIView (Utils)

#pragma mark - Class Methods


#pragma mark - Instance Methods

- (void)loadXib;
- (void)addAndLayoutSubview:(UIView*)subview;
- (void)addAndLayoutSubview:(UIView*)subview sendToBack:(BOOL)sendToBack;
- (void)addShadow;
- (void)addSoftShadow;
- (void)setRoundedCorners:(UIRectCorner)corners radius:(CGFloat)radius;
- (void)setRoundedEdge:(UIRectEdge)edge
            ovalHeight:(CGFloat)heightDelta
        ovalWidthDelta:(CGFloat)widthDelta;
- (void)transformCircle;

@end
