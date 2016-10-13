//
//  RightWeatherController.m
//  ProjectB
//
//  Created by 瓶子 on 2016/9/28.
//  Copyright © 2016年 lanou. All rights reserved.
//

#import "RightWeatherController.h"
#import "ApiStoreSDK.h"
#import "WeatherDataModels.h"
#import "WeherCollectionViewCell.h"


@interface RightWeatherController ()
@property (weak, nonatomic) IBOutlet UILabel *temLabel;
@property (weak, nonatomic) IBOutlet UILabel *locLabel;
@property (weak, nonatomic) IBOutlet UILabel *timeLabel;
@property (weak, nonatomic) IBOutlet UIImageView *coverImg;
@property (weak, nonatomic) IBOutlet UILabel *stateLabel;
@property (weak, nonatomic) IBOutlet UILabel *HighLowTemLabel;
@property (weak, nonatomic) IBOutlet UILabel *PMLabel;
@property (weak, nonatomic) IBOutlet UILabel *windLabel;
@property (weak, nonatomic) IBOutlet UICollectionView *sevenDayCollView;
@property (weak, nonatomic) IBOutlet UILabel *wearingLabel;
@property (weak, nonatomic) IBOutlet UILabel *wearingDetailLabel;
@property (weak, nonatomic) IBOutlet UILabel *coughLabel;
@property (weak, nonatomic) IBOutlet UILabel *coughDetailLabel;

@property(nonatomic,strong)WeatherBaseClass *base;
@property(nonatomic,strong)NSArray *dailyArr;

@end

@implementation RightWeatherController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    
    //1.定位
    //2.请求数据显示UI
    [self requestData];
    [self initUI];
    
}

#pragma mark 请求数据
-(void)requestData
{
    
    NSString *city = @"guangzhou" ;
    NSString *apikey = @"c184575a002af5fb6dee57adc1cca85c";
    
    //实例化一个回调，处理请求的返回值
    APISCallBack* callBack = [APISCallBack alloc];
    
    callBack.onSuccess = ^(long status, NSString* responseString) {
        if(responseString != nil) {
            NSDictionary *dic = [self dictionaryWithJsonString:responseString];
            _base = [WeatherBaseClass modelObjectWithDictionary:dic];
           
            dispatch_async(dispatch_get_main_queue(), ^{
                [self initAsynUI];
                [_sevenDayCollView reloadData];
            });
            
        }
    };
    
    callBack.onError = ^(long status, NSString* responseString) {
        NSLog(@"onError");
        
    };
   
    
    //部分参数
    NSString *uri = @"http://apis.baidu.com/heweather/weather/free";
    NSString *method = @"post";
    NSMutableDictionary *parameter = [[NSMutableDictionary alloc] init];
    [parameter setObject:city forKey:@"city"];
    
    //请求API
    [ApiStoreSDK executeWithURL:uri method:method apikey:apikey parameter:parameter callBack:callBack];

}

#pragma mark UI
-(void)initUI
{
    //背景图片
//    UIImageView * imageview = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"hailan.jpeg"]];
//    imageview.frame = [UIScreen mainScreen].bounds;
//    [self.view insertSubview:imageview atIndex:0];
    
    //collectionView
    UICollectionViewFlowLayout *flowLayout = [[UICollectionViewFlowLayout alloc]init];
    //设置每个Item的大小
    flowLayout.itemSize = CGSizeMake(60, 89);
    
    //设置每个Item的间距(默认是10)
    flowLayout.minimumInteritemSpacing = (SWidth - 350)/2;
    
    //设置每个Item的行间距(默认是10)
    flowLayout.minimumLineSpacing = 10.0;
    
    //设置collection的Item距离屏幕上左下右间距
    flowLayout.sectionInset = UIEdgeInsetsMake(10, 25, 10, 25);
    
    //滑动方向
    flowLayout.scrollDirection = UICollectionViewScrollDirectionVertical;
  
    _sevenDayCollView.collectionViewLayout = flowLayout;
    [_sevenDayCollView registerNib:[UINib nibWithNibName:@"WeherCollectionViewCell" bundle:nil] forCellWithReuseIdentifier:@"WeherCollectionViewCell"];
    _sevenDayCollView.backgroundColor = [UIColor redColor];
    
}

-(void)initAsynUI
{
    WeatherHeWeatherDataService30 *service = _base.heWeatherDataService30[0];
    self.dailyArr = service.dailyForecast;
    
    _temLabel.text = service.now.tmp;
    _locLabel.text = service.basic.city;
    _timeLabel.text = service.basic.update.loc;
//    _coverImg
    _stateLabel.text = service.now.cond.txt;
    
    WeatherDailyForecast *daily = service.dailyForecast[0];
    _HighLowTemLabel.text = [NSString stringWithFormat:@"%@/%@",daily.tmp.max,daily.tmp.min];
    _PMLabel.text = [NSString stringWithFormat:@"PM2.5 %@ %@",service.aqi.city.pm25,service.aqi.city.qlty];
    _windLabel.text = service.now.wind.dir;
//    _sevenDayCollView
    _wearingLabel.text = [NSString stringWithFormat:@"穿衣指数: %@",service.suggestion.drsg.brf];
    _wearingDetailLabel.text = service.suggestion.drsg.txt;
    _coughLabel.text = [NSString stringWithFormat:@"感冒指数: %@",service.suggestion.flu.brf];
    _coughDetailLabel.text = service.suggestion.flu.txt;
    
}

- (NSDictionary *)dictionaryWithJsonString:(NSString *)jsonString {
    if (jsonString == nil) {
        return nil;
    }
    
    NSData *jsonData = [jsonString dataUsingEncoding:NSUTF8StringEncoding];
    NSError *err;
    NSDictionary *dic = [NSJSONSerialization JSONObjectWithData:jsonData
                                                        options:NSJSONReadingMutableContainers
                                                          error:&err];
    if(err) {
        NSLog(@"json解析失败：%@",err);
        return nil;
    }
    return dic;
}

#pragma mark collectionView

//每区的cell个数
-(NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section
{
    return _dailyArr.count - 1;
}
//区数
-(NSInteger)numberOfSectionsInCollectionView:(UICollectionView *)collectionView
{
    return 1;
}

//返回cell
-(UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath
{
    WeherCollectionViewCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:@"WeherCollectionViewCell" forIndexPath:indexPath];
    cell.model = _dailyArr[indexPath.row + 1];
    
    
    return cell;
}

#pragma mark lazy Load
-(NSArray *)dailyArr
{
    if (!_dailyArr) {
        _dailyArr = [NSArray array];
    }
    return _dailyArr;
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
