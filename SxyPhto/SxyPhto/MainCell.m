//
//  MainCell.m
//  SxyPhto
//
//  Created by XiongLu on 16/2/17.
//  Copyright © 2016年 yxtk. All rights reserved.
//

#import "MainCell.h"

@implementation MainCell

-(UIView *)v_content{
    if (!_v_content) {
       CGRect rect =  CGRectMake(0, 0, self.contentView.width, self.contentView.height);
        _v_content = [[UIView alloc] initWithFrame:rect];
        _v_content.autoresizingMask = UIViewAutoresizingFlexibleHeight | UIViewAutoresizingFlexibleWidth;
        
        _v_content.contentMode = UIViewContentModeScaleAspectFit;
        _v_content.clipsToBounds = YES;
        _v_content.backgroundColor = [UIColor lightGrayColor];
        
        [_v_content addSubview:self.imageView];
        [_v_content addSubview:self.lbl_description];
    }
    return  _v_content;
}

- (UIImageView *)imageView {
    if (!_imageView) {
        CGRect rect = CGRectMake(2.5f, 2.5, self.v_content.width-5, self.v_content.height-45);
        _imageView = [[UIImageView alloc] initWithFrame:rect];
        _imageView.autoresizingMask = UIViewAutoresizingFlexibleHeight | UIViewAutoresizingFlexibleWidth;
        _imageView.contentMode = UIViewContentModeScaleAspectFill;
        _imageView.clipsToBounds = YES;
    }
    return _imageView;
}

- (UILabel *)lbl_description{
    if (!_lbl_description) {
        CGRect rect = CGRectMake(10, self.imageView.y+self.imageView.height, self.v_content.width-20, 45);
        _lbl_description = [[UILabel alloc] initWithFrame:rect];
        _lbl_description.contentMode = UIViewContentModeScaleAspectFit;
        _lbl_description.font = [UIFont systemFontOfSize:12.0f];
        _lbl_description.textColor = [UIColor grayColor];
        _lbl_description.textAlignment = NSTextAlignmentCenter;
        _lbl_description.numberOfLines = 2;
    }
    return _lbl_description;
}

- (id)initWithFrame:(CGRect)frame {
    if (self = [super initWithFrame:frame]) {
//        [self.contentView addSubview:self.imageView];
//        [self.contentView addSubview:self.lbl_description];
//    
        [self.contentView addSubview:self.v_content];
    }
    return self;
}

@end
