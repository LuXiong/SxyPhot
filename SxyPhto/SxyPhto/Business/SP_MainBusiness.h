//
//  SP_MainBusiness.h
//  SxyPhto
//
//  Created by XiongLu on 16/1/13.
//  Copyright © 2016年 yxtk. All rights reserved.
//

#import "SP_BaseBusiness.h"
#import "SP_M_CategoryName.h"
#import "SP_M_Gallery.h"

@interface SP_MainBusiness : SP_BaseBusiness

//获取图片列表
-(void)fetchPhotoList:(Success)success;

//获取图片分类库
-(void)fetchGalleries:(NSString *)gid page:(int)page success:(Success)success;

@end
