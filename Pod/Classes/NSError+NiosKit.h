//
//  NSError+NiosKit.h
//  Pods
//
//  Created by Kien NGUYEN on 25/08/2015.
//
//

#import <Foundation/Foundation.h>

@interface NSError (NiosKit)

- (void)logWithReason:(NSString *)reason;
- (void)log:(NSString *)format, ...;

@end
