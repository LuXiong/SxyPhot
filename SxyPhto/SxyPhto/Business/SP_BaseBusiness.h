//
//  SP_BaseBusiness.h
//  SxyPhto
//
//  Created by XiongLu on 16/1/11.
//  Copyright © 2016年 yxtk. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "RB_BusinessHandler.h"
#import "SP_Client.h"

@interface SP_BaseBusiness : NSObject

@property(nonatomic, strong) RB_BusinessHandler * mHandler;

-(instancetype)initWithHandler:(RB_BusinessHandler *)handler;

-(void)requestUrl:(NSString *)requestId
        parameter:(NSDictionary *)params;

-(void)requestStart;

-(void)requestSuccess:(id)data;

-(void)requestFailure:(id)data;

-(void)requestComplete;

@end
