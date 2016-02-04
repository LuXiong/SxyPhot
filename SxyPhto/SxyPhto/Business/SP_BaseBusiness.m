//
//  SP_BaseBusiness.m
//  SxyPhto
//
//  Created by XiongLu on 16/1/11.
//  Copyright © 2016年 yxtk. All rights reserved.
//

#import "SP_BaseBusiness.h"

@implementation SP_BaseBusiness

-(instancetype)initWithHandler:(RB_BusinessHandler *)handler{
    self = [super init];
    if (self) {
        self.mHandler = handler;
    }
    return self;
}


-(void)requestUrl:(NSString *)requestId
        parameter:(NSDictionary *)params{
    [self requestStart];
    SP_Client * client = [SP_Client sharedClient];
    [client requestUrl:requestId parameter:params success:^(AFHTTPRequestOperation *operation, id responseObject) {
        [self requestSuccess:responseObject];
        [self requestComplete];
    } failure:^(AFHTTPRequestOperation *operation, NSError *error) {
        [self requestFailure:error];
        [self requestComplete];
    }];
}

-(void)requestStart{
    if(self.mHandler&&[self.mHandler respondsToSelector:@selector(onRequestStart)]){
        [self.mHandler onRequestStart];
    }
}

-(void)requestSuccess:(id)data{
    if(self.mHandler&&[self.mHandler respondsToSelector:@selector(onRequestSuccess:)]){
        [self.mHandler onRequestSuccess:data];
    }
    //这里可以继续调用requestFailure返回error
}
-(void)requestFailure:(id)data{
    if(self.mHandler&&[self.mHandler respondsToSelector:@selector(onRequestFail:)]){
        [self.mHandler onRequestFail:data];
    }
}
-(void)requestComplete{
    if(self.mHandler&&[self.mHandler respondsToSelector:@selector(onRequestComplete)]){
        [self.mHandler onRequestComplete];
    }
}

@end
