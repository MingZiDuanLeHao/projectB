//
//  WeherCollectionViewCell.m
//  ProjectB
//
//  Created by 瓶子 on 2016/10/13.
//  Copyright © 2016年 lanou. All rights reserved.
//

#import "WeherCollectionViewCell.h"
#import "GetxingqiDay.h"

@implementation WeherCollectionViewCell

- (void)awakeFromNib {
    // Initialization code
}
-(void)setModel:(WeatherDailyForecast *)model
{
    //星期几
    NSString *day =  [[GetxingqiDay defaultDay] featureWeekdayWithDate:model.date];
    _dayLabel.text = day;
    
    _temLabel.text = [NSString stringWithFormat:@"%@°/%@°", model.tmp.max,model.tmp.min];
    _windLabel.text = model.cond.txtD;
    
    //    _coverImg
    if ([model.cond.txtD isEqualToString: @"多云"] )
    {
        _coverImg.image = [UIImage imageNamed:@"多云"];
        return;
    }
    if ([model.cond.txtD isEqualToString: @"霾"] || [model.cond.txtD isEqualToString: @"阴"])
    {
        _coverImg.image = [UIImage imageNamed:@"阴"];
        return;
    }
    if ([model.cond.txtD isEqualToString: @"大雨"] ||[model.cond.txtD isEqualToString: @"中雨"] ||[model.cond.txtD isEqualToString: @"小雨"]  )
    {
        _coverImg.image = [UIImage imageNamed:@"雨"];
        return;
    }
    if ([model.cond.txtD isEqualToString: @"晴"]) {
        _coverImg.image = [UIImage imageNamed:@"晴"];
        return;
    }

}
@end
