//
//  UIImageView+NiosKit.m
//  Pods
//
//  Created by Kien NGUYEN on 25/08/2015.
//
//

#import "UIImageView+NiosKit.h"

@implementation UIImageView (NiosKit)

- (void)setupRenderingModeTemplate {
    self.image = [self.image imageWithRenderingMode:UIImageRenderingModeAlwaysTemplate];
}

- (void)setAutoFitImage:(UIImage *)image {
    if (image.size.width > image.size.height) {
        self.image = [UIImage imageWithCGImage:image.CGImage
                                         scale:1.f
                                   orientation:UIImageOrientationRight];
    } else {
        self.image = image;
    }
}

@end
