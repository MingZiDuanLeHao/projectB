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
}
@end
