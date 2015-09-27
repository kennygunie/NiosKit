//
//  NSArray+NiosKit.h
//  Pods
//
//  Created by Kien Nguyen on 26/08/15.
//
//

#import <Foundation/Foundation.h>

@interface NSArray (NiosKit)

/**
 Gives a new NSArray with same objects, but indexes are reversed ...
 ie: the first item will become the last, the last the first, etc.
 */
- (NSArray *)reversedArray;
- (id)randomObject;


@end
