//
//  NKCircleView.m
//  Pods
//
//  Created by Kien NGUYEN on 10/10/2015.
//
//

#import "NKCircleView.h"
#import "UIView+NiosKit.h"

@implementation NKCircleView



//- (void)drawRect:(CGRect)rect
//{
//    self.backgroundColor = [UIColor clearColor];
//    CGContextRef ctx = UIGraphicsGetCurrentContext();
//    CGContextAddEllipseInRect(ctx, rect);
//    CGContextSetFillColor(ctx, CGColorGetComponents([self.tintColor CGColor]));
//    CGContextFillPath(ctx);
//}

- (void)awakeFromNib {
    [super awakeFromNib];
    //self.backgroundColor = [UIColor clearColor];
    [self transformCircle];
}

@end
