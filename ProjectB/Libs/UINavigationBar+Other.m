//
//  UINavigationBar+Other.m
//  ProjectB
//
//  Created by 瓶子 on 2016/10/12.
//  Copyright © 2016年 lanou. All rights reserved.
//

#import "UINavigationBar+Other.h"

@implementation UINavigationBar (Other)


-(void)setColor:(UIColor *)color
{
    UIView *view = [[UIView alloc]initWithFrame:CGRectMake(0, -20, SWidth, 64)];
    view.backgroundColor = color;
    [self setValue:view forKey:@"backgroundView"];
}

@end
