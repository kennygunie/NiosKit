//
//  NSError+NiosKit.m
//  Pods
//
//  Created by Kien NGUYEN on 25/08/2015.
//
//

#import "NSError+NiosKit.h"
#import <CocoaLumberjack/CocoaLumberjack.h>

#ifndef ddLogLevel
#define ddLogLevel 0
#endif

@implementation NSError (NiosKit)

- (void)log:(NSString *)format, ... {
    va_list args;
    va_start(args, format);
    NSString *reason = [[NSString alloc] initWithFormat:format arguments:args];
    [self logWithReason:reason];
    va_end(args);
}

- (void)logWithReason:(NSString *)reason {
    DDLogError(@"%@\n\nReason:\n%@\n---\n",
               self.debugDescription,
               reason);
}

@end
