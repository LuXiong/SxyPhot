//
//  NSString+CustomUtils.h
//  coyote
//
//  Created by LeoHao on 14/11/3.
//  Copyright (c) 2014年 500wan. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <CoreFoundation/CoreFoundation.h>

@interface NSString (CustomUtils)

- (NSString *)URLEncodedString;
- (NSString*)URLDecodedString;


/**
 @desc      是否为可用字符串
 @author    Created by LeoHao on 2014-12-8
 */
+(BOOL)isAvailableString:(NSString *)string;


-(NSUInteger)occurrencesOfSubString:(NSString *)subString;
-(NSUInteger)lengthOfBracket;
//去除左侧开始的指定字符
- (NSString *)stringByTrimmingLeftCharactersInSet:(NSCharacterSet *)characterSet;
//去除字符串尾端指定字符
- (NSString *)stringByTrimmingRightCharactersInSet:(NSCharacterSet *)characterSet;


@end
