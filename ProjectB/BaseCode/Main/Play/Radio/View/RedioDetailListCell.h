//
//  RedioDetailListCell.h
//  ProjectB
//
//  Created by lanou on 2016/9/29.
//  Copyright © 2016年 lanou. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "RadioDetailListList.h"

@interface RedioDetailListCell : UITableViewCell
@property (weak, nonatomic) IBOutlet UIImageView *img;
@property (weak, nonatomic) IBOutlet UILabel *titleLabel;
@property (weak, nonatomic) IBOutlet UILabel *playCount;
@property (weak, nonatomic) IBOutlet UILabel *time;
@property (nonatomic,strong) RadioDetailListList *list;
-(void)setDataWithModel:(RadioDetailListList *)model;

@end
