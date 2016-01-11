//
//  SB_MainVC.m
//  SxyPhto
//
//  Created by MacTest on 15/12/29.
//  Copyright © 2015年 yxtk. All rights reserved.
//

#import "SB_MainVC.h"

@interface SB_MainVC ()

@property(nonatomic, strong) GooeySlideMenu * menu;

@end

@implementation SB_MainVC

- (void)viewDidLoad {
    [super viewDidLoad];
    self.menu = [[GooeySlideMenu alloc]initWithTitles:@[@"首页",@"消息",@"发布",@"发现",@"个人",@"设置"]];
    self.menu.menuClickBlock = ^(NSInteger index,NSString *title,NSInteger titleCounts){
        
        NSLog(@"index:%ld title:%@ titleCounts:%ld",index,title,titleCounts);
    };
    [self.menu trigger];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
