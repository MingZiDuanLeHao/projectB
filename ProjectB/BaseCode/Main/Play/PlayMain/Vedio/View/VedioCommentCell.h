//
//  VedioCommentCell.h
//  ProjectB
//
//  Created by lanou on 2016/10/14.
//  Copyright © 2016年 lanou. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface VedioCommentCell : UITableViewCell
@property (weak, nonatomic) IBOutlet UIImageView *avatar;
@property (weak, nonatomic) IBOutlet UILabel *nameLabel;
@property (weak, nonatomic) IBOutlet UILabel *numZan;
@property (weak, nonatomic) IBOutlet UILabel *timeLabel;
@property (weak, nonatomic) IBOutlet UILabel *contemtLabel;
@property (weak, nonatomic) IBOutlet UIView *contentL;
@property (weak, nonatomic) IBOutlet UIView *backView;

@end
