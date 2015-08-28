//
//  NSArray+NiosKit.m
//  Pods
//
//  Created by Kien Nguyen on 26/08/15.
//
//

#import "NSArray+NiosKit.h"

@implementation NSArray (NiosKit)

- (NSArray *)reversedArray
{
    return [[self reverseObjectEnumerator] allObjects];
}

@end
