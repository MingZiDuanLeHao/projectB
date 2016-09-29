//
//  VedioMainController.m
//  ProjectB
//
//  Created by lanou on 2016/9/28.
//  Copyright © 2016年 lanou. All rights reserved.
//

#import "VedioMainController.h"

@interface VedioMainController ()
@property (strong, nonatomic)  UIScrollView *titleScrollView;
@property (strong, nonatomic)  UIScrollView *contentScrollView;

@end

@implementation VedioMainController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self initUI];
}
-(void)initUI
{
    UIImageView *img1 = [[UIImageView alloc]initWithFrame:CGRectMake(0, 64, SWidth/2, (SHeight - 64 - 44)/2)];
    img1.image = [UIImage imageNamed:@"1.jpg"];
    img1.tag = 100;
    [self.view addSubview:img1];
    
    UIImageView *img2 = [[UIImageView alloc]initWithFrame:CGRectMake(SWidth/2, 64, SWidth/2, (SHeight - 64 - 44)/2)];
        img2.tag = 101;
    img2.image = [UIImage imageNamed:@"1.jpg"];
    [self.view addSubview:img2];
    
    UIImageView *img3 = [[UIImageView alloc]initWithFrame:CGRectMake(0, SHeight/2, SWidth/2, (SHeight - 64 - 44)/2)];
            img3.tag = 103;
    img3.image = [UIImage imageNamed:@"1.jpg"];
    [self.view addSubview:img3];
    
    UIImageView *img4 = [[UIImageView alloc]initWithFrame:CGRectMake(SWidth/2, SHeight/2, SWidth/2, (SHeight - 64 - 44)/2)];
            img4.tag = 104;
    img4.image = [UIImage imageNamed:@"1.jpg"];
    [self.view addSubview:img4];
    
    [img1 addGestureRecognizer:[[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(imgClick:)]];
    [img2 addGestureRecognizer:[[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(imgClick:)]];
    [img3 addGestureRecognizer:[[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(imgClick:)]];
    [img4 addGestureRecognizer:[[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(imgClick:)]];
}


-(void)imgClick:(UITapGestureRecognizer *)tap
{
    
}

#pragma marks-懒加载
//标题
-(UIScrollView *)titleScrollView
{
    if (!_titleScrollView) {
        _titleScrollView = [[UIScrollView alloc]init];
    }
    return _titleScrollView;
}
//内容
-(UIScrollView *)contentScrollView
{
    if (!_contentScrollView) {
        _contentScrollView = [[UIScrollView alloc]init];
    }
    return _contentScrollView;
}

@end
