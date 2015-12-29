//
//  UIImage+NiosKit.m
//  Pods
//
//  Created by Kien NGUYEN on 25/08/2015.
//
//

#import "UIImage+NiosKit.h"

@implementation UIImage (NiosKit)

+ (instancetype)templateImageNamed:(NSString *)imageName {
    return [[UIImage imageNamed:imageName] imageWithRenderingMode:UIImageRenderingModeAlwaysTemplate];
}

- (instancetype)scaleToFillLength:(CGFloat)length
{
    CGFloat scaleFactor = self.size.width > self.size.height
    ? length / self.size.width
    : length / self.size.height;
    CGFloat newHeight = self.size.height * scaleFactor;
    CGFloat newWidth = self.size.width * scaleFactor;
    UIGraphicsBeginImageContext(CGSizeMake(newWidth, newHeight));
    [self drawInRect:CGRectMake(0, 0, newWidth, newHeight)];
    UIImage *newImage = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    return newImage;
}

- (instancetype)autorotateImage {
    if (self.size.width > self.size.height) {
        return [UIImage imageWithCGImage:self.CGImage
                                   scale:1.f
                             orientation:UIImageOrientationRight];
    }
    return self;
}

+ (instancetype)imageWithColor:(UIColor *)color {
    CGRect rect = CGRectMake(0, 0, 1, 1);
    UIGraphicsBeginImageContext(rect.size);
    CGContextRef context = UIGraphicsGetCurrentContext();
    CGContextSetFillColorWithColor(context, [color CGColor]);
    CGContextFillRect(context, rect);
    UIImage *image = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    return image;
}

@end
