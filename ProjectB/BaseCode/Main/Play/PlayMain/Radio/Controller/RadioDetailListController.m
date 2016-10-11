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
#import "RadioOneCell.h"
#import "RadioTwoDataModels.h"
#import "RadioTwoCell.h"



@interface RadioDetailListController ()<UIScrollViewDelegate,UITableViewDataSource,UITableViewDelegate>
@property (nonatomic,strong) UITableView *listTab;
@property (nonatomic,strong) RadioDetailListRadioDetailList *detailList;
@property(nonatomic,strong)RadiodetailHeaderView *topView;
@property(nonatomic,strong)RadiodetailCellHeaderView *headerView;
@property(nonatomic,strong)NSString *showTable;
@property(nonatomic,strong)RadioTwoBaseClass *baseclass;
//@property(nonatomic,strong)UIView *blankView;



@end
static NSString *detailListCell = @"detailListCell";
@implementation RadioDetailListController

- (void)viewDidLoad {
    [super viewDidLoad];

    [self initUI];
    _showTable = @"详情";
    [self requestListData];
    [self requestDetailData];
    

}

-(void)viewDidDisappear:(BOOL)animated
{

}


-(void)initUI
{
    //    导航栏变为透明
    [self.navigationController.navigationBar setBackgroundImage:[UIImage new] forBarMetrics:0];
    //    让黑线消失的方法
    self.navigationController.navigationBar.shadowImage=[UIImage new];
    
    //设置导航栏透明度
    
//    self.edgesForExtendedLayout = UIRectEdgeNone;
    self.title = @"专辑详情";
    
    //topView
    _topView = [[NSBundle mainBundle]loadNibNamed:@"RadiodetailHeaderView" owner:nil options:nil][0];
    _topView.frame = CGRectMake(0, 0, SWidth, 134);
    
    
    //listtable
    [self.listTab registerNib:[UINib nibWithNibName:@"RedioDetailListCell" bundle:nil] forCellReuseIdentifier:detailListCell];
    [self.listTab registerNib:[UINib nibWithNibName:@"RadioOneCell" bundle:nil] forCellReuseIdentifier:@"RadioOneCell"];
    [self.listTab registerNib:[UINib nibWithNibName:@"RadioTwoCell" bundle:nil] forCellReuseIdentifier:@"RadioTwoCell"];
    _listTab.showsVerticalScrollIndicator = NO;
    _listTab.delegate = self;
    _listTab.dataSource = self;
    _listTab.tableHeaderView = _topView;
    [self.view addSubview:_listTab];
    _listTab.estimatedRowHeight = 80;
    _listTab.rowHeight = UITableViewAutomaticDimension;



    
    //headerForView
    _headerView = [[NSBundle mainBundle]loadNibNamed:@"RadiodetailCellHeaderView" owner:nil options:nil][0];
    _headerView.frame = CGRectMake(0, 0, SWidth, 25);
    _headerView.detailLabel.textColor = [UIColor redColor];
    _headerView.detailLabel.userInteractionEnabled = YES;
    _headerView.listLabel.userInteractionEnabled = YES;
    UITapGestureRecognizer *tap1 = [[UITapGestureRecognizer alloc]initWithTarget:self action:@selector(tapAction1:)];
    UITapGestureRecognizer *tap2 = [[UITapGestureRecognizer alloc]initWithTarget:self action:@selector(tapAction2:)];
    [_headerView.detailLabel addGestureRecognizer:tap1];
    [_headerView.listLabel addGestureRecognizer:tap2];
    
    //多余cell分割线
    UIView *v = [[UIView alloc] initWithFrame:CGRectZero];
    [_listTab setTableFooterView:v];
    
//    毛玻璃
    UIImageView * imageview = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"rednavi.jpg"]];
    imageview.userInteractionEnabled = YES;
    imageview.contentMode = UIViewContentModeScaleAspectFit;
    imageview.frame = CGRectMake(0, 0,SWidth, 64);
    [self.view insertSubview:imageview belowSubview:_listTab];
    
    UIBlurEffect *blur = [UIBlurEffect effectWithStyle:UIBlurEffectStyleLight];
    
    UIVisualEffectView *effectview = [[UIVisualEffectView alloc] initWithEffect:blur];
    
    effectview.frame = [UIScreen mainScreen].bounds;
    
    [self.view insertSubview:effectview aboveSubview:imageview];
    
  
}

-(void)tapAction1:(UITapGestureRecognizer *)tap
{
    _showTable = @"详情";
    [self requestDetailData];
    _headerView.listLabel.textColor = [UIColor blackColor];
    _headerView.detailLabel.textColor = [UIColor redColor];
}

-(void)tapAction2:(UITapGestureRecognizer *)tap
{
    _showTable = @"列表";
    [self requestListData];
    _headerView.detailLabel.textColor = [UIColor blackColor];
    _headerView.listLabel.textColor = [UIColor redColor];
}

-(void)requestListData
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
                [_topView.avatar sd_setImageWithURL:[NSURL URLWithString:_detailList.data.album.coverLarge]];
                _topView.titleLabel.text = self.titleID;
                _topView.playCount.text = [NSString stringWithFormat:@"播放次数:%.0f",_detailList.data.album.playTimes];
                _topView.nameLabel.text =[NSString stringWithFormat:@"作者:%@", _detailList.data.user.nickname];
                
                //图片效果
                _topView.avatar.layer.borderWidth = 0.3;
                _topView.avatar.layer.borderColor =[[UIColor grayColor]CGColor];
                _topView.avatar.layer.shadowOffset = CGSizeMake(-3, 3);
                _topView.avatar.layer.shadowColor =[[UIColor blackColor]CGColor];
                _topView.avatar.layer.shadowOpacity = 0.5;
               
                
            });
        }
        
    } error:^(NSError *error) {
        NSLog(@"error===%@",error);
    } view:self.view];
    
}

-(void)requestDetailData
{
    NSString * statPage = @"%40%E7%94%B5%E5%8F%B0_%E9%9F%B3%E4%B9%90%E5%8F%B0";
    NSString *UrlStr2 = [NSString stringWithFormat:@"http://mobile.ximalaya.com/mobile/v1/album/detail?albumId=%@&device=iPad&statEvent=pageview%@album%@&statModule=%@&statPage=categorytag%@&statPosition=1",self.albumId,@"%2F",self.statEvent,self.statModule,statPage];
     UrlStr2 = [UrlStr2 stringByAddingPercentEncodingWithAllowedCharacters:[NSCharacterSet characterSetWithCharactersInString:@"`#%^{}\"[]|\\<> "].invertedSet];
    
    [NetWorkRequest requestWithMethod:GET URL:UrlStr2 para:nil success:^(NSData *data) {
        if (data) {
            NSDictionary *dic = [NSJSONSerialization JSONObjectWithData:data options:NSJSONReadingMutableLeaves error:nil];
            self.baseclass = [RadioTwoBaseClass modelObjectWithDictionary:dic];
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
        _listTab = [[UITableView alloc]initWithFrame:CGRectMake(0, 64, SWidth, SHeight-64) style:UITableViewStylePlain];
    }
    return _listTab;
}



#pragma mark - UITableViewDelegate DataSource

-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    if ([_showTable isEqualToString:@"列表"]) {
        //上提加载更多
        _listTab.mj_footer = [MJRefreshAutoNormalFooter footerWithRefreshingBlock:^{
            // 进入刷新状态后会自动调用这个block
            //最新
            [self requestListData];
        }];
        return 1;
    }
    else
    {
//        _listTab.tableFooterView = nil;
        _listTab.mj_footer = nil;
        return 2;
    }
    
}
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    if ([_showTable isEqualToString:@"详情"]) {
        return 1;
    }
    else
    {
        return 10;
    }
    
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath;
{
    if ([_showTable isEqualToString:@"详情"]) {
        if (indexPath.section == 0 ) {
            RadioOneCell *cell = [tableView dequeueReusableCellWithIdentifier:@"RadioOneCell"];
            cell.introLabel.text = [NSString stringWithFormat:@"%@",_detailList.data.album.intro];;
            cell.selectionStyle = UITableViewCellSelectionStyleNone;
            cell.backgroundColor = [UIColor clearColor];
            return cell;
        }
        else
        {
            RadioTwoCell *cell = [tableView dequeueReusableCellWithIdentifier:@"RadioTwoCell"];
            RadioTwoUser *user = _baseclass.data.user;
            cell.model = user;
            cell.selectionStyle = UITableViewCellSelectionStyleNone;
            cell.backgroundColor = [UIColor clearColor];
            return cell;
        }
        
    }
    else
    {
        RedioDetailListCell *cell = [tableView dequeueReusableCellWithIdentifier:detailListCell];
        RadioDetailListList *list = _detailList.data.tracks.list[indexPath.row];
        [cell setDataWithModel:list];
//        cell.selectionStyle = UITableViewCellSelectionStyleNone;
        [tableView deselectRowAtIndexPath:indexPath animated:NO];
        [cell setSeparatorInset:UIEdgeInsetsMake(0, 85, 0, 0)];
        [cell setLayoutMargins:UIEdgeInsetsZero];
        cell.backgroundColor = [UIColor clearColor];
        return cell;
    }
   
    
}
-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
    if ([_showTable isEqualToString:@"列表"]) {
        RadioPlayViewController *vc = [RadioPlayViewController new];
        UINavigationController *navi = [[UINavigationController alloc]initWithRootViewController:vc];
        [self presentViewController:navi animated:YES completion:nil];
      
    }
    
}

-(UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section
{
    if (section == 0) {
        return _headerView;
    }
    else
    {
        UIView *blankView = [[UIView alloc]init];
        blankView.backgroundColor = [UIColor colorWithRed:205.0/255 green:210.0/255 blue:216.0/255 alpha:0.43];
        return blankView;
    }
}

- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section
{
    if ([_showTable isEqualToString:@"详情"]) {
        if (section == 0 ) {
                return 25;
        }
        else
        {
            return 10;
        }
    }
    else
    {
        return 25;
    }
}

-(UIView *)tableView:(UITableView *)tableView viewForFooterInSection:(NSInteger)section
{
    if ([_showTable isEqualToString:@"详情"]) {
        if (section == 0) {
        return nil;
        }
        else
        {
            UIView *blankView = [[UIView alloc]init];
            blankView.backgroundColor = [UIColor colorWithRed:205.0/255 green:210.0/255 blue:216.0/255 alpha:0.43];
            return blankView;
        }
    }
    else
    {
        return nil;
    }
}

- (CGFloat)tableView:(UITableView *)tableView heightForFooterInSection:(NSInteger)section
{
    if ([_showTable isEqualToString:@"详情"]) {
        if (section == 0) {
            return 0;
        }
        else
        {
            
            return 10;
        }
    }
    else
    {
        return 0;
    }
  
}





@end
