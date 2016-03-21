//
//  SP_MainBusiness.m
//  SxyPhto
//
//  Created by XiongLu on 16/1/13.
//  Copyright © 2016年 yxtk. All rights reserved.
//

#import "SP_MainBusiness.h"

@implementation SP_MainBusiness


-(void)fetchPhotoList:(Success)success{
    [[SP_Client sharedClient] requestUrl:@"tnfs/api/classify" parameter:nil success:^(AFHTTPRequestOperation *operation, id responseObject) {
        NSMutableArray * result = [[NSMutableArray alloc] init];
        NSArray * arr = responseObject[@"tngou"];
        for (int i = 0; i<arr.count; i++) {
            NSDictionary * dic = arr[i];
            SP_M_CategoryName * category = [[SP_M_CategoryName alloc] initWithId:dic[@"id"] name:dic[@"name"]];
            [result addObject:category.str_name];
        }
        success(result);
    } failure:^(AFHTTPRequestOperation *operation, NSError *error) {
        
    }];
}


-(void)fetchGalleries:(NSString *)gid page:(int)page success:(Success)success{
    [[SP_Client sharedClient] requestUrl:@"tnfs/api/list" parameter:@{@"id":gid,@"page":[NSString stringWithFormat:@"%d",page]} success:^(AFHTTPRequestOperation *operation, id responseObject) {
        NSMutableArray * result = [[NSMutableArray alloc] init];
        NSArray * arr = responseObject[@"tngou"];
        for (int i = 0; i<arr.count; i++) {
            NSDictionary * dic = arr[i];
            SP_M_Gallery * gallery = [[SP_M_Gallery alloc] initWithId:dic[@"id"] title:dic[@"title"] img:dic[@"img"] time:dic[@"time"] size:dic[@"size"] count:dic[@"count"]];
            [result addObject:gallery];
        }
        success(result);
    } failure:^(AFHTTPRequestOperation *operation, NSError *error) {
        
    }];
}


@end
