//
//  weatherHeaderView.h
//  ProjectB
//
//  Created by 瓶子 on 2016/10/14.
//  Copyright © 2016年 lanou. All rights reserved.
//

#import <UIKit/UIKit.h>


@interface weatherHeaderView : UIView



@property (weak, nonatomic) IBOutlet UILabel *temLabel;
@property (weak, nonatomic) IBOutlet UILabel *locLabel;
@property (weak, nonatomic) IBOutlet UILabel *timeLabel;
@property (weak, nonatomic) IBOutlet UIImageView *coverImg;
@property (weak, nonatomic) IBOutlet UILabel *stateLabel;
@property (weak, nonatomic) IBOutlet UILabel *HighLowTemLabel;
@property (weak, nonatomic) IBOutlet UILabel *PMLabel;
@property (weak, nonatomic) IBOutlet UILabel *windLabel;
@property (weak, nonatomic) IBOutlet UICollectionView *sevenDayCollView;
@property (weak, nonatomic) IBOutlet UILabel *wearingLabel;
@property (weak, nonatomic) IBOutlet UILabel *wearingDetailLabel;
@property (weak, nonatomic) IBOutlet UILabel *coughLabel;
@property (weak, nonatomic) IBOutlet UILabel *coughDetailLabel;

//传输据给dailyArr
@property(nonatomic,strong)NSArray *dailyArr;


@end
