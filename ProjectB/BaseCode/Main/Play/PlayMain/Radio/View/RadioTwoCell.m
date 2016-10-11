//
//  RadioTwoCell.m
//  ProjectB
//
//  Created by 瓶子 on 2016/10/10.
//  Copyright © 2016年 lanou. All rights reserved.
//

#import "RadioTwoCell.h"

@implementation RadioTwoCell

- (void)awakeFromNib {
    // Initialization code
}

-(void)setModel:(RadioTwoUser *)model
{
    [_smallLogo sd_setImageWithURL:[NSURL URLWithString:model.smallLogo]];
    _nickName.text = model.nickname;
    _follower.text = [NSString stringWithFormat:@"已被%.0f人关注",model.followers];
    _signature.text = [NSString stringWithFormat:@"\t\t\t\t\t\t\t%@",model.personalSignature];
    
    //图片效果
    _smallLogo.layer.borderWidth = 0.3;
    _smallLogo.layer.borderColor =[[UIColor grayColor]CGColor];
    _smallLogo.layer.shadowOffset = CGSizeMake(-3, 3);
    _smallLogo.layer.shadowColor =[[UIColor blackColor]CGColor];
    _smallLogo.layer.shadowOpacity = 0.5;
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
