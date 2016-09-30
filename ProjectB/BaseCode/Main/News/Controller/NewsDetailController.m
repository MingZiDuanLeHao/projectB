//
//  NewsDetailController.m
//  ProjectB
//
//  Created by 瓶子 on 2016/9/30.
//  Copyright © 2016年 lanou. All rights reserved.
//

#import "NewsDetailController.h"
#import "detailDataModels.h"

@interface NewsDetailController ()
@property(nonatomic,strong)WKWebView *WebView;
@property(nonatomic,strong)detailBaseClass *base;
@end

@implementation NewsDetailController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    [self initUI];
    [self requestData];
    
}

-(void)initUI
{
    self.title = @"文章详情";
    _WebView = [[WKWebView alloc]initWithFrame:CGRectMake(0, 64, SWidth, SHeight-64)];
    [self.view addSubview:_WebView];
    UIBarButtonItem *comment = [[UIBarButtonItem alloc]initWithTitle:@"评论" style:UIBarButtonItemStylePlain target:self action:@selector(commentAction)];
    UIBarButtonItem *share = [[UIBarButtonItem alloc]initWithTitle:@"分享" style:UIBarButtonItemStylePlain target:self action:@selector(shareAction)];
    self.navigationItem.rightBarButtonItems = @[share,comment];
}

-(void)requestData
{
    [NetWorkRequest requestWithMethod:GET URL:@"http://c.m.163.com/nc/article/C20N3VJE000146BE/full.html" para:nil success:^(NSData *data) {
        NSDictionary *dic = [NSJSONSerialization JSONObjectWithData:data options:NSJSONReadingMutableContainers error:nil];
        _base = [detailBaseClass modelObjectWithDictionary:dic];
        dispatch_async(dispatch_get_main_queue(), ^{

            NSURL *cssURL = [[NSBundle mainBundle]URLForResource:@"style" withExtension:@"css"];
           
            [_WebView loadHTMLString:_base.c20N3VJE000146BE.shareLink baseURL:cssURL];
            
        });
    } error:^(NSError *error) {
        
    }view:self.view];
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
