//
//  UIImage+NiosKit.h
//  Pods
//
//  Created by Kien NGUYEN on 25/08/2015.
//
//

#import <UIKit/UIKit.h>

@interface UIImage (NiosKit)

+ (instancetype)templateImageNamed:(NSString *)imageName;
+ (instancetype)imageWithImage:(UIImage*)sourceImage scaledToLength:(CGFloat)newWidth;
+ (instancetype)imageWithColor:(UIColor *)color;

@end
