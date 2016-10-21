//
//  ReuseView.m
//  ProjectB
//
//  Created by lanou on 2016/10/9.
//  Copyright © 2016年 lanou. All rights reserved.
//

#import "ReuseView.h"

@implementation ReuseView

-(void)awakeFromNib
{
    [super awakeFromNib];
    self.img.image = [UIImage imageNamed:@"4.jpg"];
    self.img.layer.cornerRadius = 1;
    self.backgroundColor = [UIColor lightGrayColor];
    //图片的边角
    self.layer.cornerRadius = 4;
    self.layer.borderWidth = 2;
    self.layer.masksToBounds = YES;
    self.layer.borderColor = [[UIColor whiteColor] CGColor];
    //进度条
    UIProgressView *pv = [[UIProgressView alloc]initWithProgressViewStyle:UIProgressViewStyleDefault];
    pv.backgroundColor = [UIColor lightGrayColor];
    pv.progressTintColor = [UIColor greenColor];
    self.pv = pv;
    [self addSubview:pv];
}
@end
