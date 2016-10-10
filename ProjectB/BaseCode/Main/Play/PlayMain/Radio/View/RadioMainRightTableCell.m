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
    self.playCount.text = [NSString stringWithFormat:@"%.1f万",model.playsCounts/10000] ;
    self.NumCount.text = [NSString stringWithFormat:@"%.0f集",model.tracks];
    self.desc.text = model.intro;
    [self.img sd_setImageWithURL:[NSURL URLWithString:model.coverSmall]];
    self.img.layer.borderWidth = 0.3;
    self.img.layer.borderColor =[[UIColor grayColor]CGColor];
    self.img.layer.shadowOffset = CGSizeMake(0, 0);
    self.img.layer.shadowColor =[[UIColor blackColor]CGColor];
    self.img.layer.shadowOpacity = 0.5;
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
