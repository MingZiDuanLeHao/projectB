//
//  RadioPlayHeaderView.m
//  ProjectB
//
//  Created by 瓶子 on 2016/10/11.
//  Copyright © 2016年 lanou. All rights reserved.
//

#import "RadioPlayHeaderView.h"
#import "RadioPlayerManager.h"

@implementation RadioPlayHeaderView

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/
-(void)setList:(RadioDetailListList *)List
{
    [self.headimg sd_setImageWithURL:[NSURL URLWithString:List.smallLogo]];
    self.nickName.text = List.nickname;
    [self.coverImg sd_setImageWithURL:[NSURL URLWithString:List.coverLarge]];
    self.progressSlider.value = 0;
    CGFloat time = [[RadioPlayerManager defaultManager] totalTime];
    if ((int)time%60 < 10) {
        self.totalTime.text = [NSString stringWithFormat:@"%d:0%d",(int)time/60,(int)time%60];
    }
    else
    {
        self.totalTime.text = [NSString stringWithFormat:@"%d:%d",(int)time/60,(int)time%60];
    }
    
    
    
}
- (IBAction)dragSlider:(id)sender {
    _dragBlock();
}
- (IBAction)lastSong:(id)sender {
    _lastBlock();
}
- (IBAction)pause:(id)sender {
    _pauseBlock();
}
- (IBAction)nextSong:(id)sender {
    _nextBlock();
}


@end
