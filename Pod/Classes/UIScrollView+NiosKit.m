//
//  UIScrollView+NiosKit.m
//  Pods
//
//  Created by Kien NGUYEN on 25/08/2015.
//
//

#import "UIScrollView+NiosKit.h"

@implementation UIScrollView (NiosKit)

- (void)setupZoomForViewSize:(CGSize)viewSize
                   imageSize:(CGSize)imageSize {
    CGFloat viewWidth = viewSize.width;
    CGFloat viewHeight = viewSize.height;
    CGFloat widthScale =  viewWidth / imageSize.width;
    CGFloat heightScale = viewHeight / imageSize.height;
    self.minimumZoomScale = widthScale;
    self.zoomScale = heightScale;
    self.contentOffset = CGPointMake((imageSize.width - viewWidth)/2, 0.f);
}

- (void)centerWithViewSize:(CGSize)viewSize
                 imageSize:(CGSize)imageSize {
    
    CGSize realImgSize = CGSizeMake(viewSize.width, viewSize.width / imageSize.width * imageSize.height);
    CGFloat offx = (viewSize.width > realImgSize.width ? (viewSize.width - realImgSize.width) / 2 : 0);
    CGFloat offy = (viewSize.height > realImgSize.height ? (viewSize.height + 80 - realImgSize.height) / 2 : 0);
    
    // don't animate the change
    UIEdgeInsets insets = UIEdgeInsetsMake(offy, offx, offy, offx);
    self.contentInset = insets;
    
}

@end
