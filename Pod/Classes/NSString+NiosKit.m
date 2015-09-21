//
//  NSString+NiosKit.m
//  Pods
//
//  Created by Kien Nguyen on 21/09/15.
//
//

#import "NSString+NiosKit.h"

@implementation NSString (NiosKit)

- (NSString *)trim {
    return [self stringByTrimmingCharactersInSet:[NSCharacterSet whitespaceAndNewlineCharacterSet]];
}

- (BOOL)isValidEmailAddress
{
    // http://stackoverflow.com/questions/3139619/check-that-an-email-address-is-valid-on-ios
    NSString *emailRegex = @"[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,4}";
    NSPredicate *emailTest = [NSPredicate predicateWithFormat:@"SELF MATCHES %@", emailRegex];
    return [emailTest evaluateWithObject:self];
}

@end
