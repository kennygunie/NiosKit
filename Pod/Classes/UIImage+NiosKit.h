//
//  UIImage+NiosKit.h
//  Pods
//
//  Created by Kien NGUYEN on 25/08/2015.
//
//

#import <UIKit/UIKit.h>

@interface UIImage (NiosKit)

+ (UIImage *)templateImageNamed:(NSString *)imageName;
+ (UIImage *)imageWithImage:(UIImage*)sourceImage scaledToLength:(CGFloat)newWidth;

@end
