//
//  UIView+Custom.m
//  coyote
//
//  Created by LeoHao on 14-8-19.
//  Copyright (c) 2014年 500wan. All rights reserved.
//

#import "UIView+Custom.h"

@implementation UIView (Custom)

#pragma mark - getter------------------
-(CGFloat)width{
    return self.frame.size.width;
}

-(CGFloat)height{
    return self.frame.size.height;
}

-(CGFloat)y{
    return self.frame.origin.y;
}

-(CGFloat)bottom{
    return self.frame.origin.y + self.frame.size.height;
}

-(CGFloat)x{
    return self.frame.origin.x;
}

-(CGFloat)right{
    return self.frame.origin.x + self.frame.size.width;
}

-(CGSize)rbsize{
    return self.frame.size;
}

-(CGPoint)rborigin{
    return self.frame.origin;
}

-(CGPoint)position{
    CGFloat f_x = self.x + self.width/2.0;
    CGFloat f_y = self.y + self.height/2.0;
    return CGPointMake(f_x,f_y);
}

-(UIView *)lastSubviewOnX{
    if(self.subviews.count > 0){
        UIView *outView = self.subviews[0];
        
        for(UIView *v in self.subviews)
            if(v.x > outView.x)
                outView = v;
        
        return outView;
    }
    
    return nil;
}

-(UIView *)lastSubviewOnY{
    if(self.subviews.count > 0){
        UIView *outView = self.subviews[0];
        
        for(UIView *v in self.subviews)
            if(v.y > outView.y)
                outView = v;
        
        return outView;
    }
    
    return nil;
}


#pragma mark - setter------------------
-(void)setWidth:(CGFloat)width{
    CGRect frame = self.frame;
    frame.size.width = width;
    self.frame = frame;
}

-(void)setHeight:(CGFloat)height{
    CGRect frame = self.frame;
    frame.size.height = height;
    self.frame = frame;
}

-(void)setBottom:(CGFloat)bottom{
    CGRect frame = self.frame;
    frame.size.height = bottom - frame.origin.x;
    self.frame = frame;
}

-(void)setX:(CGFloat)x{
    CGRect frame = self.frame;
    frame.origin.x = x;
    self.frame = frame;
}

-(void)setRight:(CGFloat)right{
    CGRect frame = self.frame;
    frame.size.width = right - frame.origin.x;
    self.frame = frame;
}

-(void)setY:(CGFloat)y{
    CGRect frame = self.frame;
    frame.origin.y = y;
    self.frame = frame;
}

-(void)setRbsize:(CGSize)size{
    self.width = size.width;
    self.height = size.height;
}

-(void)setRborigin:(CGPoint)origin{
    self.y = origin.y;
    self.x = origin.x;
}

-(void)setPosition:(CGPoint)position{
    self.x = position.x - self.width/2.0;
    self.y = position.y - self.height/2.0;
}


@end
