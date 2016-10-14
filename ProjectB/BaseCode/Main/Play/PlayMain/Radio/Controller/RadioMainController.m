//
//  RadioMainController.m
//  ProjectB
//
//  Created by lanou on 2016/9/28.
//  Copyright © 2016年 lanou. All rights reserved.
//

#import "RadioMainController.h"
#import "RadioDetailListController.h"
#import "RadioMainRightTableCell.h"
#import "NetWorkRequest.h"
#import "RadioMainDataModels.h"
#import "MJRefresh.h"
#import "AppDelegate.h"

@interface RadioMainController ()<UITableViewDataSource,UITableViewDelegate>
@property (nonatomic,strong) UITableView *leftTable;
@property (nonatomic,strong) UITableView *rightTable;
@property (nonatomic,strong) NSArray  *leftRadioNameArr;
@property (nonatomic,strong) NSArray  *rightRadioCount;
@property (nonatomic,assign) NSInteger selectIndex;
@property (nonatomic,assign) NSInteger keywordId;
@property (nonatomic,assign) NSInteger pageId;
@property (nonatomic,strong) RadioMain  *radioMain;
@property (nonatomic,assign) BOOL HideList;
@end

static NSString *leftCell = @"leftCell";
static NSString *rightCell = @"rightCell";
@implementation RadioMainController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.title = @"电台";
    [self initUI];
    self.pageId = 1;
    self.keywordId = 113;
    [self requestData];
    ((AppDelegate *)([UIApplication sharedApplication].delegate)).mainTabble.tabBar.hidden = YES;
//    self.automaticallyAdjustsScrollViewInsets = NO;
//    self.edgesForExtendedLayout = UIRectEdgeNone;
    
}

-(void)initUI
{
    [self.navigationController.navigationBar setValue:nil forKey:@"backgroundView"];
    //左table
    self.leftTable.frame = CGRectMake(0, 64, 50, SHeight - 44);
    
    [_leftTable setSeparatorInset:UIEdgeInsetsZero];
    [_leftTable setLayoutMargins:UIEdgeInsetsZero];
    UIView *v = [[UIView alloc] initWithFrame:CGRectZero];
    [_leftTable setTableFooterView:v];
    
    [_leftTable registerClass:[UITableViewCell class] forCellReuseIdentifier:leftCell];
    _leftTable.delegate = self;
    _leftTable.dataSource = self;
    _leftTable.bounces = NO;
    [self.view addSubview:_leftTable];
    
    //右table
    self.rightTable.frame = CGRectMake(50, 64, SWidth - 50, SHeight - 64);
    [_rightTable registerNib:[UINib nibWithNibName:@"RadioMainRightTableCell" bundle:nil] forCellReuseIdentifier:rightCell];
    _rightTable.delegate = self;
    _rightTable.dataSource = self;
    //隐藏导航条
    _rightTable.showsVerticalScrollIndicator = NO;
 
    _rightTable.tableFooterView = [UIView new];
    [self.view addSubview:_rightTable];
    
    //左边列表
    self.leftRadioNameArr = @[@"综合台",@"文艺台",@"音乐台",@"新闻台",@"故事台"];
    
    //上提加载更多
    _rightTable.mj_footer = [MJRefreshAutoNormalFooter footerWithRefreshingBlock:^{
        // 进入刷新状态后会自动调用这个block
        //最新
        self.pageId ++;
        [self requestData];
    }];
    
    //右barButton
    UIButton *button = [[UIButton alloc]initWithFrame:CGRectMake(0, 0, 20, 20)];
    [button setBackgroundImage:[UIImage imageNamed:@"全屏"] forState:UIControlStateNormal];
    [button addTarget:self action:@selector(listHandle) forControlEvents:UIControlEventTouchUpInside];
    UIBarButtonItem *item = [[UIBarButtonItem alloc]initWithCustomView:button];
    self.navigationItem.rightBarButtonItem = item;
    
    
    //使导航栏透明
    [self.navigationController.navigationBar setBackgroundImage:nil forBarMetrics:0];
    self.navigationController.navigationBar.shadowImage=[UIImage new];
//
    //毛玻璃
    UIImageView * imageview = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"rednavi.jpg"]];
    imageview.userInteractionEnabled = YES;
    imageview.contentMode = UIViewContentModeScaleAspectFit;
    imageview.frame = CGRectMake(0, 0,SWidth, 64);
    [self.view insertSubview:imageview belowSubview:_leftTable];
    
    UIBlurEffect *blur = [UIBlurEffect effectWithStyle:UIBlurEffectStyleLight];
    
    UIVisualEffectView *effectview = [[UIVisualEffectView alloc] initWithEffect:blur];
    
    effectview.frame = [UIScreen mainScreen].bounds;
    
    [self.view insertSubview:effectview aboveSubview:imageview];

    
}
-(void)listHandle
{
    if (_HideList == NO) {
        [UIView animateWithDuration:0.5 animations:^{
            _leftTable.frame = CGRectMake(-50, 64, 50, SHeight-44);
            _rightTable.frame = CGRectMake(0, 64, SWidth, SHeight - 64);
        } completion:^(BOOL finished) {

        }];
        _HideList = YES;
    }else
    {
        [UIView animateWithDuration:0.5 animations:^{
          _rightTable.frame = CGRectMake(50, 64, SWidth - 50, SHeight - 64);
            _leftTable.frame = CGRectMake(0, 64, 50, SHeight - 44);
        } completion:^(BOOL finished) {
        
        }];
        _HideList = NO;
    }
    
}
-(void)setSelectIndex:(NSInteger)selectIndex
{
    if (_selectIndex != selectIndex) {
        UITableViewCell *cell = [_leftTable cellForRowAtIndexPath:[NSIndexPath indexPathForRow:_selectIndex inSection:0]];
        cell.textLabel.textColor = [UIColor grayColor];
        //当前点击这个cell
        UITableViewCell *cell1 = [_leftTable cellForRowAtIndexPath:[NSIndexPath indexPathForRow:selectIndex inSection:0]];
        cell1.textLabel.textColor = [UIColor redColor];
    }
    _selectIndex = selectIndex;

}

-(void)requestData
{
     NSString *UrlStr = [NSString stringWithFormat:@"http://mobile.ximalaya.com/mobile/discovery/v2/category/keyword/albums?calcDimension=hot&categoryId=17&device=iPad&keywordId=%ld&pageId=%ld&pageSize=20&statEvent=pageview%2Fcategory%40%E7%94%B5%E5%8F%B0&statModule=%E7%94%B5%E5%8F%B0&statPage=tab%40%E5%8F%91%E7%8E%B0_%E5%88%86%E7%B1%BB&status=0&version=5.4.27",(long)self.keywordId,self.pageId];
    //转化一下,不然返回的data无法解析
        UrlStr = [UrlStr stringByAddingPercentEncodingWithAllowedCharacters:[NSCharacterSet characterSetWithCharactersInString:@"`#%^{}\"[]|\\<> "].invertedSet];
    [NetWorkRequest requestWithMethod:GET URL:UrlStr para:nil success:^(NSData *data) {
        if (data) {
            NSDictionary *dic = [NSJSONSerialization JSONObjectWithData:data options:0 error:nil];
           // NSLog(@"dic======%@",dic);
            self.radioMain = [RadioMain modelObjectWithDictionary:dic];
            dispatch_async(dispatch_get_main_queue(), ^{
                [_rightTable reloadData];

            });
        }
       
    } error:^(NSError *error) {
        NSLog(@"error===%@",error);
    } view:self.view];
    
}

#pragma marks- 懒加载
//左列表
-(UITableView *)leftTable
{
    if (!_leftTable) {
        _leftTable = [[UITableView alloc]init];
        
    }
    return _leftTable;
}

//右列表
-(UITableView *)rightTable
{
    if (!_rightTable) {
        _rightTable = [[UITableView alloc]init];
        [_rightTable setSeparatorInset:UIEdgeInsetsZero];
//        [_rightTable setLayoutMargins:UIEdgeInsetsZero];
    }
    return _rightTable;
}

#pragma mark - Table view data source
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    // 左边表格
    if (tableView == _leftTable)
    {
        return _leftRadioNameArr.count;
    }
    else
    {
        // 右边表格
       
        return _radioMain.list.count;
    }
    
}
//-(void)tableView:(UITableView *)tableView willDisplayCell:(UITableViewCell *)cell forRowAtIndexPath:(NSIndexPath *)indexPath
//{
//    if (tableView == _leftTable) {
//        cell.textLabel.textColor = [UIColor grayColor];
//        
//      
//    }
//}
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    // 左边表格
   
    if (tableView == _leftTable) {
        
        UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:leftCell];

        cell.textLabel.text = _leftRadioNameArr[indexPath.row];
        cell.textLabel.textColor = [UIColor grayColor];
        cell.textLabel.numberOfLines = 0;
        if (indexPath.row == 0) {

            cell.textLabel.textColor = [UIColor redColor];
        }
  
        //分割线顶着左边
         [cell setSeparatorInset:UIEdgeInsetsZero];
        [cell setLayoutMargins:UIEdgeInsetsZero];
        cell.selectionStyle = UITableViewCellSelectionStyleNone;
        return cell;
    } else {
        // 右边表格
        
        RadioMainRightTableCell *cell = [tableView dequeueReusableCellWithIdentifier:rightCell];
        
        // 获得左边表格被选中的模型
        //        XMGCategory *c = self.categories[self.categoryTableView.indexPathForSelectedRow.row];
        List *list = _radioMain.list[indexPath.row];
        [cell setDataWithModel:list];
        
        [cell setSeparatorInset:UIEdgeInsetsMake(0, 90, 0, 0)];
        [cell setLayoutMargins:UIEdgeInsetsZero];
        return cell;
    }
}

-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    if (_leftTable == tableView) {
        return 80;
    }
    else
    {
        return 90;
    }
}

#pragma mark - <UITableViewDelegate>
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{

   // [tableView deselectRowAtIndexPath:indexPath animated:YES];
    if (tableView == _leftTable) {
        UITableViewCell *cell = [tableView cellForRowAtIndexPath:indexPath];
        cell.textLabel.textColor = [UIColor redColor];
            self.selectIndex = indexPath.row;
        if (indexPath.row == 0) {
            self.keywordId = 113;
            [self requestData];
        }else if(indexPath.row == 1){
            self.keywordId = 106;
            [self requestData];
        }else if(indexPath.row == 2 ){
            self.keywordId = 102;
            [self requestData];
        }else if(indexPath.row == 3 ){
            self.keywordId = 101;
            [self requestData];
        }else if(indexPath.row == 4 ){
            self.keywordId = 107;
            [self requestData];
            
        }
        
    }else{
        [tableView deselectRowAtIndexPath:indexPath animated:YES];
        RadioDetailListController *listVC = [RadioDetailListController new];
        List *list = _radioMain.list[indexPath.row];
        listVC.albumId = [NSString stringWithFormat:@"%.0f",list.albumId];
        listVC.titleID = list.title;
        listVC.statEvent = [NSString stringWithFormat:@"40%@",listVC.albumId];
    
        if (self.selectIndex == 0) {
            listVC.statModule = @"%E7%94%B5%E5%8F%B0_%E7%BB%BC%E5%90%88%E5%8F%B0";
        }else if (self.selectIndex == 1){
            listVC.statModule = @"%E7%94%B5%E5%8F%B0_%E6%96%87%E8%89%BA%E5%8F%B0";
        }else if (self.selectIndex == 2){
            listVC.statModule = @"%E7%94%B5%E5%8F%B0_%E9%9F%B3%E4%B9%90%E5%8F%B0";
        }else if (self.selectIndex == 3){
            listVC.statModule = @"%E7%94%B5%E5%8F%B0_%E6%96%B0%E9%97%BB%E5%8F%B0";
        }else if (self.selectIndex == 4){
            listVC.statModule = @"%E7%94%B5%E5%8F%B0_%E6%95%85%E4%BA%8B%E5%8F%B0";
        }
        [self.navigationController pushViewController:listVC animated:YES];
        
    }
}
@end
