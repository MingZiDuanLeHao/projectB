//
//  BarButtomViewController.m
//  抽屉效果demo
//
//  Created by 瓶子 on 16/9/13.
//  Copyright © 2016年 GZ_lanou. All rights reserved.
//

#import "BarButtomViewController.h"


@interface BarButtomViewController ()

@end

@implementation BarButtomViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    //设置左侧按钮
    if(self.navigationController.viewControllers.count ==1)
    {
        [self setupLeftMenuButton];
    }
    else
    {
        [self setbackBarItem];
    }
}
-(void)setbackBarItem
{
    UIButton *button = [[UIButton alloc]initWithFrame:CGRectMake(0, 0, 20, 20)];
    [button setBackgroundImage:[UIImage imageNamed:@"返回"] forState:UIControlStateNormal];
    [button addTarget:self action:@selector(backHandle) forControlEvents:UIControlEventTouchUpInside];
    UIBarButtonItem *item = [[UIBarButtonItem alloc]initWithCustomView:button];
    self.navigationItem.leftBarButtonItem = item;
    
}
-(void)backHandle
{
    [self.navigationController popViewControllerAnimated:YES];
}


-(void)setupLeftMenuButton{
    MMDrawerBarButtonItem * leftDrawerButton = [[MMDrawerBarButtonItem alloc] initWithTarget:self action:@selector(leftDrawerButtonPress:)];
    [self.navigationItem setLeftBarButtonItem:leftDrawerButton animated:YES];
}
-(void)leftDrawerButtonPress:(id)sender{
    [self.mm_drawerController toggleDrawerSide:MMDrawerSideLeft animated:YES completion:nil];
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
