//
//  VedioPlayViewController.m
//  ProjectB
//
//  Created by 瓶子 on 2016/9/30.
//  Copyright © 2016年 lanou. All rights reserved.
//

#import "VedioPlayViewController.h"
#import "AppDelegate.h"
#import "UIImageView+WebCache.h"
#import <AVFoundation/AVFoundation.h>
#import "WMPlayer.h"
#import "VedioPlayCell.h"
#import "NHBaseImageView.h"
#import "VedioDataModels.h"
#import "MJRefresh.h"
#import "VedioDetailController.h"

static NSString *cellID = @"playCell";
@interface VedioPlayViewController ()<WMPlayerDelegate,UITableViewDataSource,UITableViewDelegate>
@property (nonatomic,strong) WMPlayer *wmPlayer;
@property (nonatomic,strong) NSMutableArray *dataArray;
@property (nonatomic,strong) NSMutableArray *hightArray;
@property (nonatomic,strong) NSMutableArray *hightArray2;
@property (nonatomic,strong) UITableView *tableV;

@property (nonatomic,strong) NSIndexPath *QindexPath;

@property (nonatomic, copy) NSString *url;
@property (nonatomic, strong) NSMutableArray *cellFrameArray;
@property (nonatomic, weak) NHBaseImageView *imageView;
@property (nonatomic, strong) VedioModelVedioModel *modelData;
/** 提示视图*/
/** 是否显示提示视图*/
@property (nonatomic, assign) BOOL showTopTipViewFlag;
@property (nonatomic, strong) NSIndexPath *indexPath;
@property (nonatomic, assign) BOOL isFirstEnter;
@property (nonatomic, assign) BOOL isSmallScreen;
@property (nonatomic, assign) BOOL isFinish;
@property (nonatomic, strong) NSString *groupID;

@end

@implementation VedioPlayViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self initUI];
    [self requestData];
 
}
-(void)viewWillDisappear:(BOOL)animated
{
//    [self.navigationController.navigationBar setBackgroundImage:[UIImage new] forBarMetrics:0];
//    self.navigationController.navigationBar.shadowImage=[UIImage new];
    [self.wmPlayer resetWMPlayer];
   
}
-(void)viewWillAppear:(BOOL)animated
{
    self.isFirstEnter = YES;
    self.navigationController.navigationBarHidden = NO;
    ((AppDelegate *)([UIApplication sharedApplication].delegate)).mainTabble.tabBar.hidden = YES;
//    [self.navigationController.navigationBar setBackgroundImage:nil forBarMetrics:0];
//    self.navigationController.navigationBar.shadowImage=nil;
}


-(void)initUI
{
//    [self.navigationController.navigationBar setColor:[UIColor whiteColor]];
//    [self.navigationController.navigationBar setBackgroundColor:[UIColor lightGrayColor]];
    self.title = @"视频";
//    self.view.backgroundColor = [UIColor lightGrayColor];
   // self.edgesForExtendedLayout = UIRectEdgeNone;
    self.tableV.frame = CGRectMake(10, 0, SWidth - 20, SHeight +64);
    _tableV.delegate = self;
    _tableV.dataSource = self;
    _tableV.backgroundColor = [UIColor whiteColor];
    [_tableV registerNib:[UINib nibWithNibName:@"VedioPlayCell" bundle:nil] forCellReuseIdentifier:cellID];
    [self.view addSubview:_tableV];
    //隐藏分割线
    _tableV.separatorStyle = UITableViewCellSeparatorStyleNone;

    _tableV.showsVerticalScrollIndicator = NO;
    //上提加载更多
    _tableV.mj_footer = [MJRefreshAutoNormalFooter footerWithRefreshingBlock:^{
           [self requestData];
    }];
    
 
}
-(void)requestData
{
    NSString *UrlStr = [NSString stringWithFormat:@"http://ic.snssdk.com/neihan/stream/mix/v1/?content_type=-104&iid=5593387628&os_version=9.3.3&os_api=18&app_name=joke_essay&channel=App%@Store&device_platform=iphone&idfa=9DE12873-6A67-4C26-8675-F2541AF47FB3&live_sdk_version=130&vid=4006D19B-01F8-4B64-9674-B9BC2016B99C&openudid=d6f8422354888bc5e7ca31764c250955439497ec&device_type=iPhone%@S&version_code=5.5.5&ac=WIFI&screen_width=640&device_id=3115037754&aid=7&content_type=-104&count=30&min_time=1475026801",@"20",@"205"];
    //    NSLog(@"!!!!!!!!!!!!%@",UrlStr);
    //转化一下,不然返回的data无法解析
    UrlStr = [UrlStr stringByAddingPercentEncodingWithAllowedCharacters:[NSCharacterSet characterSetWithCharactersInString:@"`#%^{}\"[]|\\<> "].invertedSet];
    [NetWorkRequest requestWithMethod:GET URL:UrlStr para:nil success:^(NSData *data) {
        if (data) {
            NSDictionary *dic = [NSJSONSerialization JSONObjectWithData:data options:0 error:nil];
            self.modelData = [VedioModelVedioModel modelObjectWithDictionary:dic];
       
            NSArray *dataArr = self.modelData.data.data;

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
                UIFont *fnt = [UIFont fontWithName:@"System" size:17.0f];
                label.font = fnt;
                label.numberOfLines = 0;
                
                label.lineBreakMode = NSLineBreakByWordWrapping;

                CGRect tmpRect = [label.text boundingRectWithSize:CGSizeMake(SWidth - 10, 1000) options:NSStringDrawingUsesLineFragmentOrigin attributes:[NSDictionary dictionaryWithObjectsAndKeys:fnt,NSFontAttributeName, nil] context:nil];
                NSLog(@"!!!!!!!!!!!!!%f",tmpRect.size.height);
                if ([arr containsObject:@"ad"]&& W == 0) {

                }else
                {

                   [self.dataArray addObject:dicGroup];
                    NSDictionary *dicWH = @{@"wight": [NSString stringWithFormat:@"%d",W],@"hight":[NSString stringWithFormat:@"%d",H]};
                    [self.hightArray2 addObject:dicWH];
                   [self.hightArray addObject:@(H * (SWidth - 10) /W + tmpRect.size.height + 90) ];
                }
            }
  
        dispatch_async(dispatch_get_main_queue(), ^{
            [_tableV reloadData];
            [_tableV.mj_footer endRefreshing];
        });
    }
  
    } error:^(NSError *error) {
        NSLog(@"error===%@",error);
    } view:self.view];
}

-(void)zanRequestDataWithGroupID:(NSString *)groupID
{
    NSDictionary *dic = @{@"action":@"digg",@"deviceid":@"3115037754",@"group_id":groupID,@"share":@"0",@"url":@"",@"tag":@"joke"};
    NSString *UrlStr = [NSString stringWithFormat:@"http://isub.snssdk.com/2/data/item_action/?iid=5593387628&os_version=9.3.3&os_api=18&app_name=joke_essay&channel=App%@Store&device_platform=iphone&idfa=9DE12873-6A67-4C26-8675-F2541AF47FB3&live_sdk_version=130&vid=4006D19B-01F8-4B64-9674-B9BC2016B99C&openudid=d6f8422354888bc5e7ca31764c250955439497ec&device_type=iPhone%@S&version_code=5.5.5&ac=WIFI&screen_width=640&device_id=3115037754&aid=7",@"20",@"205"];
    //    NSLog(@"!!!!!!!!!!!!%@",UrlStr);
    //转化一下,不然返回的data无法解析
    UrlStr = [UrlStr stringByAddingPercentEncodingWithAllowedCharacters:[NSCharacterSet characterSetWithCharactersInString:@"`#%^{}\"[]|\\<> "].invertedSet];
    [NetWorkRequest requestWithMethod:POST URL:UrlStr para:dic success:^(NSData *data) {
        if (data) {
            NSDictionary *dic = [NSJSONSerialization JSONObjectWithData:data options:0 error:nil];
            NSLog(@"===================%@",dic);

        }

    } error:^(NSError *error) {
        NSLog(@"error===%@",error);
    } view:self.view];

}



- (void)viewDidDisappear:(BOOL)animated {
    [super viewDidDisappear:animated];
    [self releaseWMPlayer];
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
-(NSMutableArray *)hightArray2
{
    if (!_hightArray2) {
        _hightArray2 = [NSMutableArray array];
    }
    return _hightArray2;
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

    return self.dataArray.count;
}


-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{

    if ([self.hightArray[indexPath.row] integerValue] == 0  ) {
        return 0;
    }

    return [self.hightArray[indexPath.row] intValue] ;
}

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    //[self releaseWMPlayer];
    VedioPlayCell *cell = [tableView dequeueReusableCellWithIdentifier:cellID];
   // VedioModelComments *model = self.modelData.data.data[indexPath.row];

    NSDictionary *dic = self.dataArray[indexPath.row][@"group"];
    NSDictionary *large_coverDic = dic[@"large_cover"];
    NSArray *url_listArr = large_coverDic[@"url_list"];

    cell.selectionStyle = UITableViewCellSelectionStyleNone;
    cell.context.text = dic[@"text"];
    
        //赞  踩  评论
    NSString *zan;
    NSString *zan_select;

    if ([dic[@"digg_count"] integerValue] >= 10000) {
        zan = [NSString stringWithFormat:@"%.1f万",[dic[@"digg_count"] integerValue]/10000 *1.0];
        zan_select = [NSString stringWithFormat:@"%.1f万",([dic[@"digg_count"]  integerValue] + 1)/10000 *1.0];
    }else{
        zan = [NSString stringWithFormat:@"%ld",[dic[@"digg_count"] integerValue]];
        zan_select = [NSString stringWithFormat:@"%ld",[dic[@"digg_count"]  integerValue] + 1];
    }

    
    NSString *cai = [NSString stringWithFormat:@"%ld",[dic[@"bury_count"] integerValue]];
    NSString *cai_select = [NSString stringWithFormat:@"%ld",[dic[@"bury_count"] integerValue] + 1];

    NSString *comment = [NSString stringWithFormat:@"%ld",[dic[@"comment_count"] integerValue]];



    _QindexPath = [NSIndexPath new];
    _QindexPath = indexPath;
    
    [cell.zanBtn setTitle:zan forState:UIControlStateNormal];
    cell.caiBtn.tag = 1100000+indexPath.row;
    cell.commentBtn.tag = 1200000+indexPath.row;
    cell.zanBtn.tag = 1000000+indexPath.row;
    [cell.zanBtn setImage:[UIImage imageNamed:@"鼓掌2"] forState:UIControlStateHighlighted];
    [cell.caiBtn setTitle:cai forState:UIControlStateNormal];
    [cell.commentBtn setTitle:comment forState:UIControlStateNormal];
    
    [cell.zanBtn addTarget:self action:@selector(ZanbuttonHandle:) forControlEvents:UIControlEventTouchUpInside];
    [cell.caiBtn addTarget:self action:@selector(caibuttonHandle:) forControlEvents:UIControlEventTouchUpInside];
    [cell.commentBtn addTarget:self action:@selector(commentbuttonHandle:) forControlEvents:UIControlEventTouchUpInside];
    
    [cell.zanBtn setTitle:zan_select forState:UIControlStateSelected];
    [cell.zanBtn setImage:[UIImage imageNamed:@"鼓掌2"] forState:UIControlStateSelected];
    [cell.caiBtn setTitle:cai_select forState:UIControlStateSelected];
    [cell.caiBtn setImage:[UIImage imageNamed:@"便便2"] forState:UIControlStateSelected];
    

    
    __block UIProgressView *pv = [[UIProgressView alloc]init];
    pv.backgroundColor = [UIColor grayColor];
    pv.progressTintColor = [UIColor greenColor];
    pv.trackTintColor = [UIColor redColor];
    __weak UIImageView *weakImageView = cell.img;
    
    [weakImageView sd_setImageWithURL:[NSURL URLWithString:url_listArr[0][@"url"]]
                placeholderImage:[UIImage imageNamed:@"占位图"]
                         options:SDWebImageCacheMemoryOnly
                        progress:^(NSInteger receivedSize, NSInteger expectedSize) {
                            if (pv) {
                                float showProgress = (float)receivedSize/(float)expectedSize;
                                [pv setProgress:showProgress];
                                [weakImageView addSubview:pv ];
                                pv.frame = CGRectMake(0, 0, 100, 20);
                          
                            } 
                        } 
                       completed:^(UIImage *image, NSError *error, SDImageCacheType cacheType, NSURL *imageURL) { 
                           [pv removeFromSuperview]; 
                           pv = nil; 
                       }];
    
    
    
    
    cell.selectionStyle = UITableViewCellSelectionStyleNone;

    for (UIView *view in cell.subviews) {
        if ([view isKindOfClass:[WMPlayer class]]) {
            [(WMPlayer*)view resetWMPlayer];
            [view removeFromSuperview];
        }
    }


    return cell;
}
//点赞
-(void)ZanbuttonHandle :(UIButton *)sender
{

    NSDictionary *dic = self.dataArray[_QindexPath.row][@"group"];
    
    //groupID
  //  NSString *group = [NSString stringWithFormat:@"%ld",[dic[@"id"] integerValue]];
  //  [self zanRequestDataWithGroupID:group];
    sender.selected = !sender.selected;

}

//踩

-(void)caibuttonHandle:(UIButton *)sender
{
    sender.selected = !sender.selected;

}
//评论
-(void)commentbuttonHandle :(UIButton *)sender
{
    NSInteger index =  sender.tag - 1200000;
    VedioDetailController *detailVC = [VedioDetailController new];
    detailVC.index = index;

   
    VedioPlayCell *cell = [_tableV cellForRowAtIndexPath:_QindexPath];

    NSDictionary *dic = self.dataArray[index][@"group"];

    //groupID
    NSString *group = [NSString stringWithFormat:@"%ld",[dic[@"id"] integerValue]];
    detailVC.groupID = group;
    //视频的高
    detailVC.vedioHight = [self.hightArray[index] intValue];
    //视频的内容
    detailVC.content = dic[@"text"];
    //图片url
    NSDictionary *large_coverDic = dic[@"large_cover"];
    NSArray *url_listArr = large_coverDic[@"url_list"];
    detailVC.imgUrl = url_listArr[0][@"url"];
    //视频Url
    NSDictionary *Vedio720Dic = dic[@"720p_video"];
    NSArray *vedioList = Vedio720Dic[@"url_list"]; 
    detailVC.vedioUrl = vedioList[0][@"url"];
    //内容的rect
    detailVC.contentRect = cell.context.frame;
    //图片的尺寸
    detailVC.hightDic = self.hightArray2[index];
    
    [self.navigationController pushViewController:detailVC animated:YES];
}

-(void)playOrPause:(UIButton*)sender
{
   // sender.tag  - 100
}

-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{

    [self setIndexPath:indexPath];

}

-(void)setIndexPath:(NSIndexPath *)indexPath{

    //第一次进入
    if (self.isFirstEnter) {
        VedioPlayCell *cell = [_tableV cellForRowAtIndexPath:indexPath];
        CGRect frame = cell.img.frame;
        self.wmPlayer = [[WMPlayer alloc]initWithFrame:CGRectMake(frame.origin.x, frame.origin.y, frame.size.width, frame.size.height)];
        [cell addSubview:self.wmPlayer];
        self.wmPlayer.delegate = self;
        NSDictionary *dic = self.dataArray[indexPath.row][@"group"];
        NSDictionary *Vedio720Dic = dic[@"720p_video"];
        NSArray *vedioList = Vedio720Dic[@"url_list"];
        self.wmPlayer.URLString =vedioList[0][@"url"];
        [self.wmPlayer.player play];
        _indexPath = indexPath;
        self.isFirstEnter = NO;
    }else{
        //点击的不是上一个点击
        if (_indexPath.row!= indexPath.row) {
            [self releaseWMPlayer];
            VedioPlayCell *cell = [_tableV cellForRowAtIndexPath:indexPath];
            CGRect frame = cell.img.frame;
            self.wmPlayer = [[WMPlayer alloc]initWithFrame:CGRectMake(frame.origin.x, frame.origin.y, frame.size.width, frame.size.height)];
            [cell addSubview:self.wmPlayer];
            self.wmPlayer.delegate = self;
            NSDictionary *dic = self.dataArray[indexPath.row][@"group"];
            NSDictionary *Vedio720Dic = dic[@"720p_video"];
            NSArray *vedioList = Vedio720Dic[@"url_list"];
            self.wmPlayer.URLString =vedioList[0][@"url"];
            [self.wmPlayer.player play];
            _indexPath = indexPath;
        }else
        {
            //是上一个点击,已经播放结束
            if (self.isFinish) {
            VedioPlayCell *cell = [_tableV cellForRowAtIndexPath:indexPath];
            CGRect frame = cell.img.frame;
            self.wmPlayer = [[WMPlayer alloc]initWithFrame:CGRectMake(frame.origin.x, frame.origin.y, frame.size.width, frame.size.height)];
            [cell addSubview:self.wmPlayer];
            self.wmPlayer.delegate = self;
            NSDictionary *dic = self.dataArray[indexPath.row][@"group"];
            NSDictionary *Vedio720Dic = dic[@"720p_video"];
            NSArray *vedioList = Vedio720Dic[@"url_list"];
            self.wmPlayer.URLString =vedioList[0][@"url"];
            [self.wmPlayer.player play];
            _indexPath = indexPath;
            }
        }
    }
   
}

-(void)scrollViewDidScroll:(UIScrollView *)scrollView
{
    
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
