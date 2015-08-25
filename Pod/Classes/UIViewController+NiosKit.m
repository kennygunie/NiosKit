//
//  UIViewController+NiosKit.m
//  Pods
//
//  Created by Kien NGUYEN on 26/08/2015.
//
//

#import "UIViewController+NiosKit.h"
#import "UIView+NiosKit.h"
#import "UIStoryboard+NiosKit.h"

@implementation UIViewController (NiosKit)

+ (instancetype)viewController {
    return [[UIStoryboard mainStoryboard] instantiateViewControllerWithIdentifier:NSStringFromClass([self class])];
}

-(void)addChildViewController:(UIViewController*)viewController
                  inContainer:(UIView*)containerView {
    [self addChildViewController:viewController];
    [containerView addAndLayoutSubview:viewController.view];
    [viewController didMoveToParentViewController:self];
}


- (void)swapToController:(UIViewController*)toViewController
             inContainer:(UIView*)containerView
                animated:(BOOL)animated {
    UIViewController *fromViewController = self.childViewControllers.firstObject;
    
    [fromViewController willMoveToParentViewController:nil];
    [self addChildViewController:toViewController];
    
    if (fromViewController && animated) {
        [self transitionFromViewController:fromViewController
                          toViewController:toViewController
                                  duration:0.5f
                                   options:UIViewAnimationOptionCurveEaseInOut | UIViewAnimationOptionTransitionCrossDissolve
                                animations:^{}
                                completion:^(BOOL finished) {
                                    [fromViewController removeFromParentViewController];
                                    [toViewController didMoveToParentViewController:self];
                                }];
    } else {
        [containerView addAndLayoutSubview:toViewController.view];
        [toViewController didMoveToParentViewController:self];
        [fromViewController removeFromParentViewController];
        [fromViewController.view removeFromSuperview];
    }
}

@end
