//
//  UIView+NiosKit.m
//  NiosKit
//
//  Created by Kien NGUYEN on 26/09/2014.
//  Copyright (c) 2014 NiosKit. All rights reserved.
//

#pragma mark - Imports

#import "UIView+NiosKit.h"

#pragma mark - Implementation

@implementation UIView (Utils)

#pragma mark - Custom Accessors

#pragma mark - Public methods

- (void)loadXib {
    NSArray *views = [[NSBundle mainBundle] loadNibNamed:NSStringFromClass([self class])
                                                   owner:self
                                                 options:nil];
    UIView *root = [views firstObject];
    [self addAndLayoutSubview:root];
}

- (void)addAndLayoutSubview:(UIView*)subview sendToBack:(BOOL)sendToBack {
    
    [subview setTranslatesAutoresizingMaskIntoConstraints:NO];
    [self addSubview:subview];
    [self addConstraints:ConstraintsWithVisualFormatAndViews(@"H:|[subview]|", subview)];
    [self addConstraints:ConstraintsWithVisualFormatAndViews(@"V:|[subview]|", subview)];
    if (sendToBack) {
        [self sendSubviewToBack:subview];
    }
}

- (void)addAndLayoutSubview:(UIView*)subview {
    [self addAndLayoutSubview:subview sendToBack:NO];
}


- (void)addSoftShadow {
    self.layer.shadowOpacity = .6f;
    self.layer.shadowRadius = 3.f;
    self.layer.shadowColor = [UIColor blackColor].CGColor;
    self.layer.shadowOffset = CGSizeMake(0.0, 0.0);
}

- (void)addShadow {
    self.layer.shadowOpacity = .9f;
    self.layer.shadowRadius = .7f;
    self.layer.shadowColor = [UIColor blackColor].CGColor;
    self.layer.shadowOffset = CGSizeMake(0.0, 0.0);
}

-(void)setRoundedCorners:(UIRectCorner)corners radius:(CGFloat)radius {
    CGRect bounds = self.bounds;
    // Create the path
    UIBezierPath *maskPath = [UIBezierPath bezierPathWithRoundedRect:bounds
                                                   byRoundingCorners:corners
                                                         cornerRadii:CGSizeMake(radius, radius)];
    
    CAShapeLayer *maskLayer = [CAShapeLayer layer];
    maskLayer.frame = bounds;
    maskLayer.path = maskPath.CGPath;
    
    // Set the newly created shape layer as the mask for the view's layer
    self.layer.mask = maskLayer;
}

-(void)setRoundedEdge:(UIRectEdge)edge
           ovalHeight:(CGFloat)ovalHeight
       ovalWidthDelta:(CGFloat)ovalWidthDelta {
    
    [self layoutIfNeeded];
    
    CGRect bounds = self.bounds;
    CGRect rectBounds = CGRectZero;
    CGRect ovalBounds = CGRectZero;
    
    switch (edge) {
        case UIRectEdgeTop:
            ovalBounds = CGRectMake(bounds.origin.x - ovalWidthDelta/2,
                                    bounds.origin.y,
                                    bounds.size.width + ovalWidthDelta,
                                    ovalHeight);
            
            rectBounds = CGRectMake(bounds.origin.x,
                                    bounds.origin.y + ovalBounds.size.height/2,
                                    bounds.size.width,
                                    2000);
            break;
        case UIRectEdgeBottom:
            ovalBounds = CGRectMake(bounds.origin.x - ovalWidthDelta/2,
                                    bounds.origin.y + bounds.size.height - ovalHeight,
                                    bounds.size.width + ovalWidthDelta,
                                    ovalHeight);
            
            rectBounds = CGRectMake(bounds.origin.x,
                                    bounds.origin.y - ovalBounds.size.height/2,
                                    bounds.size.width,
                                    2000);
            break;
            
        default:
            break;
    }
    
    
    UIBezierPath *rectPath = [UIBezierPath bezierPathWithRect:rectBounds];
    UIBezierPath *ovalPath = [UIBezierPath bezierPathWithOvalInRect:ovalBounds];
    [rectPath appendPath:ovalPath];
    
    // Create the shape layer and set its path
    CAShapeLayer *maskLayer = [CAShapeLayer layer];
    maskLayer.frame = bounds;
    maskLayer.path = rectPath.CGPath;
    
    // Set the newly created shape layer as the mask for the view's layer
    self.layer.mask = maskLayer;
}

- (void)transformCircle {
    self.layer.cornerRadius = CGRectGetWidth(self.frame) / 2;
    self.layer.masksToBounds = NO;
}

#pragma mark - Private methods

@end
