//
//  VedioDetailController.m
//  ProjectB
//
//  Created by lanou on 2016/10/14.
//  Copyright © 2016年 lanou. All rights reserved.
//

#import "VedioDetailController.h"
#import "MJRefresh.h"
#import "UIImageView+WebCache.h"
#import <AVFoundation/AVFoundation.h>
#import "WMPlayer.h"
#import "NHBaseImageView.h"
#import "VedioConmmentModelDataModels.h"
#import "VedioCommentCell.h"

static NSString *vedioDetailCell = @"vedioDetailCell";

@interface VedioDetailController ()<UITableViewDataSource,UITableViewDelegate,WMPlayerDelegate>
@property (strong,nonatomic) UITableView *tableV;
@property (strong,nonatomic) UIView *playView;

@property (nonatomic,strong) WMPlayer *wmPlayer;
@property (nonatomic,strong) VedioConmmentModelVedioConmmentModel *detailModel;


@property (nonatomic, copy) NSString *url;
@property (nonatomic, assign) NSInteger offset;

/** 提示视图*/
/** 是否显示提示视图*/
@property (nonatomic, assign) BOOL showTopTipViewFlag;
@property (nonatomic, assign) BOOL isFirstEnter;
@property (nonatomic, assign) BOOL isSmallScreen;
@property (nonatomic, assign) BOOL isFinish;

@property (nonatomic, weak) NHBaseImageView *imageView;
@end

@implementation VedioDetailController


- (void)viewDidLoad {
    [super viewDidLoad];
    [self initUI];
    [self requestData];
   // NSLog(@"==========%@,%@,%@,%@,%ld",self.content,self.vedioUrl,self.imgUrl,self.groupID,self.vedioHight);
}

-(void)viewWillDisappear:(BOOL)animated
{
    [self releaseWMPlayer];
}


-(void)initUI
{

    self.offset = 0;
    
    //视频背景
    UIView *backgroundView = [[UIView alloc]initWithFrame:CGRectMake(5,5, SWidth - 10, 300)];
    backgroundView.backgroundColor = [UIColor blackColor];
    [self.view addSubview:backgroundView];
    float vedioH = [self.hightDic[@"hight"] floatValue];
    float vedioW = [self.hightDic[@"wight"] floatValue];

    if (vedioW/vedioH >= (SWidth - 10)/300) {
        CGFloat currentH = (SWidth - 10)*vedioH/vedioW;
        self.wmPlayer = [[WMPlayer alloc]initWithFrame:CGRectMake(5, 5 , SWidth - 10, currentH)];
        self.tableV.frame = CGRectMake(5, currentH +10, SWidth - 10, SHeight - 10 - currentH);
    }else{
        CGFloat currentW = 300 * vedioW / vedioH;
        self.wmPlayer = [[WMPlayer alloc]initWithFrame:CGRectMake(5  + (SWidth - 10 - currentW)/2, 5 , currentW, 300)];
        self.tableV.frame = CGRectMake(5, 10 + 300, SWidth - 10, SHeight - 10 - 300);
    }
     //播放器
    
    //self.wmPlayer = [[WMPlayer alloc]initWithFrame:CGRectMake(5, 5, SWidth - 10, 300)];
    
    self.wmPlayer.delegate = self;
    
    self.wmPlayer.URLString = self.vedioUrl;
    [self.view addSubview:self.wmPlayer];
    [self.wmPlayer.player play];
    
    

    _tableV.delegate = self;
    _tableV.dataSource = self;
    _tableV.backgroundColor = [UIColor lightGrayColor];
    [_tableV registerNib:[UINib nibWithNibName:@"VedioCommentCell" bundle:nil] forCellReuseIdentifier:vedioDetailCell];
//    [self.tableV registerClass:[UITableViewCell class] forCellReuseIdentifier:vedioDetailCell];
    [self.view addSubview:_tableV];

    UIView *contentView = [[UIView alloc]initWithFrame:CGRectMake(5, 400, SWidth - 10, 100)];
    _tableV.tableHeaderView = contentView;
    contentView.backgroundColor = [UIColor colorWithRed:231.0/255 green:242.0/255 blue:253.0/255 alpha:1.0];
    UILabel *contentLabel = [[UILabel alloc]initWithFrame:CGRectMake(5, 5, SWidth - 10, 100)];
    contentLabel.text = self.content;
    contentLabel.numberOfLines = 0;
    [contentView addSubview:contentLabel];
    _tableV.showsVerticalScrollIndicator = NO;
    _tableV.separatorStyle = UITableViewCellSeparatorStyleNone;
    //上提加载更多
    _tableV.mj_footer = [MJRefreshAutoNormalFooter footerWithRefreshingBlock:^{
        // 进入刷新状态后会自动调用这个block
        //最新
                self.offset ++;
        //        self.lastestView = @"-1";
        [self requestData];
    }];
    

    _tableV.estimatedRowHeight = 200;
    
    _tableV.rowHeight = UITableViewAutomaticDimension;
    
}



-(void)requestData
{
    NSString *UrlStr = [NSString stringWithFormat:@"http://isub.snssdk.com/neihan/comments/?iid=5593387628&os_version=9.3.3&os_api=18&app_name=joke_essay&channel=App%@Store&device_platform=iphone&idfa=9DE12873-6A67-4C26-8675-F2541AF47FB3&live_sdk_version=130&vid=4006D19B-01F8-4B64-9674-B9BC2016B99C&openudid=d6f8422354888bc5e7ca31764c250955439497ec&device_type=iPhone%@S&version_code=5.5.5&ac=WIFI&screen_width=640&device_id=3115037754&aid=7&count=20&device_id=3115037754&group_id=%@&offset=%ld&sort=hot&tag=joke",@"%20",@"%205",self.groupID,self.offset];
    //    NSLog(@"!!!!!!!!!!!!%@",UrlStr);
    //转化一下,不然返回的data无法解析
    UrlStr = [UrlStr stringByAddingPercentEncodingWithAllowedCharacters:[NSCharacterSet characterSetWithCharactersInString:@"`#%^{}\"[]|\\<> "].invertedSet];
    [NetWorkRequest requestWithMethod:GET URL:UrlStr para:nil success:^(NSData *data) {
        if (data) {
            NSDictionary *dic = [NSJSONSerialization JSONObjectWithData:data options:0 error:nil];

          //  NSLog(@"===========%@",dic);
            
            self.detailModel = [VedioConmmentModelVedioConmmentModel modelObjectWithDictionary:dic];

 
            dispatch_async(dispatch_get_main_queue(), ^{
                [_tableV reloadData];
                [_tableV.mj_footer endRefreshing];
            });
        }
     
        
    } error:^(NSError *error) {
        NSLog(@"error===%@",error);
    } view:self.view];

}

#pragma mark - 懒加载
-(NSMutableArray *)dataArray
{
    if (!_dataArray) {
        _dataArray = [NSMutableArray array];
    }
    return _dataArray;
}
-(NSMutableArray *)hightArray
{
    if (!_hightArray) {
        _hightArray = [NSMutableArray array];
    }
    return _hightArray;
}
-(NSDictionary *)hightDic
{
    if (!_hightDic) {
        _hightDic = [NSDictionary dictionary];
    }
    return _hightDic;
}
-(UITableView *)tableV
{
    if (!_tableV) {
        _tableV = [[UITableView alloc]init];
    }
    return _tableV;
}

#pragma mark - UITableViewDelegate


-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 2;
}
-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    if (section == 0) {
        return _detailModel.data.topComments.count;
    }else if (section ==1)
    {
       return _detailModel.data.recentComments.count;
    }else{
        return 0;
    }

    
    
}




-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    VedioCommentCell *cell = [tableView dequeueReusableCellWithIdentifier:vedioDetailCell];


    if (indexPath.section == 0) {
        VedioConmmentModelTopComments *topicComment = self.detailModel.data.topComments[indexPath.row];
       // [cell.avatar sd_setImageWithURL:[NSURL URLWithString:topicComment.avatarUrl]];
        [cell.avatar sd_setImageWithPreviousCachedImageWithURL:[NSURL URLWithString:topicComment.avatarUrl] placeholderImage:[UIImage imageNamed:@"4.jpg"] options:0 progress:nil completed:nil];
        cell.nameLabel.text = topicComment.userName;
        cell.contemtLabel.text = topicComment.text;
        cell.numZan.text = [NSString stringWithFormat:@"%.0f赞",topicComment.diggCount];
        cell.timeLabel.text = [self timeTranformWithTime:topicComment.createTime];
        
    }else if(indexPath.section == 1){
        VedioConmmentModelRecentComments *recentComment = self.detailModel.data.recentComments[indexPath.row];
        [cell.avatar sd_setImageWithPreviousCachedImageWithURL:[NSURL URLWithString:recentComment.avatarUrl] placeholderImage:[UIImage imageNamed:@"4.jpg"] options:0 progress:nil completed:nil];
       // [cell.avatar sd_setImageWithURL:[NSURL URLWithString:recentComment.avatarUrl]];
        cell.nameLabel.text = recentComment.userName;
        cell.contemtLabel.text = recentComment.text;
        cell.numZan.text = [NSString stringWithFormat:@"%.0f赞",recentComment.diggCount];

        cell.timeLabel.text = [self timeTranformWithTime:recentComment.createTime];
    }
//

    cell.backView.layer.cornerRadius = 4;
    cell.backView.layer.masksToBounds = YES;
    cell.selectionStyle = UITableViewCellSelectionStyleNone;

    return cell;
}

 //时间戳转化为时间
-(NSString *)timeTranformWithTime:(CGFloat)timestamp
{

    NSString *str=[NSString stringWithFormat:@"%f",timestamp];//时间戳
    NSTimeInterval time=[str doubleValue]+28800;//因为时差问题要加8小时 == 28800 sec
    NSDate *detaildate=[NSDate dateWithTimeIntervalSince1970:time];
    NSLog(@"date:%@",[detaildate description]);
    //实例化一个NSDateFormatter对象
    NSDateFormatter *dateFormatter = [[NSDateFormatter alloc] init];
    //设定时间格式,这里可以设置成自己需要的格式
    [dateFormatter setDateFormat:@"yyyy年MM-dd HH:mm:ss"];
    NSString *currentDateStr = [dateFormatter stringFromDate: detaildate];
    return currentDateStr;
}

-(CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section
{
    return 50;
}
-(UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section
{
    
    UIView *headerV = [[UIView alloc]initWithFrame:CGRectMake(0, 0, SWidth, 50)];
    headerV.backgroundColor = [UIColor colorWithRed:45.0/255 green:77.0/255 blue:217.0/255 alpha:1.0];
    UILabel *label = [[UILabel alloc]initWithFrame:CGRectMake(0, 0, SWidth, 50)];
    [headerV addSubview:label];
    label.textAlignment = NSTextAlignmentCenter;
    headerV.layer.cornerRadius = 4;
    headerV.layer.masksToBounds = YES;
    if (section == 0) {
        label.text = @"热门";
    }else
    {
        label.text = @"最新";
    }
    
    return headerV;
}



#pragma mark - WMPlayerDelegate
- (BOOL)prefersStatusBarHidden {
    if (_wmPlayer) {
        if (_wmPlayer.isFullscreen) {
            return YES;
        } else {
            return NO;
        }
    } else {
        return NO;
    }
}

- (void)toCell {
    [_wmPlayer removeFromSuperview];
    [UIView animateWithDuration:0.5f animations:^{
        _wmPlayer.transform = CGAffineTransformIdentity;
        // _wmPlayer.frame = self.imageView.bounds;
        _wmPlayer.playerLayer.frame =  _wmPlayer.bounds;
        [self.imageView addSubview:_wmPlayer];
        [self.imageView bringSubviewToFront:_wmPlayer];
        [_wmPlayer.bottomView mas_remakeConstraints:^(MASConstraintMaker *make) {
            make.left.equalTo(_wmPlayer).with.offset(0);
            make.right.equalTo(_wmPlayer).with.offset(0);
            make.height.mas_equalTo(40);
            make.bottom.equalTo(_wmPlayer).with.offset(0);
        }];
        [_wmPlayer.topView mas_remakeConstraints:^(MASConstraintMaker *make) {
            make.left.equalTo(_wmPlayer).with.offset(0);
            make.right.equalTo(_wmPlayer).with.offset(0);
            make.height.mas_equalTo(40);
            make.top.equalTo(_wmPlayer).with.offset(0);
        }];
        [_wmPlayer.titleLabel mas_remakeConstraints:^(MASConstraintMaker *make) {
            make.left.equalTo(_wmPlayer.topView).with.offset(45);
            make.right.equalTo(_wmPlayer.topView).with.offset(-45);
            make.center.equalTo(_wmPlayer.topView);
            make.top.equalTo(_wmPlayer.topView).with.offset(0);
        }];
        [_wmPlayer.closeBtn mas_remakeConstraints:^(MASConstraintMaker *make) {
            make.left.equalTo(_wmPlayer).with.offset(5);
            make.height.mas_equalTo(30);
            make.width.mas_equalTo(30);
            make.top.equalTo(_wmPlayer).with.offset(5);
        }];
        [_wmPlayer.loadFailedLabel mas_remakeConstraints:^(MASConstraintMaker *make) {
            make.center.equalTo(_wmPlayer);
            make.width.equalTo(_wmPlayer);
            make.height.equalTo(@30);
        }];
    }completion:^(BOOL finished) {
        _wmPlayer.isFullscreen = NO;
        [self setNeedsStatusBarAppearanceUpdate];
        self.isSmallScreen = NO;
        _wmPlayer.fullScreenBtn.selected = NO;
        
    }];
    
    
}

- (void)toFullScreenWithInterfaceOrientation:(UIInterfaceOrientation )interfaceOrientation {
    [_wmPlayer removeFromSuperview];
    _wmPlayer.transform = CGAffineTransformIdentity;
    if (interfaceOrientation==UIInterfaceOrientationLandscapeLeft) {
        _wmPlayer.transform = CGAffineTransformMakeRotation(-M_PI_2);
    } else if(interfaceOrientation==UIInterfaceOrientationLandscapeRight){
        _wmPlayer.transform = CGAffineTransformMakeRotation(M_PI_2);
    }
    _wmPlayer.frame = CGRectMake(0, 0, SWidth, SHeight);
    _wmPlayer.playerLayer.frame =  CGRectMake(0,0, SHeight,SWidth);
    
    [_wmPlayer.bottomView mas_remakeConstraints:^(MASConstraintMaker *make) {
        make.height.mas_equalTo(40);
        make.top.mas_equalTo(SWidth-40);
        make.width.mas_equalTo(SHeight);
    }];
    
    [_wmPlayer.topView mas_remakeConstraints:^(MASConstraintMaker *make) {
        make.height.mas_equalTo(40);
        make.left.equalTo(_wmPlayer).with.offset(0);
        make.width.mas_equalTo(SHeight);
    }];
    
    [_wmPlayer.closeBtn mas_remakeConstraints:^(MASConstraintMaker *make) {
        make.right.equalTo(_wmPlayer).with.offset((-SHeight/2));
        make.height.mas_equalTo(30);
        make.width.mas_equalTo(30);
        make.top.equalTo(_wmPlayer).with.offset(5);
        
    }];
    
    [_wmPlayer.titleLabel mas_remakeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(_wmPlayer.topView).with.offset(45);
        make.right.equalTo(_wmPlayer.topView).with.offset(-45);
        make.center.equalTo(_wmPlayer.topView);
        make.top.equalTo(_wmPlayer.topView).with.offset(0);
    }];
    
    [_wmPlayer.loadFailedLabel mas_remakeConstraints:^(MASConstraintMaker *make) {
        make.width.mas_equalTo(SHeight);
        make.center.mas_equalTo(CGPointMake(SWidth/2-36, -(SWidth/2)));
        make.height.equalTo(@30);
    }];
    
    [_wmPlayer.loadingView mas_remakeConstraints:^(MASConstraintMaker *make) {
        make.center.mas_equalTo(CGPointMake(SWidth/2-37, -(SWidth/2-37)));
    }];
    [_wmPlayer.loadFailedLabel mas_remakeConstraints:^(MASConstraintMaker *make) {
        make.width.mas_equalTo(SHeight);
        make.center.mas_equalTo(CGPointMake(SWidth/2-36, -(SWidth/2)+36));
        make.height.equalTo(@30);
    }];
    [[UIApplication sharedApplication].keyWindow addSubview:_wmPlayer];
    
    _wmPlayer.fullScreenBtn.selected = YES;
    [_wmPlayer bringSubviewToFront:_wmPlayer.bottomView];
    
}

- (void)toSmallScreen {
    // 放widow上
    [_wmPlayer removeFromSuperview];
    [UIView animateWithDuration:0.3f animations:^{
        _wmPlayer.transform = CGAffineTransformIdentity;
        _wmPlayer.frame = CGRectMake(SWidth/2,SHeight-49-(SWidth/2)*0.75, SWidth/2, (SWidth/2)*0.75);
        _wmPlayer.playerLayer.frame = _wmPlayer.bounds;
        [[UIApplication sharedApplication].keyWindow addSubview:_wmPlayer];
        [_wmPlayer.bottomView mas_remakeConstraints:^(MASConstraintMaker *make) {
            make.left.equalTo(_wmPlayer).with.offset(0);
            make.right.equalTo(_wmPlayer).with.offset(0);
            make.height.mas_equalTo(40);
            make.bottom.equalTo(_wmPlayer).with.offset(0);
        }];
        [_wmPlayer.topView mas_remakeConstraints:^(MASConstraintMaker *make) {
            make.left.equalTo(_wmPlayer).with.offset(0);
            make.right.equalTo(_wmPlayer).with.offset(0);
            make.height.mas_equalTo(40);
            make.top.equalTo(_wmPlayer).with.offset(0);
        }];
        [_wmPlayer.titleLabel mas_remakeConstraints:^(MASConstraintMaker *make) {
            make.left.equalTo(_wmPlayer.topView).with.offset(45);
            make.right.equalTo(_wmPlayer.topView).with.offset(-45);
            make.center.equalTo(_wmPlayer.topView);
            make.top.equalTo(_wmPlayer.topView).with.offset(0);
        }];
        [_wmPlayer.closeBtn mas_remakeConstraints:^(MASConstraintMaker *make) {
            make.left.equalTo(_wmPlayer).with.offset(5);
            make.height.mas_equalTo(30);
            make.width.mas_equalTo(30);
            make.top.equalTo(_wmPlayer).with.offset(5);
            
        }];
        [_wmPlayer.loadFailedLabel mas_remakeConstraints:^(MASConstraintMaker *make) {
            make.center.equalTo(_wmPlayer);
            make.width.equalTo(_wmPlayer);
            make.height.equalTo(@30);
        }];
        
    } completion:^(BOOL finished) {
        _wmPlayer.isFullscreen = NO;
        [self setNeedsStatusBarAppearanceUpdate];
        _wmPlayer.fullScreenBtn.selected = NO;
        self.isSmallScreen = YES;
        [[UIApplication sharedApplication].keyWindow bringSubviewToFront:_wmPlayer];
    }];
}

- (void)wmplayer:(WMPlayer *)wmplayer clickedCloseButton:(UIButton *)closeBtn {
    if (wmplayer.isFullscreen) {
        wmplayer.isFullscreen = NO;
        [self toCell];
    } else {
        [self releaseWMPlayer];
    }
    
}

- (void)wmplayer:(WMPlayer *)wmplayer clickedFullScreenButton:(UIButton *)fullScreenBtn {
    if (fullScreenBtn.isSelected) {//全屏显示
        _wmPlayer.isFullscreen = YES;
        [self setNeedsStatusBarAppearanceUpdate];
        [self toFullScreenWithInterfaceOrientation:UIInterfaceOrientationLandscapeRight];
    } else {
        if (self.isSmallScreen) {
            // 放widow上,小屏显示
            [self toSmallScreen];
        } else {
            [self toCell];
        }
    }
}

- (void)wmplayer:(WMPlayer *)wmplayer singleTaped:(UITapGestureRecognizer *)singleTap{
    NSLog(@"didSingleTaped");
}

- (void)wmplayer:(WMPlayer *)wmplayer doubleTaped:(UITapGestureRecognizer *)doubleTap{
    NSLog(@"didDoubleTaped");
}

- (void)wmplayerFailedPlay:(WMPlayer *)wmplayer WMPlayerStatus:(WMPlayerState)state {
    NSLog(@"wmplayerDidFailedPlay");
}

- (void)wmplayerReadyToPlay:(WMPlayer *)wmplayer WMPlayerStatus:(WMPlayerState)state {
    NSLog(@"wmplayerDidReadyToPlay");
}

- (void)wmplayerFinishedPlay:(WMPlayer *)wmplayer {
    [self releaseWMPlayer];
    self.isFinish = YES;
}

- (void)releaseWMPlayer {
    [_wmPlayer pause];
    [_wmPlayer removeFromSuperview];
    [_wmPlayer.playerLayer removeFromSuperlayer];
    [_wmPlayer.player replaceCurrentItemWithPlayerItem:nil];
    _wmPlayer.player = nil;
    _wmPlayer.currentItem = nil;
    //释放定时器，否侧不会调用WMPlayer中的dealloc方法
    [_wmPlayer.autoDismissTimer invalidate];
    _wmPlayer.autoDismissTimer = nil;
    _wmPlayer.playOrPauseBtn = nil;
    _wmPlayer.playerLayer = nil;
    _wmPlayer = nil;
}





- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
