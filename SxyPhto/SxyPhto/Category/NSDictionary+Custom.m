//
//  NSDictionary+Custom.m
//  coyote
//
//  Created by LeoHao on 14/12/17.
//  Copyright (c) 2014年 500wan. All rights reserved.
//

#import "NSDictionary+Custom.h"

@implementation NSDictionary (Custom)

/**
 @desc      检查字典是否为可用的有效的字典
 @author    Created by LeoHao on 2014-12-17
 */
+(BOOL)isAvailableDictionary:(id)dictionary{
    if (dictionary == nil) {
        return false;
    }
    if (![dictionary isKindOfClass:[NSDictionary class]]) {
        return false;
    }
    if ([dictionary allKeys].count == 0) {
        return false;
    }
    return true;
}

@end
