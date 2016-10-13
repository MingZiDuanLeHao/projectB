//
//  WeherCollectionViewCell.m
//  ProjectB
//
//  Created by 瓶子 on 2016/10/13.
//  Copyright © 2016年 lanou. All rights reserved.
//

#import "WeherCollectionViewCell.h"

@implementation WeherCollectionViewCell

- (void)awakeFromNib {
    // Initialization code
}
-(void)setModel:(WeatherDailyForecast *)model
{
    _dayLabel.text = model.date;
    _temLabel.text = [NSString stringWithFormat:@"%@/%@", model.tmp.max,model.tmp.min];
    _windLabel.text = model.cond.txtD;
    
    //    _coverImg
    if ([model.cond.txtD isEqualToString: @"多云"] || [model.cond.txtD isEqualToString: @"霾"] )
    {
        _coverImg.image = [UIImage imageNamed:@"1"];
    }

}
@end
