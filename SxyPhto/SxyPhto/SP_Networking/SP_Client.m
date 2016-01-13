//
//  SP_Client.m
//  SxyPhto
//
//  Created by XiongLu on 16/1/11.
//  Copyright © 2016年 yxtk. All rights reserved.
//

#import "SP_Client.h"

@implementation SP_Client

+(instancetype)sharedClient{
    static SP_Client * client = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        client = [[SP_Client alloc] init];
        [client initClientConfig];
    });
    return  client;
}

-(void)cancelRequest{
    if (self.manager) {
        [self.manager.operationQueue cancelAllOperations];
    }
}

-(void)requestUrl:(NSString *)requestId
        parameter:(NSDictionary *)params
          success:(SuccessBlock)success
          failure:(FailureBlock)failure{
    [self.manager POST:requestId parameters:params success:success failure:failure];
}

-(void)initClientConfig{
    if(!self.manager){
        self.manager = [[AFHTTPRequestOperationManager alloc] initWithBaseURL:[NSURL URLWithString:BASE_URL]];
        self.manager.responseSerializer.acceptableContentTypes = [NSSet setWithObjects:@"application/json",@"text/json",@"text/javascript", @"image/png", nil];
        self.manager.requestSerializer = [AFJSONRequestSerializer serializer];
    }
}

@end
