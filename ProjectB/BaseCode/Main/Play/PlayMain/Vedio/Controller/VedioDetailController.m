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

static NSString *vedioDetailCell = @"vedioDetailCell";

@interface VedioDetailController ()<UITableViewDataSource,UITableViewDelegate,WMPlayerDelegate>
@property (strong,nonatomic) UITableView *tableV;
@property (strong,nonatomic) UIView *playView;

@property (nonatomic,strong) WMPlayer *wmPlayer;


@property (nonatomic, copy) NSString *url;
@property (nonatomic, strong) NSMutableArray *cellFrameArray;

/** 提示视图*/
/** 是否显示提示视图*/
@property (nonatomic, assign) BOOL showTopTipViewFlag;
@property (nonatomic, strong) NSIndexPath *indexPath;
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
}

-(void)initUI
{
    self.tableV.frame = CGRectMake(10, 0, SWidth - 20, SHeight +64);
    _tableV.delegate = self;
    _tableV.dataSource = self;
    _tableV.backgroundColor = [UIColor whiteColor];
//    [_tableV registerNib:[UINib nibWithNibName:@"VedioPlayCell" bundle:nil] forCellReuseIdentifier:cellID];
    [self.tableV registerClass:[UITableViewCell class] forCellReuseIdentifier:vedioDetailCell];
    [self.view addSubview:_tableV];
    UIView *aaa = [[UIView alloc]initWithFrame:CGRectMake(0, 0, SWidth, 100)];
    _tableV.tableHeaderView = aaa;
    aaa.backgroundColor = [UIColor redColor];
    
    _tableV.showsVerticalScrollIndicator = NO;
    //上提加载更多
    _tableV.mj_footer = [MJRefreshAutoNormalFooter footerWithRefreshingBlock:^{
        // 进入刷新状态后会自动调用这个block
        //最新
        //        self.page ++;
        //        self.lastestView = @"-1";
        [self requestData];
    }];
}

-(void)requestData
{
    NSString *UrlStr = [NSString stringWithFormat:@"http://isub.snssdk.com/neihan/comments/?iid=5593387628&os_version=9.3.3&os_api=18&app_name=joke_essay&channel=App%@Store&device_platform=iphone&idfa=9DE12873-6A67-4C26-8675-F2541AF47FB3&live_sdk_version=130&vid=4006D19B-01F8-4B64-9674-B9BC2016B99C&openudid=d6f8422354888bc5e7ca31764c250955439497ec&device_type=iPhone%@S&version_code=5.5.5&ac=WIFI&screen_width=640&device_id=3115037754&aid=7&count=20&device_id=3115037754&group_id=%@&offset=0&sort=hot&tag=joke",@"%20",@"%205",self.groupID];
    //    NSLog(@"!!!!!!!!!!!!%@",UrlStr);
    //转化一下,不然返回的data无法解析
    UrlStr = [UrlStr stringByAddingPercentEncodingWithAllowedCharacters:[NSCharacterSet characterSetWithCharactersInString:@"`#%^{}\"[]|\\<> "].invertedSet];
    [NetWorkRequest requestWithMethod:GET URL:UrlStr para:nil success:^(NSData *data) {
        if (data) {
            NSDictionary *dic = [NSJSONSerialization JSONObjectWithData:data options:0 error:nil];

            NSLog(@"===========%@",dic);
            NSArray *dataArr;
            
            //!!!!!为了去除广告 麻蛋
            for (NSDictionary *dicGroup in dataArr) {
                NSArray *arr = [dicGroup allKeys];
                int W = [dicGroup[@"group"][@"video_width"] intValue];
                int H = [dicGroup[@"group"][@"video_height"] intValue];
                //求出字体的高度,也加在高度上
                UILabel *label = [[UILabel alloc]init];
                label.text = dicGroup[@"group"][@"text"];
                //  NSLog(@"===========%@",label.text);
                // label的字体 HelveticaNeue  Courier
                UIFont *fnt = [UIFont fontWithName:@"HelveticaNeue" size:18.0f];
                label.font = fnt;
                label.numberOfLines = 0;
                label.lineBreakMode = NSLineBreakByWordWrapping;
                
                CGRect tmpRect = [label.text boundingRectWithSize:CGSizeMake(SWidth - 10, 1000) options:NSStringDrawingUsesLineFragmentOrigin attributes:[NSDictionary dictionaryWithObjectsAndKeys:fnt,NSFontAttributeName, nil] context:nil];
//                if ([arr containsObject:@"ad"]&& W == 0) {
//                    // NSLog(@"!!!!!!!!!!!!!%f,%f,%lu",W,H,(unsigned long)self.dataArray.count);
//                }else
//                {
//                    //   NSLog(@">>>>>>%f,%f,%lu",W,H,(unsigned long)self.dataArray.count);
//                    [self.dataArray addObject:dicGroup];
//                    [self.hightArray addObject:@(H * (SWidth - 10) /W + tmpRect.size.height + 90) ];
//                }
            }

            
            //   if (self.hightArray.count != 0) {
            dispatch_async(dispatch_get_main_queue(), ^{
                [_tableV reloadData];
                [_tableV.mj_footer endRefreshing];
            });
        }
        //   }
        _tableV.separatorStyle = UITableViewCellSeparatorStyleNone;
        
        
        
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
-(UITableView *)tableV
{
    if (!_tableV) {
        _tableV = [[UITableView alloc]init];
    }
    return _tableV;
}

#pragma mark - UITableViewDelegate

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    
    return 10;
}


-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
     return 200;

//    if ([self.hightArray[indexPath.row] integerValue] == 0  ) {
//        return 0;
//    }
//
//    return [self.hightArray[indexPath.row] intValue] ;
}

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:vedioDetailCell];
    // VedioModelComments *model = self.modelData.data.data[indexPath.row];
//    
//    NSDictionary *dic = self.dataArray[indexPath.row][@"group"];
//    NSDictionary *large_coverDic = dic[@"large_cover"];
//    NSArray *url_listArr = large_coverDic[@"url_list"];
//    
//    //cell.context.text = dic[@"text"];
//    
//    //赞  踩  评论
//    NSString *zan = [NSString stringWithFormat:@"%ld",[dic[@"digg_count"] integerValue]];
//    NSString *cai = [NSString stringWithFormat:@"%ld",[dic[@"bury_count"] integerValue]];
//    NSString *comment = [NSString stringWithFormat:@"%ld",[dic[@"comment_count"] integerValue]];
    

    


    
    
    
    
    //        [cell.img sd_setImageWithPreviousCachedImageWithURL:[NSURL URLWithString:url_listArr[0][@"url"]] placeholderImage:[UIImage imageNamed:@"占位图"] options:0 progress:nil completed:nil];
    
    for (UIView *view in cell.subviews) {
        if ([view isKindOfClass:[WMPlayer class]]) {
            [view removeFromSuperview];
        }
    }
    //    cell.playBtn.tag = indexPath.row + 100;
    //    [cell.playBtn addTarget:self action:@selector(playOrPause:) forControlEvents:UIControlEventTouchUpInside];
    
    // UITapGestureRecognizer *tapGesture = [[UITapGestureRecognizer alloc]initWithTarget:self action:@selector(playOrPause)];
    // [cell.screenView addGestureRecognizer:tapGesture];
    
    return cell;
}


- (nullable UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section
{
    UIView *aa = [[UIView alloc]initWithFrame:CGRectMake(0, 100, SWidth, 50)];
    aa.backgroundColor = [UIColor redColor];
    return aa;
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

- (NSMutableArray *)cellFrameArray {
    if (!_cellFrameArray) {
        _cellFrameArray = [NSMutableArray new];
    }
    return _cellFrameArray;
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
