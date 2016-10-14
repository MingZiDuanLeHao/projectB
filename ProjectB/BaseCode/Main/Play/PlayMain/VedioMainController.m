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
//    [self.navigationController.navigationBar setColor:[UIColor colorWithRed:216.0/255 green:76.0/255 blue:68.0/255 alpha:1.0]];
    
    [self.navigationController.navigationBar setBackgroundImage:[UIImage new] forBarMetrics:0];
    self.navigationController.navigationBar.shadowImage=[UIImage new];
    self.view.backgroundColor = [UIColor colorWithRed:216.0/255 green:76.0/255 blue:68.0/255 alpha:1.0];

}

-(void)initUI
{
    self.title = @"视听";
    
    UIImageView *img1 = [[UIImageView alloc]initWithFrame:CGRectMake(0, 64, SWidth/2, (SHeight - 64-46)/2)];
    img1.image = [UIImage imageNamed:@"blue.jpg"];
    img1.tag = 100;
    [self.view addSubview:img1];
    
    UIImageView *img2 = [[UIImageView alloc]initWithFrame:CGRectMake(SWidth/2, 64, SWidth/2, (SHeight - 64 - 46)/2)];
        img2.tag = 101;
    img2.image = [UIImage imageNamed:@"black.jpg"];
    [self.view addSubview:img2];
    
    UIImageView *img3 = [[UIImageView alloc]initWithFrame:CGRectMake(0, (SHeight - 64)/2 +64-23, SWidth/2, (SHeight - 64 - 46)/2)];
            img3.tag = 103;
    img3.image = [UIImage imageNamed:@"hailan.jpeg"];
    [self.view addSubview:img3];
    
    UIImageView *img4 = [[UIImageView alloc]initWithFrame:CGRectMake(SWidth/2, (SHeight - 64)/2 +64-23, SWidth/2, (SHeight - 64-46)/2)];
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
    
    UILabel *label1 = [[UILabel alloc]initWithFrame:CGRectMake(SWidth/4 - 40, ((SHeight - 64-46)/4)-40, 80, 80)];
    label1.textAlignment = NSTextAlignmentCenter;
    label1.textColor = [UIColor redColor];
    label1.font = [UIFont systemFontOfSize:30];
    label1.text = @"视频";
//    NSString *str = @"视频";
//    NSMutableAttributedString *attributedStr = [[NSMutableAttributedString alloc] initWithString: str];
    
//    [attributedStr addAttribute: NSFontAttributeName value: [UIFont fontWithName: @"Zapfino" size:50] range: NSMakeRange(0, label1.text.length)];
//    label1.attributedText = attributedStr;
    [img1 addSubview:label1];
    
    
    UILabel *label2 = [[UILabel alloc]initWithFrame:CGRectMake(SWidth/4 - 40, ((SHeight - 64-46)/4)-40, 80, 80)];
    label2.font = [UIFont systemFontOfSize:30];
    label2.textAlignment = NSTextAlignmentCenter;
    label2.text = @"可人";
    label2.textColor = [UIColor whiteColor];
    [img2 addSubview:label2];
    
    
    UILabel *label3 = [[UILabel alloc]initWithFrame:CGRectMake(SWidth/4 - 40, ((SHeight - 64-46) /4)-40, 80, 80)];
    label3.font = [UIFont systemFontOfSize:30];
    label3.textAlignment = NSTextAlignmentCenter;
    label3.textColor = [UIColor blueColor];
    label3.text = @"搞笑";
    [img3 addSubview:label3];
    
    
    UILabel *label4 = [[UILabel alloc]initWithFrame:CGRectMake(SWidth/4 - 40, ((SHeight - 64-46)/4)-40, 80, 80)];
    label4.font = [UIFont systemFontOfSize:30];
    label4.textAlignment = NSTextAlignmentCenter;
    label4.text = @"电台";
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
