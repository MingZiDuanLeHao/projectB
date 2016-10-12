//
//  RadioPlayViewController.m
//  ProjectB
//
//  Created by 瓶子 on 2016/10/9.
//  Copyright © 2016年 lanou. All rights reserved.
//

#import "RadioPlayViewController.h"
#import "RadioPlayHeaderView.h"
#import "RadioPlayerManager.h"
#import "RadioDetailListList.h"

@interface RadioPlayViewController ()<UITableViewDelegate,UITableViewDataSource>
{
    NSTimer *timer;
}
@property (weak, nonatomic) IBOutlet UITableView *PlaytableView;
@property(nonatomic,strong)RadioPlayHeaderView *headerView;
@property(nonatomic,strong)RadioDetailListList *list;

@end

@implementation RadioPlayViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    [self loadData];
    [self initUI];
    [self doAction];
    [self changeLook];
    [self autoMove];
    
    
}

-(void)viewDidDisappear:(BOOL)animated
{
    //干掉定时器
    [timer invalidate];
    //干掉通知
    [[RadioPlayerManager defaultManager] pause];
    
}

-(void)initUI
{
    //设置返回按钮
    UIButton *button = [[UIButton alloc]initWithFrame:CGRectMake(0, 0, 20, 20)];
    [button setBackgroundImage:[UIImage imageNamed:@"下"] forState:UIControlStateNormal];
    [button addTarget:self action:@selector(PressDown) forControlEvents:UIControlEventTouchUpInside];
    UIBarButtonItem *item = [[UIBarButtonItem alloc]initWithCustomView:button];
    self.navigationItem.leftBarButtonItem = item;
    
    //头部
    _headerView = [[NSBundle mainBundle]loadNibNamed:@"RadioPlayHeaderView" owner:nil options:nil][0];
    _headerView.frame = CGRectMake(0, 0, SWidth, SWidth+34);
    [_headerView.progressSlider setThumbImage:[UIImage imageNamed:@"icon-slider"] forState:UIControlStateHighlighted];
    [_headerView.progressSlider setThumbImage:[UIImage imageNamed:@"icon-slider"] forState:UIControlStateNormal];

    
    _PlaytableView.tableHeaderView = _headerView;
    [_PlaytableView registerClass:[UITableViewCell class] forCellReuseIdentifier:@"wes"];
    
    
}

-(void)PressDown
{
    [self dismissViewControllerAnimated:YES completion:nil];
}

#pragma mark Data & UI

-(void)loadData
{
    NSLog(@"__%ld",_selectIndex);
    [RadioPlayerManager defaultManager].selectedIndex = _selectIndex;
    [RadioPlayerManager defaultManager].musicDataArray = _musicArray;
    [[RadioPlayerManager defaultManager] play];
}

-(void)changeLook
{
    _selectIndex = [RadioPlayerManager defaultManager].selectedIndex;
    _list = _musicArray[_selectIndex];
    _headerView.List = _list;

}

#pragma mark 功能
-(void)autoMove
{
    timer = [NSTimer scheduledTimerWithTimeInterval:0.5f target:self selector:@selector(timeHandle) userInfo:nil repeats:YES];
}

-(void)timeHandle
{
    
    CGFloat currentSec = [[RadioPlayerManager defaultManager] currentTime];
    CGFloat totalSec = [[RadioPlayerManager defaultManager] totalTime];
    _headerView.progressSlider.value = currentSec / totalSec;

    CGFloat time = [[RadioPlayerManager defaultManager] currentTime];
    if ((int)time%60 < 10) {
        _headerView.currentTime.text = [NSString stringWithFormat:@"%d:0%d",(int)time/60,(int)time%60];
    }
    else
    {
        _headerView.currentTime.text = [NSString stringWithFormat:@"%d:%d",(int)time/60,(int)time%60];
    }
}

-(void)doAction
{
    typeof(self) __weak weakself = self;
    typeof(_headerView) __weak weakHeaderView = _headerView;
    
    _headerView.lastBlock = ^(){
        [[RadioPlayerManager defaultManager]lastMusic];
        [weakself changeLook];
    };
    
    _headerView.pauseBlock = ^(){
        if ([[RadioPlayerManager defaultManager]isplay]) {
            [[RadioPlayerManager defaultManager]pause];
            [weakHeaderView.pauseBut setBackgroundImage:[UIImage imageNamed:@"播放"] forState:UIControlStateNormal];
        }
        else
        {
            [[RadioPlayerManager defaultManager]play];
            [weakHeaderView.pauseBut setBackgroundImage:[UIImage imageNamed:@"暂停"] forState:UIControlStateNormal];
        }
    };
    
    _headerView.nextBlock = ^(){
        [[RadioPlayerManager defaultManager]nextNusic];
        [weakself changeLook];
    };
    
    _headerView.dragBlock = ^(){
        [[RadioPlayerManager defaultManager] seekTotime:weakHeaderView.progressSlider.value * [[RadioPlayerManager defaultManager]totalTime]];
    };
}




#pragma mark tableView代理

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return 10;
}
-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 1;
}
-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return 50;
}
-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"wes"];
    return cell;
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
