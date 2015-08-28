//
//  NKLogFormatter.h
//  Pods
//
//  Created by Kien Nguyen on 26/08/15.
//
//

#import <Foundation/Foundation.h>
#import <CocoaLumberjack/CocoaLumberjack.h>

@interface NKLogFormatter : NSObject <DDLogFormatter> {
    int loggerCount;
    NSDateFormatter *threadUnsafeDateFormatter;
}

@end
