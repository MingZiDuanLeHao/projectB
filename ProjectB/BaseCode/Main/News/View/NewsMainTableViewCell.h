//
//  NewsMainTableViewCell.h
//  ProjectB
//
//  Created by 瓶子 on 2016/9/29.
//  Copyright © 2016年 lanou. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface NewsMainTableViewCell : UITableViewCell
@property (weak, nonatomic) IBOutlet UIImageView *coverimg;
@property (weak, nonatomic) IBOutlet UILabel *mainTitle;
@property (weak, nonatomic) IBOutlet UILabel *subTitle;
@property (weak, nonatomic) IBOutlet UILabel *From;
@property (weak, nonatomic) IBOutlet UILabel *followCount;

@end
