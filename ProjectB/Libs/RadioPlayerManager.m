//
//  RadioPlayerManager.m
//  抽屉效果demo
//
//  Created by 瓶子 on 16/9/18.
//  Copyright © 2016年 GZ_lanou. All rights reserved.
//

#import "RadioPlayerManager.h"
#import "RadioDetailListList.h"

@implementation RadioPlayerManager

+(instancetype)defaultManager
{
    static dispatch_once_t onceToken = 0;
    static RadioPlayerManager *manager;
    //写在这里面的函数只会被执行一次
    dispatch_once(&onceToken, ^{
        manager = [[self alloc]init];
        
    });
    return manager;
}

-(id)init
{
    self = [super init];
    if (self) {
        _musicDataArray = [NSMutableArray array];
    }
    return self;
}

-(void)setMusicDataArray:(NSMutableArray *)musicDataArray
{
    //初始化音乐播放器 avplayer
    //拿出播放的url
    RadioDetailListList *list = musicDataArray[self.selectedIndex];
    AVPlayerItem *item = [[AVPlayerItem alloc]initWithURL:[NSURL URLWithString:list.playUrl64]];
    [[NSNotificationCenter defaultCenter]addObserver:self selector:@selector(finishedMusic) name:AVPlayerItemDidPlayToEndTimeNotification object:nil];
    if (_player) {
        [_player replaceCurrentItemWithPlayerItem:item];
    }
    else
    {
        _player = [[AVPlayer alloc]initWithPlayerItem:item];
    }
    
    _musicDataArray = musicDataArray;
    
}

-(void)finishedMusic
{
    NSLog(@"播放完成");
    if ([_delegate respondsToSelector:@selector(musicPlayDidEnd)]) {
        [_delegate musicPlayDidEnd];
    }
    
}
-(void)play
{
    _isplay = YES;
    [_player play];
    
}

-(void)pause
{
    _isplay = NO;
    [_player pause];
}

-(void)seekTotime:(CGFloat)seconds
{

    [_player seekToTime:CMTimeMakeWithSeconds(seconds, _player.currentTime.timescale) completionHandler:^(BOOL finished) {
        [_player play];
    }];
    
}

-(CGFloat)currentTime
{
    CGFloat time = _player.currentTime.value / _player.currentTime.timescale;
    return time;
}

-(CGFloat)totalTime
{
    CGFloat time = _player.currentItem.asset.duration.value / _player.currentItem.asset.duration.timescale;
    return time;
}

-(void)changeMusic
{
    RadioDetailListList *list = _musicDataArray[self.selectedIndex];
    AVPlayerItem *item = [[AVPlayerItem alloc]initWithURL:[NSURL URLWithString:list.playUrl64]];
    [_player replaceCurrentItemWithPlayerItem:item];
    [_player play];
}

-(void)lastMusic
{
    _selectedIndex = _selectedIndex - 1;
    if (_selectedIndex < 0) {
        _selectedIndex = _musicDataArray.count -1 ;
    }
    [self changeMusic];
}

-(void)nextNusic
{
    _selectedIndex = _selectedIndex + 1;
    _selectedIndex = _selectedIndex % _musicDataArray.count ;
    [self changeMusic];
}



@end
