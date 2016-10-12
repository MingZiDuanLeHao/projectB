//
//  RadioPlayerManager.h
//  抽屉效果demo
//
//  Created by 瓶子 on 16/9/18.
//  Copyright © 2016年 GZ_lanou. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <AVFoundation/AVFoundation.h>

@protocol MusicEnd <NSObject>

-(void)musicPlayDidEnd;

@end

@interface RadioPlayerManager : NSObject

@property(nonatomic,assign)id<MusicEnd> delegate;
@property(nonatomic,assign)BOOL isplay;
@property(nonatomic,strong)AVPlayer *player;
//数据源
@property(nonatomic,strong)NSMutableArray *musicDataArray;

//选择的索引
@property(nonatomic,assign)NSInteger selectedIndex;
+(instancetype)defaultManager;

//当前时间与总时间
@property(nonatomic,assign)CGFloat currentTime;
@property(nonatomic,assign)CGFloat totalTime;

//播放 暂停 跳转
-(void)play;
-(void)pause;
-(void)seekTotime:(CGFloat)seconds;
//上一首下一首
-(void)lastMusic;
-(void)nextNusic;


@end
