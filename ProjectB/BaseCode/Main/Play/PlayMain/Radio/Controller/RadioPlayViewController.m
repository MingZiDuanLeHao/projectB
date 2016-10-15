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
#import "RadioMainRightTableCell.h"

#define K_MAIN_VIEW_SCROLL_HEIGHT 64.0f
#define K_MAIN_VIEW_SCROLL_TEXT_TAG 300
#define K_MAIN_VIEW_TEME_INTERVAL 0.35         //计时器间隔时间(单位秒)
#define K_MAIN_VIEW_SCROLLER_SPACE 20          //每次移动的距离
#define K_MAIN_VIEW_SCROLLER_LABLE_WIDTH  320  //字体宽度
#define K_MAIN_VIEW_SCROLLER_LABLE_MARGIN 50   //前后间隔距离

@interface RadioPlayViewController ()<UITableViewDelegate,UITableViewDataSource,MusicEnd,UIScrollViewDelegate>
{
    NSTimer *timer;
    NSTimer           *textTimer;
    UIScrollView      *scrollViewText;
}
@property (weak, nonatomic) IBOutlet UITableView *PlaytableView;
@property(nonatomic,strong)RadioPlayHeaderView *headerView;
@property(nonatomic,strong)RadioDetailListList *list;
@property (nonatomic ,strong) NSArray *arrData;
@property(nonatomic,strong)UILabel *labText;
@property(nonatomic,assign)CGFloat width;

@end

@implementation RadioPlayViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    
//    self.edgesForExtendedLayout = UIRectEdgeNone;
    [self loadData];
    [self initUI];
    [self doAction];
    [self changeLook];
    [self autoMove];
    [self initView];
    
    
}

-(void)viewDidDisappear:(BOOL)animated
{
    //干掉定时器
    [timer invalidate];
    [textTimer invalidate];
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
    _headerView.frame = CGRectMake(0, 64, SWidth, SWidth+143);
    _headerView.backgroundColor = [UIColor clearColor];
    [_headerView.progressSlider setThumbImage:[UIImage imageNamed:@"icon-slider"] forState:UIControlStateHighlighted];
    [_headerView.progressSlider setThumbImage:[UIImage imageNamed:@"icon-slider"] forState:UIControlStateNormal];
    _headerView.headimg.clipsToBounds = YES;
    _headerView.headimg.layer.cornerRadius = 15;
    
    UIView *headerView = [[UIView alloc]init];
    headerView = _headerView;
    
    _PlaytableView.tableHeaderView = headerView;
    [_PlaytableView registerClass:[UITableViewCell class] forCellReuseIdentifier:@"wes"];
    
    //多余cell分割线
//    UIView *v = [[UIView alloc] initWithFrame:CGRectZero];
//    [_PlaytableView setTableFooterView:v];
    
    [_PlaytableView registerNib:[UINib nibWithNibName:@"RadioMainRightTableCell" bundle:nil] forCellReuseIdentifier:@"RadioMainRightTableCell"];
    
    _PlaytableView.showsVerticalScrollIndicator = NO;
    [RadioPlayerManager defaultManager].delegate = self;
    _PlaytableView.backgroundColor = [UIColor clearColor];
    
    
    //    导航栏变为透明
    [self.navigationController.navigationBar setBackgroundImage:[UIImage new] forBarMetrics:0];
    //    让黑线消失的方法
//    self.navigationController.navigationBar.shadowImage=[UIImage new];
    
    //    毛玻璃
    UIImageView * imageview = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"粉1.jpg"]];
    imageview.userInteractionEnabled = YES;
//    imageview.contentMode = UIViewContentModeScaleAspectFit;
    imageview.frame = [UIScreen mainScreen].bounds;
    [self.view insertSubview:imageview belowSubview:_PlaytableView];
    
//    UIBlurEffect *blur = [UIBlurEffect effectWithStyle:UIBlurEffectStyleLight];
//    
//    UIVisualEffectView *effectview = [[UIVisualEffectView alloc] initWithEffect:blur];
//    
//    effectview.frame = [UIScreen mainScreen].bounds;
//    
//    [self.view insertSubview:effectview aboveSubview:imageview];
    
    
  
    
    
}

-(void)PressDown
{
    [self dismissViewControllerAnimated:YES completion:nil];
}

#pragma mark Data & UI

-(void)loadData
{
    
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

#pragma mark 文字滚动
//初始化数据
-(void) initView{
    
    
    self.arrData = @[_list.title,_list.title,_list.title];
    NSLog(@"_____%@",_list.title);

    
    //文字滚动
    [self initScrollText];
    
    //开启滚动
    [self startScroll];
}


//文字滚动初始化
-(void) initScrollText{
    
    //获取滚动条
    scrollViewText = (UIScrollView *)[self.view viewWithTag:K_MAIN_VIEW_SCROLL_TEXT_TAG];
    if(!scrollViewText){
        scrollViewText = [[UIScrollView alloc] initWithFrame:CGRectMake(50, 15, SWidth-100, K_MAIN_VIEW_SCROLL_HEIGHT)];
        scrollViewText.showsHorizontalScrollIndicator = NO;   //隐藏水平滚动条
        scrollViewText.showsVerticalScrollIndicator = NO;     //隐藏垂直滚动条
        scrollViewText.tag = K_MAIN_VIEW_SCROLL_TEXT_TAG;
        [scrollViewText setBackgroundColor:[UIColor clearColor]];
        scrollViewText.delegate = self;
        
        
        
        //添加到当前视图
        [self.view addSubview:scrollViewText];
    }
    else
    {
        //清除子控件
        for (UIView *view in [scrollViewText subviews]) {
            [view removeFromSuperview];
        }
    }
    
    
    if (self.arrData) {
        
        CGFloat offsetX = 0 ,i = 0, h = 30;
        
        //设置滚动文字
        UILabel *labText = [[UILabel alloc]initWithFrame:CGRectMake(0, 0, 320, 30)];
        [labText setFont:[UIFont systemFontOfSize:18]];
        [labText setTextColor:[UIColor redColor]];
        labText.text = self.arrData[0];
        [labText sizeToFit];
        _width = labText.frame.size.width;
        
        UILabel *textLab = nil;
        for (NSString *str in self.arrData) {
            textLab = [[UILabel alloc]initWithFrame:CGRectMake( i * (_width + K_MAIN_VIEW_SCROLLER_LABLE_MARGIN),(K_MAIN_VIEW_SCROLL_HEIGHT - h) / 2, _width,h)];

        offsetX = textLab.frame.origin.x;
            textLab.text = str;

            
        //添加到滚动视图
        [scrollViewText addSubview:textLab];
            
            i++;
        }
        
        //设置滚动区域大小
        [scrollViewText setContentSize:CGSizeMake(offsetX, 0)];
    }
}


//开始滚动
-(void) startScroll{
    
    if (!textTimer)
        textTimer = [NSTimer scheduledTimerWithTimeInterval:K_MAIN_VIEW_TEME_INTERVAL target:self selector:@selector(setScrollText) userInfo:nil repeats:YES];
    
    [textTimer fire];
}


//滚动处理
-(void) setScrollText{
    
    CGFloat startX = scrollViewText.contentSize.width ;
    
    [UIView animateWithDuration:K_MAIN_VIEW_TEME_INTERVAL * 6 animations:^{
        CGRect rect;
        CGFloat offsetX = 0.0;
        
        for (UILabel *lab in scrollViewText.subviews) {
            
            rect = lab.frame;
            offsetX = rect.origin.x - K_MAIN_VIEW_SCROLLER_SPACE;
            if (offsetX < -_width - K_MAIN_VIEW_SCROLLER_LABLE_MARGIN )
            {
                offsetX = startX;
            }
            lab.frame = CGRectMake(offsetX, rect.origin.y, rect.size.width, rect.size.height);
        }
        
        
//        NSLog(@offsetX:%f,offsetX);
    }];
    
}

//-(void) setScrollText{
//    [UIView animateWithDuration:K_MAIN_VIEW_TEME_INTERVAL * 6 animations:^{
//        CGPoint point = scrollViewText.contentOffset;
//        point.x += K_MAIN_VIEW_SCROLLER_SPACE;
//        scrollViewText.contentOffset = point;
//    }];
//
//}

//-(void)scrollViewDidScroll:(UIScrollView *)scrollView
//{
//    if (scrollView == scrollViewText) {
//        if (scrollViewText.contentOffset.x >= 2*(_width + K_MAIN_VIEW_SCROLLER_LABLE_MARGIN)- (SWidth-100))
//        {
//            [scrollViewText setContentOffset:CGPointMake(0, 0)];
//        }
//    }
//}

//下拉退出controller
-(void)scrollViewWillEndDragging:(UIScrollView *)scrollView withVelocity:(CGPoint)velocity targetContentOffset:(inout CGPoint *)targetContentOffset
{
    if (scrollView.contentOffset.y <= -64) {
        [self dismissViewControllerAnimated:YES completion:nil];
    }
    
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
        //移除原来滚动的label
//        [weakScrollView.subviews makeObjectsPerformSelector:@selector(removeFromSuperview)];
        [weakself initView];
        
        
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
//        [weakScrollView.subviews makeObjectsPerformSelector:@selector(removeFromSuperview)];
        [weakself initView];
    };
    
    _headerView.dragBlock = ^(){
        [[RadioPlayerManager defaultManager] seekTotime:weakHeaderView.progressSlider.value * [[RadioPlayerManager defaultManager]totalTime]];
    };
}

-(void)musicPlayDidEnd
{
    //直接调用button点击事件
    _headerView.nextBlock();
}




#pragma mark tableView代理

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return 1;
}
-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 1;
}
-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return 85;
}
-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    
    RadioMainRightTableCell *cell = [tableView dequeueReusableCellWithIdentifier:@"RadioMainRightTableCell" forIndexPath:indexPath];
    cell.titlelabel.text = _album.title;
    cell.playCount.text = [NSString stringWithFormat:@"%.1f万",_album.playTimes/10000] ;
    cell.NumCount.text = [NSString stringWithFormat:@"%.0f",_album.tracks];
    cell.desc.text = [NSString stringWithFormat:@"by:%@",_album.nickname];;
    [cell.img sd_setImageWithURL:[NSURL URLWithString:_album.coverSmall]];
    cell.img.layer.borderWidth = 0.3;
    cell.img.layer.borderColor =[[UIColor grayColor]CGColor];
    cell.img.layer.shadowOffset = CGSizeMake(-3, 3);
    cell.img.layer.shadowColor =[[UIColor blackColor]CGColor];
    cell.img.layer.shadowOpacity = 0.5;
    
    cell.selectionStyle = UITableViewCellSelectionStyleNone;
    cell.backgroundColor = [UIColor clearColor];
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
