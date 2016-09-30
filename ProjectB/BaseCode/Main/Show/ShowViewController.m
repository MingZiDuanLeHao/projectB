//
//  ShowViewController.m
//  ProjectB
//
//  Created by 瓶子 on 2016/9/28.
//  Copyright © 2016年 lanou. All rights reserved.
//

#import "ShowViewController.h"
#import "VedioMainController.h"
#import "RadioMainController.h"
#import "AppDelegate.h"
#import "NetWorkRequest.h"

@interface ShowViewController ()

@end

@implementation ShowViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self askData];
    [self initUI];
}

-(void)initUI
{
    self.title = @"视听";
   
}

-(void)askData
{
 
}
-(void)viewDidAppear:(BOOL)animated
{
        ((AppDelegate *)([UIApplication sharedApplication].delegate)).mainTabble.tabBar.hidden = NO;
}

//进入视频列表
- (IBAction)vedioHandle:(UIButton *)sender {
    VedioMainController *vedioVC = [VedioMainController new];
    [self.navigationController pushViewController:vedioVC animated:YES];
    
}
- (IBAction)RadioHandle:(UIButton *)sender {
    RadioMainController *radioVC = [RadioMainController new];
    [self.navigationController pushViewController:radioVC animated:YES];
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
