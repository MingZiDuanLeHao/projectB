//
//  VedioPlayCell.m
//  ProjectB
//
//  Created by lanou on 2016/10/11.
//  Copyright © 2016年 lanou. All rights reserved.
//

#import "VedioPlayCell.h"

@interface VedioPlayCell ()

@property (weak, nonatomic) IBOutlet UIButton *zanBBB;

@end

@implementation VedioPlayCell

- (void)awakeFromNib {
    [super awakeFromNib];
    self.contentView.layer.cornerRadius = 2;
    
    self.zanBtn.layer.cornerRadius = 4;
    self.zanBtn.layer.borderWidth = 2;
    self.zanBtn.layer.masksToBounds = YES;
    self.zanBtn.layer.borderColor = [[UIColor lightGrayColor] CGColor];
    
    self.caiBtn.layer.cornerRadius = 4;
    self.caiBtn.layer.borderWidth = 2;
    self.caiBtn.layer.masksToBounds = YES;
    self.caiBtn.layer.borderColor = [[UIColor lightGrayColor] CGColor];
    
    self.commentBtn.layer.cornerRadius = 4;
    self.commentBtn.layer.borderWidth = 2;
    self.commentBtn.layer.masksToBounds = YES;
    self.commentBtn.layer.borderColor = [[UIColor lightGrayColor] CGColor];
    
    //图片设置边角
    self.img.layer.cornerRadius = 4;
    self.img.layer.borderWidth = 2;
    self.img.layer.masksToBounds = YES;
    self.img.layer.borderColor = [[UIColor whiteColor] CGColor];
}


- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
