//
//  RadioMainRightTableCell.h
//  ProjectB
//
//  Created by lanou on 2016/9/29.
//  Copyright © 2016年 lanou. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "List.h"

@interface RadioMainRightTableCell : UITableViewCell
@property (weak, nonatomic) IBOutlet UILabel *titlelabel;
@property (weak, nonatomic) IBOutlet UILabel *playCount;
@property (weak, nonatomic) IBOutlet UILabel *desc;
@property (weak, nonatomic) IBOutlet UILabel *NumCount;
@property (weak, nonatomic) IBOutlet UIImageView *img;
@property (strong,nonatomic) List *list;

-(void)setDataWithModel:(List *)model;

@end
