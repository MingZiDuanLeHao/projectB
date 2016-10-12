//
//  RadioPlayHeaderView.h
//  ProjectB
//
//  Created by 瓶子 on 2016/10/11.
//  Copyright © 2016年 lanou. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "RadioDetailListList.h"

typedef void(^clickLast)();
typedef void(^clickPause)();
typedef void(^clickNext)();
typedef void(^drag)();


@interface RadioPlayHeaderView : UIView
@property (weak, nonatomic) IBOutlet UIImageView *headimg;
@property (weak, nonatomic) IBOutlet UILabel *nickName;
@property (weak, nonatomic) IBOutlet UIImageView *coverImg;
@property (weak, nonatomic) IBOutlet UISlider *progressSlider;
@property (weak, nonatomic) IBOutlet UILabel *totalTime;
@property (weak, nonatomic) IBOutlet UILabel *currentTime;
@property (weak, nonatomic) IBOutlet UIButton *pauseBut;

@property(nonatomic,copy)clickLast lastBlock;
@property(nonatomic,copy)clickPause pauseBlock;
@property(nonatomic,copy)clickNext nextBlock;
@property(nonatomic,copy)drag dragBlock;


@property(nonatomic,strong)RadioDetailListList *List;

@end
