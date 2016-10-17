//
//  RadioTwoCell.h
//  ProjectB
//
//  Created by 瓶子 on 2016/10/10.
//  Copyright © 2016年 lanou. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "RadioTwoUser.h"

@interface RadioTwoCell : UITableViewCell
@property (weak, nonatomic) IBOutlet UIImageView *smallLogo;
@property (weak, nonatomic) IBOutlet UILabel *nickName;
@property (weak, nonatomic) IBOutlet UILabel *follower;
@property (weak, nonatomic) IBOutlet UILabel *signature;
@property(nonatomic,strong)RadioTwoUser *model;

@end
