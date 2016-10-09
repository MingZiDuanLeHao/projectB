//
//  ShowViewController.m
//  ProjectB
//
//  Created by 瓶子 on 2016/9/28.
//  Copyright © 2016年 lanou. All rights reserved.
//

#import "ShowViewController.h"
#import "VedioMainController.h"
#import "RadioMainController.h"
#import "AppDelegate.h"
#import "NetWorkRequest.h"

@interface ShowViewController ()

@end

@implementation ShowViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self askData];
    [self initUI];
}

-(void)initUI
{
    self.title = @"视听";
   
}

-(void)askData
{
 
}
-(void)viewDidAppear:(BOOL)animated
{
        ((AppDelegate *)([UIApplication sharedApplication].delegate)).mainTabble.tabBar.hidden = NO;
}

//进入视频列表
- (IBAction)vedioHandle:(UIButton *)sender {

    

//      [self animationWithView:self.view WithAnimationTransition:UIViewAnimationTransitionCurlDown];
    VedioMainController *vedioVC = [VedioMainController new];
    [self.navigationController pushViewController:vedioVC animated:YES];
    
}
- (IBAction)RadioHandle:(UIButton *)sender {
    RadioMainController *radioVC = [RadioMainController new];
    [self.navigationController pushViewController:radioVC animated:YES];
}
- (void) animationWithView : (UIView *)view WithAnimationTransition : (UIViewAnimationTransition) transition
{
    [UIView animateWithDuration:1 animations:^{
        [UIView setAnimationCurve:UIViewAnimationCurveEaseInOut];
        [UIView setAnimationTransition:transition forView:view cache:YES];
    }];
}
- (void) transitionWithType:(NSString *) type WithSubtype:(NSString *) subtype ForView : (UIView *) view
{
    //创建CATransition对象
    CATransition *animation = [CATransition animation];
    
    //设置运动时间
    animation.duration = 1;
    
    //设置运动type
    animation.type = type;
    if (subtype != nil) {
        
        //设置子类
        animation.subtype = subtype;
    }
    
    //设置运动速度
    animation.timingFunction = UIViewAnimationOptionCurveEaseInOut;
    
    [view.layer addAnimation:animation forKey:@"animation"];
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
