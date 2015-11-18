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

- (void)setupRenderingModeTemplateWithColor:(UIColor *)color {
    [self setupRenderingModeTemplate];
    self.tintColor = color;
}

- (void)cropCircular {
    if (!self.image) {
        return;
    }
    

    UIGraphicsBeginImageContextWithOptions(self.bounds.size, NO, 1.0);
    
    // Add a clip before drawing anything, in the shape of an rounded rect
    [[UIBezierPath bezierPathWithRoundedRect:self.bounds
                                cornerRadius:CGRectGetWidth(self.bounds)/2] addClip];
    // Draw your image
    [self.image drawInRect:self.bounds];
    
    // Get the image, here setting the UIImageView image
    self.image = UIGraphicsGetImageFromCurrentImageContext();
    
    // Lets forget about that we were drawing
    UIGraphicsEndImageContext();
}

@end
