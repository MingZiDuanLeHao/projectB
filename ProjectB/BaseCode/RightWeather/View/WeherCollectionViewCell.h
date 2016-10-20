//
//  WeherCollectionViewCell.h
//  ProjectB
//
//  Created by 瓶子 on 2016/10/13.
//  Copyright © 2016年 lanou. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "WeatherDataModels.h"

@interface WeherCollectionViewCell : UICollectionViewCell
@property (weak, nonatomic) IBOutlet UILabel *dayLabel;
@property (weak, nonatomic) IBOutlet UIImageView *coverImg;
@property (weak, nonatomic) IBOutlet UILabel *temLabel;
@property (weak, nonatomic) IBOutlet UILabel *windLabel;

@property(nonatomic,strong)WeatherDailyForecast *model;


@end
