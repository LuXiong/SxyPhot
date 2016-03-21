//
//  MainCell.h
//  SxyPhto
//
//  Created by XiongLu on 16/2/17.
//  Copyright © 2016年 yxtk. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "MainCell.h"
#import "UIView+Custom.h"

@interface MainCell : UICollectionViewCell
@property(strong, nonatomic) UIView * v_content;
@property(strong, nonatomic) UIImageView * imageView;
@property(strong, nonatomic) UILabel * lbl_description;

@end
