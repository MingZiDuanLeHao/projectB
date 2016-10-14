//
//  PictureViewController.m
//  ProjectB
//
//  Created by 瓶子 on 2016/9/30.
//  Copyright © 2016年 lanou. All rights reserved.
//

#import "PictureViewController.h"
#import "POContentView.h"
#import "AppDelegate.h"
#import "POPopupOverlayer.h"
#import "PictureDataModels.h"
#import "UIImageView+WebCache.h"


@interface PictureViewController ()

@property (nonatomic, strong) POContentView *contentView;
@property (nonatomic, strong) PictureModelPictureModel *PictureModel;

@end

@implementation PictureViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
//    [self.navigationController.navigationBar setBackgroundImage:[UIImage new] forBarMetrics:0];
    self.navigationController.navigationBar.shadowImage=[UIImage new];
    self.view.backgroundColor = [UIColor colorWithRed:216.0/255 green:76.0/255 blue:68.0/255 alpha:1.0];
    
//    self.view.backgroundColor = [UIColor whiteColor];
    self.title = @"图片";
    
    _contentView.alpha = 0.5;
    UIImageView *imaheV = [[UIImageView alloc]initWithFrame:[UIScreen mainScreen].bounds];
    imaheV.image = [UIImage imageNamed:@"蓝天.jpg"];
    [self.view addSubview:self.contentView];
   // [imaheV addSubview:self.contentView];
    
}
-(void)viewWillAppear:(BOOL)animated{
    ((AppDelegate *)([UIApplication sharedApplication].delegate)).mainTabble.tabBar.hidden = YES;
    
    [self.navigationController.navigationBar setBackgroundImage:nil forBarMetrics:0];
    self.navigationController.navigationBar.shadowImage=nil;
    
}
//-(void)loadView{
//    [super loadView];
// 
//}

- (POContentView *)contentView{
    if (!_contentView) {
        _contentView = [[POContentView alloc] initWithFrame:[UIScreen mainScreen].bounds];
        _contentView.backgroundColor = [UIColor clearColor];
    }
    return _contentView;
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
