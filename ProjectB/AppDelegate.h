//
//  AppDelegate.h
//  ProjectB
//
//  Created by lanou on 2016/9/28.
//  Copyright © 2016年 lanou. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "RightWeatherController.h"
#import "WeatherDataModels.h"

typedef void(^setUI)(WeatherBaseClass *);
typedef void(^pushFail)();
@interface AppDelegate : UIResponder <UIApplicationDelegate>

@property (strong, nonatomic) UIWindow *window;
@property(nonatomic,strong)UITabBarController *mainTabble;
@property(nonatomic,strong)RightWeatherController *weather;
@property(nonatomic,strong)WeatherBaseClass *base;
@property(nonatomic,copy)setUI setUUUU;
@property(nonatomic,copy)pushFail push;

@end

