//
//  NKLogFormatter.m
//  Pods
//
//  Created by Kien Nguyen on 26/08/15.
//
//

#import "NKLogFormatter.h"

@implementation NKLogFormatter

- (id)init
{
    if((self = [super init]))
    {
        threadUnsafeDateFormatter = [[NSDateFormatter alloc] init];
        [threadUnsafeDateFormatter setFormatterBehavior:NSDateFormatterBehaviorDefault];
        [threadUnsafeDateFormatter setDateFormat:@"yyyy-MM-dd HH:mm:ss:SSS"];
    }
    return self;
}

- (NSString *)formatLogMessage:(DDLogMessage *)logMessage
{
    NSString *logLevel;
    switch (logMessage->_flag)
    {
        case DDLogFlagError    : logLevel    = @"E"; break;
        case DDLogFlagWarning  : logLevel    = @"W"; break;
        case DDLogFlagInfo     : logLevel    = @"I"; break;
        case DDLogFlagDebug    : logLevel    = @"D"; break;
        default                : logLevel    = @"V"; break;
    }
    
    NSString *dateAndTime = [threadUnsafeDateFormatter stringFromDate:(logMessage->_timestamp)];
    NSString *logMsg = logMessage->_message;
    
    return [NSString stringWithFormat:@"%@ %@ | %@", dateAndTime, logLevel, logMsg];
}

- (void)didAddToLogger:(id <DDLogger>)logger
{
    loggerCount++;
    NSAssert(loggerCount <= 1, @"This logger isn't thread-safe");
}
- (void)willRemoveFromLogger:(id <DDLogger>)logger
{
    loggerCount--;
}

@end
