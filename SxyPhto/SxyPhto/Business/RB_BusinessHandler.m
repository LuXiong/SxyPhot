//
//  RB_BusinessHandler.m
//  coyote
//
//  Created by MacTest on 15/12/17.
//  Copyright © 2015年 500wan. All rights reserved.
//

#import "RB_BusinessHandler.h"

@implementation RB_BusinessHandler

-(instancetype)initWithBlockStart:(StartBlock)startRequest success:(SuccessBlock)successRequest fail:(FailBlock)failRequest complete:(CompleteBlock)completeRequest{
    RB_BusinessHandler * handler = [self init];
    if (handler) {
        handler->start = startRequest;
        handler->success = successRequest;
        handler->fail = failRequest;
        handler->complete = completeRequest;
    }
    return handler;
}

-(void)onRequestStart{
    if (start) {
        start();
    };
}

-(void)onRequestSuccess:(id)data{
    if (success) {
        success(data);
    };
}

-(void)onRequestFail:(id)data{
    if (fail) {
        fail(data);
    };
}

-(void)onRequestComplete:(id)data{
    if (complete) {
        complete(data);
    };
}
@end
