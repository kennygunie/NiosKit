//
//  UIViewController+NiosKit.h
//  Pods
//
//  Created by Kien NGUYEN on 26/08/2015.
//
//

#import <UIKit/UIKit.h>

@interface UIViewController (NiosKit)

+ (instancetype)viewController;
- (void)addChildViewController:(UIViewController*)viewController
                   inContainer:(UIView*)containerView;
- (void)swapToController:(UIViewController*)toViewController
             inContainer:(UIView*)containerView
                animated:(BOOL)animated;

@end
