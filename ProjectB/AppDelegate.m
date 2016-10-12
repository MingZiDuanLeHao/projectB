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



@interface AppDelegate ()
@property (nonatomic,strong) MMDrawerController * drawerController;


@end

@implementation AppDelegate

- (BOOL)application:(UIApplication *)application willFinishLaunchingWithOptions:(NSDictionary *)launchOptions
{
    
    
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
