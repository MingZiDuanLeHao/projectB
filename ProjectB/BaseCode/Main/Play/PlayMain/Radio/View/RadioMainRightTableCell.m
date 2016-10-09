//
//  RadioMainRightTableCell.m
//  ProjectB
//
//  Created by lanou on 2016/9/29.
//  Copyright © 2016年 lanou. All rights reserved.
//

#import "RadioMainRightTableCell.h"
#import "UIImageView+WebCache.h"

@implementation RadioMainRightTableCell

- (void)awakeFromNib {
    // Initialization code
}
-(void)setDataWithModel:(List *)model
{
    self.titlelabel.text = model.title;
    self.playCount.text = [NSString stringWithFormat:@"播放:%.0f",model.playsCounts] ;
    self.NumCount.text = [NSString stringWithFormat:@"集数:%.0f",model.tracks];
    self.desc.text = model.intro;
    [self.img sd_setImageWithURL:[NSURL URLWithString:model.coverSmall]];
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
