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
#import "UINavigationBar+Other.h"

#define backViewFrame CGRectMake(0, 0, SWidth/2, (SHeight - 64 - 46)/2)
@interface VedioMainController ()


@end

@implementation VedioMainController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self initUI];

}

//UI设置
-(void)viewWillAppear:(BOOL)animated
{
   ((AppDelegate *)([UIApplication sharedApplication].delegate)).mainTabble.tabBar.hidden = NO;

//        [self.navigationController.navigationBar setBackgroundImage:nil forBarMetrics:0];
//        self.navigationController.navigationBar.shadowImage=nil;
    
}

-(void)initUI
{
    self.title = @"视听";
    self.view.backgroundColor = [UIColor orangeColor];
    UIImageView *img1 = [[UIImageView alloc]initWithFrame:CGRectMake(0, 64, SWidth/2, (SHeight - 64-46)/2)];
    img1.image = [UIImage imageNamed:@"视频.jpg"];
    img1.tag = 100;
    [self.view addSubview:img1];
    
    UIImageView *img2 = [[UIImageView alloc]initWithFrame:CGRectMake(SWidth/2, 64, SWidth/2, (SHeight - 64 - 46)/2)];
        img2.tag = 101;
    img2.image = [UIImage imageNamed:@"美女.jpg"];
    [self.view addSubview:img2];
    
    UIImageView *img3 = [[UIImageView alloc]initWithFrame:CGRectMake(0, (SHeight - 64)/2 +64-23, SWidth/2, (SHeight - 64 - 46)/2)];
            img3.tag = 103;
    img3.image = [UIImage imageNamed:@"搞笑.jpeg"];
    [self.view addSubview:img3];
    
    UIImageView *img4 = [[UIImageView alloc]initWithFrame:CGRectMake(SWidth/2, (SHeight - 64)/2 +64-23, SWidth/2, (SHeight - 64-46)/2)];
            img4.tag = 104;
    img4.image = [UIImage imageNamed:@"电台.jpg"];
    [self.view addSubview:img4];
    
    [img1 addGestureRecognizer:[[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(imgClick:)]];
    [img2 addGestureRecognizer:[[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(imgClick:)]];
    [img3 addGestureRecognizer:[[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(imgClick:)]];
    [img4 addGestureRecognizer:[[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(imgClick:)]];
    img1.userInteractionEnabled = YES;
    img2.userInteractionEnabled = YES;
    img3.userInteractionEnabled = YES;
    img4.userInteractionEnabled = YES;
    
    UIView *backView1 = [[UIView alloc]initWithFrame:backViewFrame];
    backView1.backgroundColor = [UIColor blackColor];
    backView1.alpha = 0.36;
    UIView *backView2 = [[UIView alloc]initWithFrame:backViewFrame];
    backView2.backgroundColor = [UIColor blackColor];
    backView2.alpha = 0.36;
    UIView *backView3 = [[UIView alloc]initWithFrame:backViewFrame];
    backView3.backgroundColor = [UIColor blackColor];
    backView3.alpha = 0.36;
    UIView *backView4 = [[UIView alloc]initWithFrame:backViewFrame];
    backView4.backgroundColor = [UIColor blackColor];
    backView4.alpha = 0.36;
    [img1 addSubview:backView1];
    [img2 addSubview:backView2];
    [img3 addSubview:backView3];
    [img4 addSubview:backView4];
    
    
    
    UILabel *label1 = [[UILabel alloc]initWithFrame:CGRectMake(SWidth/4 - 75, ((SHeight - 64-46)/4)-40, 150, 80)];
    label1.textAlignment = NSTextAlignmentCenter;
    label1.textColor = [UIColor whiteColor];
    label1.font = [UIFont systemFontOfSize:26];
    label1.text = @"芊芊世界";
    [img1 addSubview:label1];
    
   
    
    UILabel *label2 = [[UILabel alloc]initWithFrame:CGRectMake(SWidth/4 - 75, ((SHeight - 64-46)/4)-40, 150, 80)];
    label2.font = [UIFont systemFontOfSize:26];
    label2.textAlignment = NSTextAlignmentCenter;
    label2.text = @"洗涤心灵";
    label2.textColor = [UIColor orangeColor];
    [img2 addSubview:label2];
    
    
    UILabel *label3 = [[UILabel alloc]initWithFrame:CGRectMake(SWidth/4 - 75, ((SHeight - 64-46) /4)-40, 150, 80)];
    label3.font = [UIFont systemFontOfSize:26];
    label3.textAlignment = NSTextAlignmentCenter;
    label3.textColor = [UIColor greenColor];
    label3.text = @"哈哈哈哈";
    [img3 addSubview:label3];
    
    
    UILabel *label4 = [[UILabel alloc]initWithFrame:CGRectMake(SWidth/4 - 75, ((SHeight - 64-46)/4)-40, 150, 80)];
    label4.font = [UIFont systemFontOfSize:26];
    label4.textAlignment = NSTextAlignmentCenter;
    label4.textColor = [UIColor whiteColor];
    label4.text = @"倾听彼此";
    [img4 addSubview:label4];
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
