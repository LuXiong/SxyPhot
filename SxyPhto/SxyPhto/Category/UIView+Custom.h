//
//  UIView+Custom.h
//  coyote
//
//  Created by LeoHao on 14-8-19.
//  Copyright (c) 2014年 500wan. All rights reserved.
//

#import <UIKit/UIKit.h>

typedef enum {
    BorderPositionTop,
    BorderPositionBottom,
    BorderPositionLeft,
    BorderPositionRight
}BorderPosition;

@interface UIView (Custom)

@property (nonatomic, assign) CGFloat width;
@property (nonatomic, assign) CGFloat height;
@property (nonatomic, assign) CGFloat y;
@property (nonatomic, assign) CGFloat bottom;
@property (nonatomic, assign) CGFloat x;
@property (nonatomic, assign) CGFloat right;
@property (nonatomic, assign) CGSize rbsize;
@property (nonatomic, assign) CGPoint rborigin;
@property (nonatomic, assign) CGPoint position;


@end
