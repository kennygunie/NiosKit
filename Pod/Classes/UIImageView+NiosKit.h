//
//  UIImageView+NiosKit.h
//  Pods
//
//  Created by Kien NGUYEN on 25/08/2015.
//
//

#import <UIKit/UIKit.h>

@interface UIImageView (NiosKit)

- (void)setupRenderingModeTemplate;
- (void)setupRenderingModeTemplateWithColor:(UIColor *)color;
- (void)cropCircular;

@end
