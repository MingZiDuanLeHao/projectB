//
//  RadioDetailList.m
//  ProjectB
//
//  Created by lanou on 2016/9/29.
//  Copyright © 2016年 lanou. All rights reserved.
//

#import "RadioDetailListController.h"
#import "RedioDetailListCell.h"
#import "RadioPlayViewController.h"
#import "NetWorkRequest.h"
#import "MJRefresh.h"
#import "UIImageView+WebCache.h"
#import "RadioDetailListDataModels.h"
#import "MJRefresh.h"
#import "RadiodetailHeaderView.h"
#import "RadiodetailCellHeaderView.h"



@interface RadioDetailListController ()<UIScrollViewDelegate,UITableViewDataSource,UITableViewDelegate>
@property (nonatomic,strong) UITableView *listTab;
@property (nonatomic,strong) RadioDetailListRadioDetailList *detailList;
@property(nonatomic,strong)RadiodetailHeaderView *topView;
@property(nonatomic,strong)RadiodetailCellHeaderView *headerView;



@end
static NSString *detailListCell = @"detailListCell";
@implementation RadioDetailListController

- (void)viewDidLoad {
    [super viewDidLoad];

    [self requestData];
    [self initUI];

}

-(void)initUI
{
    
    self.edgesForExtendedLayout = UIRectEdgeNone;
    self.title = @"专辑详情";
    
    //topView
    _topView = [[NSBundle mainBundle]loadNibNamed:@"RadiodetailHeaderView" owner:nil options:nil][0];
    _topView.frame = CGRectMake(0, 0, SWidth, 134);
    [_topView.avatar sd_setImageWithURL:[NSURL URLWithString:_detailList.data.album.coverLarge]];
    _topView.titleLabel.text = self.titleID;
    _topView.playCount.text = [NSString stringWithFormat:@"播放次数:%.0f",_detailList.data.album.playTimes];
    NSLog(@"______%@",_detailList.data.user);
    _topView.nameLabel.text =[NSString stringWithFormat:@"作者:%@", _detailList.data.user.nickname];
    
    //listtable
    [self.listTab registerNib:[UINib nibWithNibName:@"RedioDetailListCell" bundle:nil] forCellReuseIdentifier:detailListCell];
    _listTab.showsVerticalScrollIndicator = NO;
    _listTab.delegate = self;
    _listTab.dataSource = self;
//    _listTab.bounces = NO;
    _listTab.tableHeaderView = _topView;
    [self.view addSubview:_listTab];
  
    //上提加载更多
    _listTab.mj_footer = [MJRefreshAutoNormalFooter footerWithRefreshingBlock:^{
        // 进入刷新状态后会自动调用这个block
        //最新
        [self requestData];
    }];
}

-(void)requestData
{
    NSString * statPage = @"%40%E7%94%B5%E5%8F%B0_%E9%9F%B3%E4%B9%90%E5%8F%B0";
    NSString *UrlStr1 = [NSString stringWithFormat:@"http://mobile.ximalaya.com/mobile/v1/album?albumId=%@&device=iPad&pageSize=20&source=5&statEvent=pageview%@album%@&statModule=%@&statPage=categorytag%@&statPosition=1",self.albumId,@"%2F",self.statEvent,self.statModule,statPage];

    UrlStr1 = [UrlStr1 stringByAddingPercentEncodingWithAllowedCharacters:[NSCharacterSet characterSetWithCharactersInString:@"`#%^{}\"[]|\\<> "].invertedSet];
    [NetWorkRequest requestWithMethod:GET URL:UrlStr1 para:nil success:^(NSData *data) {
        if (data) {
            NSDictionary *dic = [NSJSONSerialization JSONObjectWithData:data options:NSJSONReadingMutableLeaves error:nil];
            self.detailList = [RadioDetailListRadioDetailList modelObjectWithDictionary:dic];

            dispatch_async(dispatch_get_main_queue(), ^{

                [_listTab reloadData];
               
                
            });
        }
        
    } error:^(NSError *error) {
        NSLog(@"error===%@",error);
    } view:self.view];

}

#pragma marks- 懒加载


-(UITableView *)listTab
{
    if (!_listTab) {
        _listTab = [[UITableView alloc]initWithFrame:CGRectMake(0, 0, SWidth, SHeight) style:UITableViewStylePlain];
    }
    return _listTab;
}



#pragma mark - UITableViewDelegate DataSource

-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 1;
}
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
    RadioDetailListList *list = _detailList.data.tracks.list[indexPath.row];
    [cell setDataWithModel:list];
 
    return cell;
    
}
-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    RadioPlayViewController *vc = [RadioPlayViewController new];
    [self.navigationController pushViewController:vc animated:YES];
}

-(UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section
{
    _headerView = [[NSBundle mainBundle]loadNibNamed:@"RadiodetailCellHeaderView" owner:nil options:nil][0];
    _headerView.frame = CGRectMake(0, 0, SWidth, 25);
        
    return _headerView;
}

- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section
{
    return 25;
}


#pragma mark - SCrollViewDelegate


//-(void)scrollViewDidScroll:(UIScrollView *)scrollView
//{
////    NSLog(@"%.f",scrollView.contentOffset.y);
//    if (scrollView.contentOffset.y >= 135 ) {
//        if (_topView.frame.origin.y == -135) {
//            return;
//        }
//        else
//        {
//            CGRect rect = CGRectMake(0, -250, SWidth, 165);
//            _changeView = [[NSBundle mainBundle]loadNibNamed:@"RadiodetailHeaderView" owner:nil options:nil][0];
//            _changeView = _topView;
//            _changeView.frame = rect;
//            [self.view addSubview:_changeView];
//        }
//    }
//    else
//    {
//        if ([self.view.subviews containsObject:_changeView]) {
//            [_changeView removeFromSuperview];
//            _listTab.tableHeaderView = _topView;
//        }
//        
//    }
//}



@end
