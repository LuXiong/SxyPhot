//
//  SP_Client.h
//  SxyPhto
//
//  Created by XiongLu on 16/1/11.
//  Copyright © 2016年 yxtk. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "AFNetworking.h"

#define BASE_URL @"http://www.tngou.net"

typedef void (^SuccessBlock)(AFHTTPRequestOperation *operation, id responseObject);
typedef void (^FailureBlock)(AFHTTPRequestOperation *operation, NSError *error);

@interface SP_Client : NSObject

@property (nonatomic, strong) AFHTTPRequestOperationManager *manager;

+(instancetype)sharedClient;

-(void)cancelRequest;

-(void)requestUrl:(NSString *)requestId
        parameter:(NSDictionary *)params
          success:(SuccessBlock)success
          failure:(FailureBlock)failure;

@end
