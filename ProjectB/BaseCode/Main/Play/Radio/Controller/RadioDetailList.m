//
//  RadioDetailList.m
//  ProjectB
//
//  Created by lanou on 2016/9/29.
//  Copyright © 2016年 lanou. All rights reserved.
//

#import "RadioDetailList.h"
#import "RedioDetailListCell.h"
#import "radioController.h"
#import "NetWorkRequest.h"
#import "MJRefresh.h"
#import "UIImageView+WebCache.h"

@interface RadioDetailList ()<UIScrollViewDelegate,UITableViewDataSource,UITableViewDelegate>
@property (nonatomic,strong) UITableView *listTab;
@property (nonatomic,strong) UIScrollView *ScrollView;

@end
static NSString *detailListCell = @"detailListCell";
@implementation RadioDetailList

- (void)viewDidLoad {
    [super viewDidLoad];
    [self initUI];
    [self requestData];
}

-(void)initUI
{
    //scrollview
    self.ScrollView.frame = CGRectMake(0, 250, SWidth, SHeight - 260 - 44);
    _ScrollView.contentSize = CGSizeMake(SWidth * 2, 0);
    _ScrollView.pagingEnabled = YES;
    _ScrollView.delegate = self;
    _ScrollView.tag = 100;
    [self.view addSubview:_ScrollView];
    
    //listtable
    self.listTab.frame = CGRectMake(SWidth, 0, SWidth, SHeight -260 - 44);
    [_listTab registerNib:[UINib nibWithNibName:@"RedioDetailListCell" bundle:nil] forCellReuseIdentifier:detailListCell];
    _listTab.showsVerticalScrollIndicator = NO;
    _listTab.delegate = self;
    _listTab.dataSource = self;
    _listTab.separatorColor = [UIColor blueColor];
    
    
    [_ScrollView addSubview:_listTab];
}

-(void)requestData
{
    
    [NetWorkRequest requestWithMethod:GET URL:[NSString stringWithFormat:@"http://mobile.ximalaya.com/mobile/v1/album?albumId=3524772&device=iPad&pageSize=20&source=5&statEvent=pageview%2Falbum%403524772&statModule=%E7%94%B5%E5%8F%B0_%E9%9F%B3%E4%B9%90%E5%8F%B0&statPage=categorytag%40%E7%94%B5%E5%8F%B0_%E9%9F%B3%E4%B9%90%E5%8F%B0&statPosition=1"] para:nil success:^(NSData *data) {
        if (data) {
            NSDictionary *dic = [NSJSONSerialization JSONObjectWithData:data options:0 error:nil];
            NSLog(@"dic======%@",dic);

            dispatch_async(dispatch_get_main_queue(), ^{
                [_listTab reloadData];
                
            });
        }
        
    } error:^(NSError *error) {
        NSLog(@"error===%@",error);
    } view:self.view];
}
#pragma marks- 懒加载
//scroll
-(UIScrollView *)ScrollView
{
    if (!_ScrollView) {
        _ScrollView = [[UIScrollView alloc]init];
    }
    return _ScrollView;
}

//列表
-(UITableView *)listTab
{
    if (!_listTab) {
        _listTab = [[UITableView alloc]init];
    }
    return _listTab;
}

#pragma mark - UITableViewDelegate DataSource
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return 10;
}

-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    return 80;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath;
{
 
    RedioDetailListCell *cell = [tableView dequeueReusableCellWithIdentifier:detailListCell];
    
 
    return cell;
    
}
-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    radioController *vc = [radioController new];
    [self.navigationController pushViewController:vc animated:YES];
}

#pragma mark - segmentHandle
- (IBAction)segHandle:(UISegmentedControl *)sender {
    if (sender.selectedSegmentIndex == 0) {
      [_ScrollView setContentOffset:CGPointMake(0, 0) animated:YES];
    }else
    {
      [_ScrollView setContentOffset:CGPointMake(SWidth, 0) animated:YES];
    }
}
#pragma mark - SCrollViewDelegate
-(void)scrollViewDidEndDecelerating:(UIScrollView *)scrollView{
    
    //因为tableView继承scrollView所以滑动tableView也会执行scrollViewDidEndDecelerating代理方法
    if (scrollView.tag == 100) {
        NSInteger index = scrollView.contentOffset.x / SWidth;
        _segMent.selectedSegmentIndex = index;
    }
    


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
