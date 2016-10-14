//
//  VedioPlayCell.m
//  ProjectB
//
//  Created by lanou on 2016/10/11.
//  Copyright © 2016年 lanou. All rights reserved.
//

#import "VedioPlayCell.h"

@implementation VedioPlayCell

- (void)awakeFromNib {
    // Initialization code
    CGRect frame = self.frame;
    
    //点赞btn
    self.zanBtn = [[UIButton alloc]initWithFrame:CGRectMake(5, frame.size.height - 85, 60, 60)];
    
    self.zanBtn.backgroundColor = [UIColor grayColor];
    [self.zanBtn setTitle:@"11111" forState:UIControlStateNormal];
    self.zanBtn.titleLabel.font = [UIFont systemFontOfSize: 12.0];
    [self.zanBtn setImage:[UIImage imageNamed:@"鼓掌1"] forState:UIControlStateNormal];
    [self.zanBtn setImageEdgeInsets:UIEdgeInsetsMake(10, 5, 30, 0)];
    [self.zanBtn setTitleEdgeInsets:UIEdgeInsetsMake(30, -65, 0, 0)];
    
    [self addSubview: self.zanBtn];
    
    
    //踩
    self.caiBtn = [[UIButton alloc]initWithFrame:CGRectMake(frame.size.width/2 -30 , frame.size.height - 85, 60, 60)];
    
    self.caiBtn.backgroundColor = [UIColor grayColor];
    [self.caiBtn setTitle:@"11111" forState:UIControlStateNormal];
    self.caiBtn.titleLabel.font = [UIFont systemFontOfSize: 12.0];
    [self.caiBtn setImage:[UIImage imageNamed:@"便便1"] forState:UIControlStateNormal];
    [self.caiBtn setImageEdgeInsets:UIEdgeInsetsMake(10, 5, 30, 0)];
    [self.caiBtn setTitleEdgeInsets:UIEdgeInsetsMake(30, -65, 0, 0)];
    
    [self addSubview: self.caiBtn];
    
    
    
    //评论
    UIButton *commentBtn = [[UIButton alloc]initWithFrame:CGRectMake(frame.size.width -65, frame.size.height - 85, 60, 60)];
    
    commentBtn.backgroundColor = [UIColor grayColor];
    [commentBtn setTitle:@"11111" forState:UIControlStateNormal];
    commentBtn.titleLabel.font = [UIFont systemFontOfSize: 12.0];
    [commentBtn setImage:[UIImage imageNamed:@"评论"] forState:UIControlStateNormal];
    [commentBtn setImageEdgeInsets:UIEdgeInsetsMake(10, 5, 30, 0)];
    [commentBtn setTitleEdgeInsets:UIEdgeInsetsMake(30, -65, 0, 0)];
    
    [self addSubview: commentBtn];
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
