//
//  AppDelegate.m
//  ProjectB
//
//  Created by lanou on 2016/9/28.
//  Copyright © 2016年 lanou. All rights reserved.
//

#import "AppDelegate.h"
#import "NewsMainController.h"
#import "RightWeatherController.h"
#import "NewsMainController.h"

#import "RadioMainController.h"
#import "VedioMainController.h"
#import "MMNavigationController.h"
#import "UIViewController+MMDrawerController.h"
#import <CoreLocation/CoreLocation.h>
#import <MapKit/MapKit.h>
#import "NSString+Utils.h"
#import "RightWeatherController.h"
#import "ApiStoreSDK.h"


@interface AppDelegate ()<CLLocationManagerDelegate>
@property (nonatomic,strong) MMDrawerController * drawerController;
//定位管理器
@property(nonatomic,strong)CLLocationManager *manager;
@property(nonatomic,strong)NSString *placeName;




@end

@implementation AppDelegate

- (BOOL)application:(UIApplication *)application willFinishLaunchingWithOptions:(NSDictionary *)launchOptions
{
    [self locationRequest];
    
#pragma mark 抽屉
//    NewsMainController *CenterVC = [NewsMainController new];
    
    
    LeftSettingController *leftVC = [LeftSettingController new];
    RightWeatherController *RightVC = [RightWeatherController new];
    
    
    
    //创建一个TabBarController,作为window的根视图控制器
    UITabBarController *mainTab = [[UITabBarController alloc]init];
    //数组有几个元素 代表有几个小模块
    //新闻模块
    NewsMainController *vc = [NewsMainController new];
    UINavigationController *newNav = [[UINavigationController alloc]initWithRootViewController:vc];
    
    newNav.tabBarItem = [[UITabBarItem alloc]initWithTitle:@"新闻" image:[[UIImage imageNamed:@"新闻"]imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal]  selectedImage:[[UIImage imageNamed:@"新闻2"]imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal]];
    
    //            //视频模块
    //            VedioMainController *vedio = [VedioMainController new];
    //            UINavigationController *vedionav = [[UINavigationController alloc]initWithRootViewController:vedio];
    //            vedionav.tabBarItem = [[UITabBarItem alloc]initWithTitle:@"新闻" image:[[UIImage imageNamed:@"新闻"]imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal] selectedImage:[[UIImage imageNamed:@"新闻"]imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal]];
    
    
    //停留模块
//    ShowViewController *pause = [ShowViewController new];
    VedioMainController *pause = [VedioMainController new];
    UINavigationController *pausenav = [[UINavigationController alloc]initWithRootViewController:pause];
    pausenav.tabBarItem = [[UITabBarItem alloc]initWithTitle:@"视听" image:[[UIImage imageNamed:@"视频"]imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal] selectedImage:[[UIImage imageNamed:@"视频2"]imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal]];
    
    
    
    
    
    //tabbar
    mainTab.viewControllers = @[newNav,pausenav];
    mainTab.tabBar.tintColor = [UIColor orangeColor];
    
    [self.drawerController setCenterViewController:mainTab withCloseAnimation:YES completion:nil];
    
    _mainTabble = mainTab;
    
    UIView *backView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, SWidth, 49)];
    backView.backgroundColor = [UIColor whiteColor];
    [mainTab.tabBar insertSubview:backView atIndex:0];
    mainTab.tabBar.opaque = YES;
    
//    [mainTab setRestorationIdentifier:@"center"];
    
    
    self.drawerController = [[MMDrawerController alloc] initWithCenterViewController:mainTab leftDrawerViewController:leftVC rightDrawerViewController:RightVC];
    
    [self.drawerController setOpenDrawerGestureModeMask:MMOpenDrawerGestureModeAll];
    [self.drawerController setCloseDrawerGestureModeMask:MMCloseDrawerGestureModeAll];
    
    //导航栏颜色
//    UINavigationBar *bar=[UINavigationBar appearance];
//    [bar setBackgroundImage:[UIImage imageNamed:@"rednavi.jpg"] forBarMetrics:UIBarMetricsDefault];
    //    [bar setBackgroundColor:[UIColor colorWithPatternImage:[UIImage imageNamed:@"rednavi.jpg"]]];
    
    self.window = [[UIWindow alloc] initWithFrame:[[UIScreen mainScreen] bounds]];
    
    [self.window setRootViewController:self.drawerController];
    
    return YES;
}

//- (UIViewController *)application:(UIApplication *)application viewControllerWithRestorationIdentifierPath:(NSArray *)identifierComponents coder:(NSCoder *)coder
//{
//    NSString * key = [identifierComponents lastObject];
//    if([key isEqualToString:@"MMDrawer"]){
//        return self.window.rootViewController;
//    }
//    else if ([key isEqualToString:@"center"]) {
//        return ((MMDrawerController *)self.window.rootViewController).centerViewController;
//    }
//    return nil;
//    
//}


- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    // Override point for customization after application launch.
    [self.window makeKeyAndVisible];
    
    
    return YES;
}

#pragma mark 定位
/** 版本控制 */
- (CLLocationManager *)locationM
{
    if (!_manager) {
        // 创建位置管理器
        _manager = [[CLLocationManager alloc] init];
        // 设置代理
        _manager.delegate = self;
        
        // 判断系统版本,请求前台授权
        if ([[UIDevice currentDevice].systemVersion floatValue] >= 8.0) {
            // 在iOS9.0+（如果当前授权状态是使用时授权，那么App退到后台后，将不能获取用户位置，即使勾选后台模式：location）
            [_manager requestWhenInUseAuthorization];
        }
        // 要想继续获取位置，需要使用以下属性进行设置（注意勾选后台模式：location）但会出现蓝条
        if ([[UIDevice currentDevice].systemVersion floatValue] >= 9.0) {
            _manager.allowsBackgroundLocationUpdates = YES;
        }
        
    }
    return _manager;
}


/** 位置请求 */
-(void)locationRequest
{
    // 2.使用位置管理器进行定位
    if([CLLocationManager locationServicesEnabled])
    {
        //        [self.locationM startUpdatingLocation];
        // 作用：按照定位精确度从低到高进行排序，逐个进行定位。如果获取到的位置不是精确度最高的那个，也会在定位超时后，通过代理告诉外界
        // 注意：一个要实现代理的定位失败方法； 二：不能与startUpdatingLocation同时使用
        [self.locationM requestLocation];
    }else
    {
        NSLog(@"不能定位呀");
    }
}


#pragma mark -CLLocationManagerDelegate

/**
 *  当用户授权状态发生变化时调用
 */
-(void)locationManager:(nonnull CLLocationManager *)manager didChangeAuthorizationStatus:(CLAuthorizationStatus)status
{
    switch (status) {
            // 用户还未决定
        case kCLAuthorizationStatusNotDetermined:
        {
            NSLog(@"用户还未决定");
            break;
        }
            // 问受限
        case kCLAuthorizationStatusRestricted:
        {
            NSLog(@"访问受限");
            break;
        }
            // 定位关闭时和对此APP授权为never时调用
        case kCLAuthorizationStatusDenied:
        {
            // 定位是否可用（是否支持定位或者定位是否开启）
            if([CLLocationManager locationServicesEnabled])
            {
                NSLog(@"定位开启，但被拒");
            }else
            {
                NSLog(@"定位关闭，不可用");
            }
            break;
        }
            // 获取前后台定位授权
        case kCLAuthorizationStatusAuthorizedAlways:
            //        case kCLAuthorizationStatusAuthorized: // 失效，不建议使用
        {
            NSLog(@"获取前后台定位授权");
            break;
        }
            // 获得前台定位授权
        case kCLAuthorizationStatusAuthorizedWhenInUse:
        {
            NSLog(@"获得前台定位授权");
            break;
        }
        default:
            break;
    }
    
}

/**
 * 当位置管理器，获取到位置后，就会调用这样的方法
 */
-(void)locationManager:(nonnull CLLocationManager *)manager didUpdateLocations:(nonnull NSArray<CLLocation *> *)locations
{
    //    NSLog(@"已经定位到了！--%@", locations);
    CLGeocoder *geocoder=[[CLGeocoder alloc]init];
    // 根据CLLocation对象进行反地理编码
    [geocoder reverseGeocodeLocation:[locations firstObject] completionHandler:^(NSArray<CLPlacemark *> * __nullable placemarks, NSError * __nullable error) {
        // 包含区，街道等信息的地标对象
        CLPlacemark *placemark = [placemarks firstObject];
        // 城市名称
        //        NSString *city = placemark.locality;
        // 街道名称
        //        NSString *street = placemark.thoroughfare;
        _placeName = placemark.locality;
        
        _placeName =  [placemark.addressDictionary objectForKey:@"City"];
        _placeName = [_placeName pinyin];
        _placeName = [_placeName substringToIndex:_placeName.length-3];
        
        [self requestData];
        
        
        
    }];
}

#pragma mark 请求数据
-(void)requestData
{
    
    //    NSString *city = ((AppDelegate *)([UIApplication sharedApplication].delegate)).placeName ;
    NSString *city = _placeName;
    NSString *apikey = @"c184575a002af5fb6dee57adc1cca85c";
    
    //实例化一个回调，处理请求的返回值
    APISCallBack* callBack = [APISCallBack alloc];
    
    callBack.onSuccess = ^(long status, NSString* responseString) {
        if(responseString != nil) {
            NSDictionary *dic = [self dictionaryWithJsonString:responseString];
            _base = [WeatherBaseClass modelObjectWithDictionary:dic];
            self.setUUUU(_base);
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

//字符串转字典
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

/**
 * 当定位失败后调用此方法
 */
-(void)locationManager:(nonnull CLLocationManager *)manager didFailWithError:(nonnull NSError *)error
{
    
    NSLog(@"定位失败--%@", error.localizedDescription);
}


- (void)applicationWillResignActive:(UIApplication *)application {
    // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
    // Use this method to pause ongoing tasks, disable timers, and throttle down OpenGL ES frame rates. Games should use this method to pause the game.
}

- (void)applicationDidEnterBackground:(UIApplication *)application {
    // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later.
    // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
}

- (void)applicationWillEnterForeground:(UIApplication *)application {
    // Called as part of the transition from the background to the inactive state; here you can undo many of the changes made on entering the background.
}

- (void)applicationDidBecomeActive:(UIApplication *)application {
    // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
}

- (void)applicationWillTerminate:(UIApplication *)application {
    // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
}

@end
