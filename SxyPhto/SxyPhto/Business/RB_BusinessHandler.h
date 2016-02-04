//
//  RB_BusinessHandler.h
//  coyote
//
//  Created by MacTest on 15/12/17.
//  Copyright © 2015年 500wan. All rights reserved.
//

#import <Foundation/Foundation.h>

typedef void (^Start)();

typedef void (^Success)(id obj);

typedef void (^Fail)(id obj);

typedef void (^Complete)();

@interface RB_BusinessHandler : NSObject{
    Start               start;
    Success             success;
    Fail                fail;
    Complete            complete;
}

-(instancetype)initWithBlockStart:(Start)startRequest success:(Success)successRequest fail:(Fail)failRequest complete:(Complete)completeRequest;

-(void)onRequestStart;

-(void)onRequestSuccess:(id)data;

-(void)onRequestFail:(id)data;

-(void)onRequestComplete;

@end
