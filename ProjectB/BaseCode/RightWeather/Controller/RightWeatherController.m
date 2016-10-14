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
#import "GetxingqiDay.h"
#import <CoreLocation/CoreLocation.h>
#import <MapKit/MapKit.h>
#import "NSString+Utils.h"



@interface RightWeatherController ()<CLLocationManagerDelegate>
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
@property(nonatomic,strong)CLLocation *location;
//定位管理器
@property(nonatomic,strong)CLLocationManager *manager;
//编码与反编码
@property(nonatomic,strong)CLGeocoder *geo;
@property(nonatomic,strong)NSString *placeName;

@end

@implementation RightWeatherController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    
    //1.定位
    [self locate];
    //2.请求数据显示UI
    [self initUI];
    [self requestData];
    
    
    
    
    
}

#pragma mark 定位
-(void)locate
{
    if (![CLLocationManager locationServicesEnabled]) {
        NSLog(@"定位服务当前可能尚未打开，请设置打开！");
        return;
    }
    //如果没有授权则请求用户授权
    if ([CLLocationManager authorizationStatus] != kCLAuthorizationStatusAuthorizedWhenInUse) {
        
        [self.manager requestWhenInUseAuthorization];
        
    }
    //开启定位
    [self.manager startUpdatingLocation];

}

-(CLGeocoder *)geo
{
    if (!_geo) {
        _geo = [[CLGeocoder alloc]init];
    }
    return _geo;
}

-(CLLocationManager *)manager
{
    if (!_manager) {
        _manager = [[CLLocationManager alloc]init];
        //更新最小距离
        _manager.distanceFilter = 100;
        //精度
        _manager.desiredAccuracy = kCLLocationAccuracyBest;
        //设置代理
        _manager.delegate = self;
    }
    return _manager;
}

//定位失败
-(void)locationManager:(CLLocationManager *)manager didFailWithError:(NSError *)error
{
    NSLog(@"失败");
}

-(void)locationManager:(CLLocationManager *)manager didUpdateLocations:(NSArray<CLLocation *> *)locations
{
    //取出最后一次位置
    //CLLocation里包含位置信息
    _location = locations.lastObject;
    [self regeocoordinate:CLLocationCoordinate2DMake(_location.coordinate.longitude, _location.coordinate.latitude)];
//    [self regeocoordinate:CLLocationCoordinate2DMake(23.177464, 113.340540)];

//
    [self.manager stopUpdatingLocation];
    NSLog(@"定位成功");
    
}

//把经纬度转化为CLLlocation位置信息  反编码
-(void)regeocoordinate:(CLLocationCoordinate2D)coor
{
    CLLocation *location = [[CLLocation alloc]initWithLatitude:coor.latitude longitude:coor.longitude];
    [self.geo reverseGeocodeLocation:location completionHandler:^(NSArray<CLPlacemark *> * _Nullable placemarks, NSError * _Nullable error) {
        //如果有错误
        if (error) {
            NSLog(@"line = %d,error = %@",__LINE__,error);
            //退出
            return ;
        }
        //没有错误,取出一个位置坐标
        CLPlacemark *placemark = placemarks.firstObject;
        //遍历其属性addressDictionary这个字典
        _placeName =  [placemark.addressDictionary objectForKey:@"City"];
        _placeName = [_placeName pinyin];
        _placeName = [_placeName substringToIndex:_placeName.length-3];
        
       
        
    }];
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
    UIImageView * imageview = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"蓝天.jpg"]];
    imageview.frame = [UIScreen mainScreen].bounds;
    [self.view insertSubview:imageview atIndex:0];
    
    UIBlurEffect *blur = [UIBlurEffect effectWithStyle:UIBlurEffectStyleLight];
    
    UIVisualEffectView *effectview = [[UIVisualEffectView alloc] initWithEffect:blur];
    
    effectview.frame = [UIScreen mainScreen].bounds;
    
    [self.view insertSubview:effectview atIndex:1];
    
    //collectionView
    UICollectionViewFlowLayout *flowLayout = [[UICollectionViewFlowLayout alloc]init];
    //设置每个Item的大小
    flowLayout.itemSize = CGSizeMake(60, 89);
    
    //设置每个Item的间距(默认是10)
    flowLayout.minimumInteritemSpacing = 200;
    
    //设置每个Item的行间距(默认是10)
    flowLayout.minimumLineSpacing = (SWidth*3/4 - 60*3 - 50)/2 ;
    
    //设置collection的Item距离屏幕上左下右间距
    flowLayout.sectionInset = UIEdgeInsetsMake(10, 25, 10, 25);
    
    //滑动方向
    flowLayout.scrollDirection = UICollectionViewScrollDirectionHorizontal ;
  
    _sevenDayCollView.collectionViewLayout = flowLayout;
    [_sevenDayCollView registerNib:[UINib nibWithNibName:@"WeherCollectionViewCell" bundle:nil] forCellWithReuseIdentifier:@"WeherCollectionViewCell"];
    _sevenDayCollView.backgroundColor = [UIColor clearColor];
    
    
    _sevenDayCollView.showsHorizontalScrollIndicator = NO;
    
    
}

-(void)initAsynUI
{
    WeatherHeWeatherDataService30 *service = _base.heWeatherDataService30[0];
    self.dailyArr = service.dailyForecast;
    
    _temLabel.text = [NSString stringWithFormat:@"%@°",service.now.tmp];
    _locLabel.text = service.basic.city;
    
    //星期
    NSString *time = [service.basic.update.loc substringToIndex:9];
    NSString *day =  [[GetxingqiDay defaultDay] featureWeekdayWithDate:time];
    _timeLabel.text = day;
    
     _stateLabel.text = service.now.cond.txt;
    WeatherDailyForecast *daily = service.dailyForecast[0];
    _HighLowTemLabel.text = [NSString stringWithFormat:@"%@°/%@°",daily.tmp.max,daily.tmp.min];
    _PMLabel.text = [NSString stringWithFormat:@"PM2.5 %@ %@",service.aqi.city.pm25,service.aqi.city.qlty];
    _windLabel.text = service.now.wind.dir;
    //    _sevenDayCollView
    _wearingLabel.text = [NSString stringWithFormat:@"穿衣指数: %@",service.suggestion.drsg.brf];
    _wearingDetailLabel.text = service.suggestion.drsg.txt;
    _coughLabel.text = [NSString stringWithFormat:@"感冒指数: %@",service.suggestion.flu.brf];
    _coughDetailLabel.text = service.suggestion.flu.txt;
    
//    _coverImg
    if ([service.now.cond.txt isEqualToString: @"多云"] )
    {
        _coverImg.image = [UIImage imageNamed:@"多云"];
        return;
    }
    if ([service.now.cond.txt isEqualToString: @"霾"] || [service.now.cond.txt isEqualToString: @"阴"]) {
        _coverImg.image = [UIImage imageNamed:@"阴"];
        return;
    }
    if ([service.now.cond.txt isEqualToString: @"大雨"] ||[service.now.cond.txt isEqualToString: @"中雨"] ||[service.now.cond.txt isEqualToString: @"小雨"]  )
    {
        _coverImg.image = [UIImage imageNamed:@"雨"];
        return;
    }
    if ([service.now.cond.txt isEqualToString: @"晴"]) {
        _coverImg.image = [UIImage imageNamed:@"晴"];
        return;
    }
    

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
    cell.backgroundColor = [UIColor clearColor];
    
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
