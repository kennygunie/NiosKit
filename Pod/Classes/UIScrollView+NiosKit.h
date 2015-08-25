//
//  UIScrollView+NiosKit.h
//  Pods
//
//  Created by Kien NGUYEN on 25/08/2015.
//
//

#import <UIKit/UIKit.h>

@interface UIScrollView (NiosKit)

- (void)setupZoomForViewSize:(CGSize)viewSize
                   imageSize:(CGSize)imageSize;
- (void)centerWithViewSize:(CGSize)viewSize
                 imageSize:(CGSize)imageSize;

@end
