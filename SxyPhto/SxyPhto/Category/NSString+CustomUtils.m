//
//  NSString+CustomUtils.m
//  coyote
//
//  Created by LeoHao on 14/11/3.
//  Copyright (c) 2014年 500wan. All rights reserved.
//

#import "NSString+CustomUtils.h"

@implementation NSString (CustomUtils)

- (NSString *)URLEncodedString
{
    if (![NSString isAvailableString:self]) {
        return @"";
    }
    
    NSString *str_toEncode = self;
    
    if ([[str_toEncode componentsSeparatedByString:@"%3A"] count] > 1||[[str_toEncode componentsSeparatedByString:@"%2F"] count] > 1) {
        return self;
    }
    
    BOOL bl_isUrl = true;
    if (![str_toEncode hasPrefix:@"http"]){
        str_toEncode = [NSString stringWithFormat:@"http://encodeSeparator%@",self];
        bl_isUrl = false;
    }
    NSString *result = (NSString *)
    CFBridgingRelease(CFURLCreateStringByAddingPercentEscapes(kCFAllocatorDefault,
                                                              (CFStringRef)str_toEncode,
                                                              NULL,
                                                              CFSTR("!*'();:@&=+$,/?%#[] "),
                                                              kCFStringEncodingUTF8));
    if (bl_isUrl == false) {
        result = [result componentsSeparatedByString:@"encodeSeparator"][1];
    }
    
    return result;
}


- (NSString*)URLDecodedString
{
    if (![NSString isAvailableString:self]) {
        return @"";
    }
    
    
    NSString *result = self,*str_toDecode = self;
    BOOL bl_isUrl = true;
    if (![str_toDecode hasPrefix:@"http"]) {
        str_toDecode = [NSString stringWithFormat:@"http://encodeSeparator%@",str_toDecode];
        bl_isUrl = false;
    }
    
    @try {
        result = (NSString *)
        CFBridgingRelease(CFURLCreateStringByReplacingPercentEscapesUsingEncoding(kCFAllocatorDefault,
                                                                                  (CFStringRef)str_toDecode,
                                                                                  CFSTR(""),
                                                                                  kCFStringEncodingUTF8));
    }
    @catch (NSException *exception) {
        
    }
    if (bl_isUrl == false) {
        result = [result componentsSeparatedByString:@"encodeSeparator"][1];
    }
    
    return result;
}

/**
 @desc      是否为可用字符串
 @author    Created by LeoHao on 2014-12-8
 */
+(BOOL)isAvailableString:(NSString *)string{
    if (!string || ![string isKindOfClass:[NSString class]] || [string length]==0) {
        return false;
    }
    return true;
}


-(NSUInteger)occurrencesOfSubString:(NSString *)subString
{
    if (![NSString isAvailableString:self] || ![NSString isAvailableString:subString]) {
        return 0;
    }
    
    
    NSUInteger strCount = [self length] - [[self stringByReplacingOccurrencesOfString:subString withString:@""] length];
    return strCount;
}

-(NSUInteger)lengthOfBracket
{
    if (![NSString isAvailableString:self]) {
        return 0;
    }
    
    NSString *pattern = @"\\[\\w+\\]";
    NSString *cleaned =   [self stringByReplacingOccurrencesOfString: pattern
                                                          withString: @""
                                                             options: NSRegularExpressionSearch
                                                               range: NSMakeRange(0, self.length)];
    
    NSUInteger strCount = [self length] - cleaned.length;
    return strCount;
}

/**
 @desc      去除字符串开头指定的字符
 @author    Created by LeoHao on 2015-6-15
 */
- (NSString *)stringByTrimmingLeftCharactersInSet:(NSCharacterSet *)characterSet {
    NSUInteger location = 0;
    NSUInteger length = [self length];
    unichar charBuffer[length];
    [self getCharacters:charBuffer];
    
    for (location; location < length; location++) {
        if (![characterSet characterIsMember:charBuffer[location]]) {
            break;
        }
    }
    
    return [self substringWithRange:NSMakeRange(location, length - location)];
}


/**
 @desc      去除字符串尾端指定的字符
 @author    Created by LeoHao on 2015-6-15
 */
- (NSString *)stringByTrimmingRightCharactersInSet:(NSCharacterSet *)characterSet {
    NSUInteger location = 0;
    NSUInteger length = [self length];
    unichar charBuffer[length];
    [self getCharacters:charBuffer];
    
    for (length; length > 0; length--) {
        if (![characterSet characterIsMember:charBuffer[length - 1]]) {
            break;
        }
    }
    
    return [self substringWithRange:NSMakeRange(location, length - location)];
}



@end
