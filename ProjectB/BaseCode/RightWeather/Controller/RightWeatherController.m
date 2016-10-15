//
//  RightWeatherController.m
//  ProjectB
//
//  Created by 瓶子 on 2016/9/28.
//  Copyright © 2016年 lanou. All rights reserved.
//

#import "RightWeatherController.h"

#import "WeatherDataModels.h"
#import "WeherCollectionViewCell.h"
#import "GetxingqiDay.h"
#import "AppDelegate.h"
#import "weatherHeaderView.h"
#import "WeatherBaseClass.h"






@interface RightWeatherController ()
@property(nonatomic,strong)WeatherBaseClass *base;
@property(nonatomic,strong)NSArray *dailyArr;
//@property(nonatomic,strong)CLLocation *location;
@property (weak, nonatomic) IBOutlet UITableView *Table;
@property(nonatomic,strong)weatherHeaderView *headerView;


@end

@implementation RightWeatherController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    
    //1.定位
    //(在appdelegate中实现)
    //2.请求数据显示UI
    [self initUI];


    _headerView = [[NSBundle mainBundle]loadNibNamed:@"weatherHeaderView" owner:nil options:nil][0];
    _headerView.frame = CGRectMake(0, 0, SWidth, 550);
    _Table.tableHeaderView = _headerView;
    [_Table registerClass:[UITableViewCell class] forCellReuseIdentifier:@"yea"];
    _headerView.backgroundColor = [UIColor clearColor];
    _Table.backgroundColor = [UIColor clearColor];
    _Table.separatorStyle = UITableViewCellSeparatorStyleNone;
    
    //1.如果此contro生成比获取定位慢
    //获取model刷新表格
    if (((AppDelegate *)[UIApplication sharedApplication].delegate).base) {
        _base = ((AppDelegate *)[UIApplication sharedApplication].delegate).base;
        [self initAsynUI];
        [_headerView.sevenDayCollView reloadData];
    };
    
    
    
    //2.如果此contro生成比获取定位快
    __weak typeof(self) weakself = self;
    __weak typeof(_headerView) weakHeader = _headerView;
    
    ((AppDelegate *)([UIApplication sharedApplication].delegate)).setUUUU = ^(WeatherBaseClass *base){
        _base = base;
        //刷新
        dispatch_async(dispatch_get_main_queue(), ^{
            [weakself initAsynUI];
            [weakHeader.sevenDayCollView reloadData];
        });
    };

    
}

#pragma mark TableView代理
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
    return  20;
}
-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"yea"];
    cell.backgroundColor = [UIColor clearColor];
    cell.selectionStyle = UITableViewCellSelectionStyleNone;
    return cell;
}








#pragma mark UI
-(void)initUI
{
    //背景图片
    UIImageView * imageview = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"蓝天.jpg"]];
    imageview.frame = [UIScreen mainScreen].bounds;
    [self.view insertSubview:imageview atIndex:0];
    
    UIBlurEffect *blur = [UIBlurEffect effectWithStyle:UIBlurEffectStyleLight];
    
    UIVisualEffectView *effectview = [[UIVisualEffectView alloc] initWithEffect:blur];
    
    effectview.frame = [UIScreen mainScreen].bounds;
    
    [self.view insertSubview:effectview atIndex:1];
    
}

-(void)initAsynUI
{
    WeatherHeWeatherDataService30 *service = _base.heWeatherDataService30[0];
    _headerView.dailyArr = service.dailyForecast;
    
    _headerView.temLabel.text = [NSString stringWithFormat:@"%@°",service.now.tmp];
    _headerView.locLabel.text = service.basic.city;
    
    //星期
    NSString *time = [service.basic.update.loc substringToIndex:9];
    NSString *day =  [[GetxingqiDay defaultDay] featureWeekdayWithDate:time];
    _headerView.timeLabel.text = day;
    
    _headerView.stateLabel.text = service.now.cond.txt;
    WeatherDailyForecast *daily = service.dailyForecast[0];
    _headerView.HighLowTemLabel.text = [NSString stringWithFormat:@"%@°/%@°",daily.tmp.max,daily.tmp.min];
    _headerView.PMLabel.text = [NSString stringWithFormat:@"PM2.5 %@ %@",service.aqi.city.pm25,service.aqi.city.qlty];
    _headerView.windLabel.text = service.now.wind.dir;
    //    _sevenDayCollView
    _headerView.wearingLabel.text = [NSString stringWithFormat:@"穿衣指数: %@",service.suggestion.drsg.brf];
    _headerView.wearingDetailLabel.text = service.suggestion.drsg.txt;
    _headerView.coughLabel.text = [NSString stringWithFormat:@"感冒指数: %@",service.suggestion.flu.brf];
    _headerView.coughDetailLabel.text = service.suggestion.flu.txt;
    
//    _coverImg
    if ([service.now.cond.txt isEqualToString: @"多云"] )
    {
        _headerView.coverImg.image = [UIImage imageNamed:@"多云"];
        return;
    }
    if ([service.now.cond.txt isEqualToString: @"霾"] || [service.now.cond.txt isEqualToString: @"阴"]) {
        _headerView.coverImg.image = [UIImage imageNamed:@"阴"];
        return;
    }
    if ([service.now.cond.txt isEqualToString: @"大雨"] ||[service.now.cond.txt isEqualToString: @"中雨"] ||[service.now.cond.txt isEqualToString: @"小雨"] || [service.now.cond.txt isEqualToString: @"阵雨"] )
    {
        _headerView.coverImg.image = [UIImage imageNamed:@"雨"];
        return;
    }
    if ([service.now.cond.txt isEqualToString: @"晴"]) {
        _headerView.coverImg.image = [UIImage imageNamed:@"晴"];
        return;
    }
    

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
