//
//  RedioDetailListCell.m
//  ProjectB
//
//  Created by lanou on 2016/9/29.
//  Copyright © 2016年 lanou. All rights reserved.
//

#import "RedioDetailListCell.h"
#import "UIImageView+WebCache.h"

@implementation RedioDetailListCell

- (void)awakeFromNib {
    // Initialization code
}

-(void)setDataWithModel:(RadioDetailListList *)model
{
    [self.img sd_setImageWithURL:[NSURL URLWithString:model.coverMiddle]];
    self.titleLabel.text = model.title;
    self.time.text = [NSString stringWithFormat:@"时长:%.0f:%ld",model.duration/60,(long)model.duration%60];
    self.playCount.text = [NSString stringWithFormat:@"播放次数:%.0f",model.playtimes];
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
