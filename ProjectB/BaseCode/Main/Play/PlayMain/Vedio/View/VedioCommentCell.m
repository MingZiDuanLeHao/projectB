//
//  VedioCommentCell.m
//  ProjectB
//
//  Created by lanou on 2016/10/14.
//  Copyright © 2016年 lanou. All rights reserved.
//

#import "VedioCommentCell.h"

@implementation VedioCommentCell

- (void)awakeFromNib {
    //图片切成圆形
    [super awakeFromNib];
    self.avatar.backgroundColor = [UIColor lightGrayColor];

    self.avatar.layer.masksToBounds = YES;
    self.avatar.clipsToBounds = YES;
    self.avatar.layer.cornerRadius = 40/2.;

    self.backView.layer.cornerRadius = 4;
    self.backView.layer.masksToBounds = YES;
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
