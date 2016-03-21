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

typedef void (^Start)();

typedef void (^Success)(id obj);

typedef void (^Fail)(id obj);

typedef void (^Complete)();

@interface SP_BaseBusiness : NSObject

@property(weak,nonatomic) UIViewController * vc_current;

//公共方法,这里只是简单设计一下，具体情况下实现
-(void)fetchToken;

-(void)fetchCertification;

-(void)innervate;

@end
