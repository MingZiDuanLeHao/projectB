//
//  RadioMainController.m
//  ProjectB
//
//  Created by lanou on 2016/9/28.
//  Copyright © 2016年 lanou. All rights reserved.
//

#import "RadioMainController.h"

@interface RadioMainController ()
@property (nonatomic,strong) UIScrollView *scroll;

@end

@implementation RadioMainController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.title = @"电台";
}

-(void)initUI
{
    self.scroll.frame = CGRectMake(0, 0, 320, 640);
}

#pragma marks- 懒加载

-(UIScrollView *)scroll
{
    if (!_scroll) {
        _scroll = [[UIScrollView alloc]init];
    }
    return _scroll;
}


@end
