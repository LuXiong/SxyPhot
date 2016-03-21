//
//  SP_M_CategoryName.m
//  SxyPhto
//
//  Created by XiongLu on 16/2/1.
//  Copyright © 2016年 yxtk. All rights reserved.
//

#import "SP_M_CategoryName.h"

@implementation SP_M_CategoryName

- (instancetype)initWithId:(NSString *)uid name:(NSString *)name
{
    self = [super init];
    if (self) {
        self.str_id = uid;
        self.str_name = name;
    }
    return self;
}

-(instancetype)initWithJsonString:(NSData *)json{
    self = [super init];
    if (self) {
        
        NSDictionary * dic = [[NSDictionary alloc] init];
        dic = [NSJSONSerialization JSONObjectWithData:json options:NSJSONReadingMutableLeaves error:nil];
        if ([NSDictionary isAvailableDictionary:dic]) {
            self.str_name = dic[@"name"];
            self.str_id = dic[@"id"];
        }
    }
    return self;
}

@end
