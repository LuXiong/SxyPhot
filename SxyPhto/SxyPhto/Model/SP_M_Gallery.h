//
//  SP_M_Gallery.h
//  SxyPhto
//
//  Created by XiongLu on 16/2/18.
//  Copyright © 2016年 yxtk. All rights reserved.
//

#import "SP_BaseModel.h"

@interface SP_M_Gallery : SP_BaseModel

@property (strong,nonatomic) NSNumber* n_size;
@property (strong,nonatomic) NSNumber* n_count;
@property (strong,nonatomic) NSNumber* l_time;
@property (strong,nonatomic) NSString* str_title;
@property (strong,nonatomic) NSNumber* str_id;
@property (strong,nonatomic) NSString* str_img;

-(instancetype)initWithId:(NSNumber *)gid title:(NSString *)title img:(NSString *)img time:(NSNumber *)time size:(NSNumber *)size count:(NSNumber *)count;

@end
