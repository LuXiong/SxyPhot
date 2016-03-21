//
//  SP_M_Gallery.m
//  SxyPhto
//
//  Created by XiongLu on 16/2/18.
//  Copyright © 2016年 yxtk. All rights reserved.
//

#import "SP_M_Gallery.h"

@implementation SP_M_Gallery

-(instancetype)initWithId:(NSNumber *)gid title:(NSString *)title img:(NSString *)img time:(NSNumber *)time size:(NSNumber *)size count:(NSNumber *)count{
    self = [super init];
    if (self) {
        self.str_id = gid;
        self.str_title = title;
        self.str_img = img;
        self.n_size = size;
        self.n_count = count;
        self.l_time = time;
    }
    return self;

}

@end
