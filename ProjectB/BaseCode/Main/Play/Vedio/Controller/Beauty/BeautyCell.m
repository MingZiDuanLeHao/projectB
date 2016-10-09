//
//  BeautyCell.m
//  ProjectB
//
//  Created by lanou on 2016/10/8.
//  Copyright © 2016年 lanou. All rights reserved.
//

#import "BeautyCell.h"
#import "UIImageView+WebCache.h"

@implementation BeautyCell

- (void)awakeFromNib {
    // Initialization code
}

-(void)setModel:(imageModel *)model
{
    [self.img sd_setImageWithURL:[NSURL URLWithString:model.thumbURL]];
}

@end
