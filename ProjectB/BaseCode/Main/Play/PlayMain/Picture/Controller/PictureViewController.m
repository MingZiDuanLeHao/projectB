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

@interface PictureViewController ()
@property (nonatomic, strong) POContentView *contentView;

@end

@implementation PictureViewController

- (void)viewDidLoad {
    [super viewDidLoad];
   // self.view.backgroundColor = [UIColor redColor];
   
}
-(void)viewWillAppear:(BOOL)animated
{
    ((AppDelegate *)([UIApplication sharedApplication].delegate)).mainTabble.tabBar.hidden = YES;
}
-(void)loadView
{
    [super loadView];
    [self.view addSubview:self.contentView];
}

- (POContentView *)contentView{
    if (!_contentView) {
        _contentView = [[POContentView alloc] initWithFrame:self.view.bounds];
        _contentView.backgroundColor = [UIColor lightGrayColor];
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
