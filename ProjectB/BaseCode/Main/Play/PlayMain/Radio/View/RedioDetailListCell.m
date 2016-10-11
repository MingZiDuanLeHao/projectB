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
    long seconds = (long)model.duration%60;
    if (seconds < 10) {
        self.time.text = [NSString stringWithFormat:@"%.0f:0%ld",model.duration/60,seconds];
    }
    else
    {
        self.time.text = [NSString stringWithFormat:@"%.0f:%ld",model.duration/60,seconds];
    }
    
    self.playCount.text = [NSString stringWithFormat:@"%.0f",model.playtimes];
    
    //图片效果
    self.img.layer.borderWidth = 0.3;
    self.img.layer.borderColor =[[UIColor grayColor]CGColor];
    self.img.layer.shadowOffset = CGSizeMake(-3, 3);
    self.img.layer.shadowColor =[[UIColor blackColor]CGColor];
    self.img.layer.shadowOpacity = 0.5;
    
    
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
