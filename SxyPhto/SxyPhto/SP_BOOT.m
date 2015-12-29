//
//  SP_BOOT.m
//  SxyPhto
//
//  Created by MacTest on 15/12/29.
//  Copyright © 2015年 yxtk. All rights reserved.
//

#import "SP_BOOT.h"
#import "SB_MainVC.h"

@interface SP_BOOT ()
@property (weak, nonatomic) IBOutlet UIImageView *img_launch;

@end

@implementation SP_BOOT

- (void)viewDidLoad {
    [super viewDidLoad];
    [self.navigationController setNavigationBarHidden:true animated:false];
    
    [UIView animateWithDuration:2.0f delay:1 options:0 animations:^{
        self.img_launch.transform = CGAffineTransformMakeScale(1.3f, 1.3f);
    }completion:^(BOOL finished) {
        SB_MainVC *vc_boot = [[SB_MainVC alloc] initWithNibName:@"SB_MainVC" bundle:nil];
        [self.navigationController setViewControllers:[[NSArray alloc] initWithObjects:vc_boot, nil] animated:YES];
    }];
    
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
