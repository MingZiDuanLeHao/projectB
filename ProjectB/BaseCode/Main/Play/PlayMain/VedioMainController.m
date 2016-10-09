//
//  VedioMainController.m
//  ProjectB
//
//  Created by lanou on 2016/9/28.
//  Copyright © 2016年 lanou. All rights reserved.
//

#import "VedioMainController.h"
#import "BeautyViewController.h"
#import "PictureViewController.h"
#import "VedioPlayViewController.h"
#import "RadioMainController.h"
#import "AppDelegate.h"

@interface VedioMainController ()


@end

@implementation VedioMainController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self initUI];

}
-(void)viewWillAppear:(BOOL)animated
{
   ((AppDelegate *)([UIApplication sharedApplication].delegate)).mainTabble.tabBar.hidden = NO;
}
-(void)initUI
{
    UIImageView *img1 = [[UIImageView alloc]initWithFrame:CGRectMake(0, 64, SWidth/2, (SHeight - 64)/2)];
    img1.image = [UIImage imageNamed:@"blue.jpg"];
    img1.tag = 100;
    [self.view addSubview:img1];
    
    UIImageView *img2 = [[UIImageView alloc]initWithFrame:CGRectMake(SWidth/2, 64, SWidth/2, (SHeight - 64)/2)];
        img2.tag = 101;
    img2.image = [UIImage imageNamed:@"black.jpg"];
    [self.view addSubview:img2];
    
    UIImageView *img3 = [[UIImageView alloc]initWithFrame:CGRectMake(0, SHeight/2, SWidth/2, (SHeight - 64)/2)];
            img3.tag = 103;
    img3.image = [UIImage imageNamed:@"hailan.jpeg"];
    [self.view addSubview:img3];
    
    UIImageView *img4 = [[UIImageView alloc]initWithFrame:CGRectMake(SWidth/2, SHeight/2, SWidth/2, (SHeight - 64)/2)];
            img4.tag = 104;
    img4.image = [UIImage imageNamed:@"red.jpg"];
    [self.view addSubview:img4];
    
    [img1 addGestureRecognizer:[[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(imgClick:)]];
    [img2 addGestureRecognizer:[[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(imgClick:)]];
    [img3 addGestureRecognizer:[[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(imgClick:)]];
    [img4 addGestureRecognizer:[[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(imgClick:)]];
    img1.userInteractionEnabled = YES;
    img2.userInteractionEnabled = YES;
    img3.userInteractionEnabled = YES;
    img4.userInteractionEnabled = YES;
    
}


-(void)imgClick:(UITapGestureRecognizer *)tap
{
    if (tap.view.tag == 100) {
        VedioPlayViewController *vedioVc = [VedioPlayViewController new];
        [self.navigationController pushViewController:vedioVc animated:YES];
    }
    else if (tap.view.tag == 101)
    {
        BeautyViewController *beaVc = [BeautyViewController new];
        [self.navigationController pushViewController:beaVc animated:YES];
    }
    else if (tap.view.tag == 103)
    {
        PictureViewController *pinVC = [PictureViewController new];
        [self.navigationController pushViewController:pinVC animated:YES];
    }
    else
    {
        RadioMainController *radioVC = [RadioMainController new];
        [self.navigationController pushViewController:radioVC animated:YES];
    }
    
}



@end
