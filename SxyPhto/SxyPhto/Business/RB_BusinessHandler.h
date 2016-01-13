//
//  RB_BusinessHandler.h
//  coyote
//
//  Created by MacTest on 15/12/17.
//  Copyright © 2015年 500wan. All rights reserved.
//

#import <Foundation/Foundation.h>

typedef void (^StartBlock)();

typedef void (^SuccessBlock)(id obj);

typedef void (^FailBlock)(id obj);

typedef void (^CompleteBlock)(id obj);

@interface RB_BusinessHandler : NSObject{
    StartBlock              start;
    SuccessBlock            success;
    FailBlock               fail;
    CompleteBlock           complete;
}

-(void)onRequestStart;

-(void)onRequestSuccess:(id)data;

-(void)onRequestFail:(id)data;

-(void)onRequestComplete:(id)data;

@end
