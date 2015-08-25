//
//  UIImage+NiosKit.m
//  Pods
//
//  Created by Kien NGUYEN on 25/08/2015.
//
//

#import "UIImage+NiosKit.h"

@implementation UIImage (NiosKit)

+ (UIImage *)templateImageNamed:(NSString *)imageName {
    return [[UIImage imageNamed:imageName] imageWithRenderingMode:UIImageRenderingModeAlwaysTemplate];
}

+ (UIImage *)imageWithImage:(UIImage*)sourceImage scaledToLength:(CGFloat)length
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

@end
