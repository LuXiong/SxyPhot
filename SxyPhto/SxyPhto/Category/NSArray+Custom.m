//
//  NSArray+Custom.m
//  coyote
//
//  Created by LeoHao on 14/12/17.
//  Copyright (c) 2014年 500wan. All rights reserved.
//

#import "NSArray+Custom.h"

@implementation NSArray (Custom)

/**
 @desc      检查数据是否为有效的数组
 @author    Created by LeoHao on 2014-12-17
 */
+(BOOL)isAvailableArray:(id)array{
    if (!array) {
        return false;
    }
    if (![array isKindOfClass:[NSArray class]]) {
        return false;
    }
    if ([array count] == 0) {
        return false;
    }
    return true;
}

@end
