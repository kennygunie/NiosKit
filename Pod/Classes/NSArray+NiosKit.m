//
//  NSArray+NiosKit.m
//  Pods
//
//  Created by Kien Nguyen on 26/08/15.
//
//

#import "NSArray+NiosKit.h"

@implementation NSArray (NiosKit)

- (NSArray *)reversedArray {
    return [[self reverseObjectEnumerator] allObjects];
}

- (id)randomObject {
    NSUInteger count = [self count];  
    return count ? self[arc4random_uniform((u_int32_t)count)] : nil;
}

@end
