//
//  SP_M_CategoryName.h
//  SxyPhto
//
//  Created by XiongLu on 16/2/1.
//  Copyright © 2016年 yxtk. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "SP_BaseModel.h"

@interface SP_M_CategoryName : SP_BaseModel

@property (strong, nonatomic) NSString * str_name;
@property (strong, nonatomic) NSString * str_id;

- (instancetype)initWithId:(NSString *)uid name:(NSString *)name;

@end
