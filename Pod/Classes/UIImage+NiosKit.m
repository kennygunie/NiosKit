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

+ (instancetype)imageWithImage:(UIImage*)sourceImage scaledToLength:(CGFloat)length
{
    CGFloat scaleFactor = sourceImage.size.width > sourceImage.size.height
    ? length / sourceImage.size.width
    : length / sourceImage.size.height;
    CGFloat newHeight = sourceImage.size.height * scaleFactor;
    CGFloat newWidth = sourceImage.size.width * scaleFactor;
    UIGraphicsBeginImageContext(CGSizeMake(newWidth, newHeight));
    [sourceImage drawInRect:CGRectMake(0, 0, newWidth, newHeight)];
    UIImage *newImage = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    return newImage;
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
