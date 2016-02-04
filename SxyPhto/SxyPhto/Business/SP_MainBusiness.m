//
//  SP_MainBusiness.m
//  SxyPhto
//
//  Created by XiongLu on 16/1/13.
//  Copyright © 2016年 yxtk. All rights reserved.
//

#import "SP_MainBusiness.h"

@implementation SP_MainBusiness


-(void)fetchPhotoList{
    [self requestUrl:@"tnfs/api/classify" parameter:nil];
}

-(void)requestSuccess:data{
    //首先父类会处理来自vc的消息
    [super requestSuccess:data];
    //下面可以添加自己相关的业务处理方法
}



@end
