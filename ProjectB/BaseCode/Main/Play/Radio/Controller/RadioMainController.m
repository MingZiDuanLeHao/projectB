//
//  RadioMainController.m
//  ProjectB
//
//  Created by lanou on 2016/9/28.
//  Copyright © 2016年 lanou. All rights reserved.
//

#import "RadioMainController.h"
#import "RadioDetailList.h"
#import "RadioMainRightTableCell.h"
#import "NetWorkRequest.h"
#import "RadioMainDataModels.h"

@interface RadioMainController ()<UITableViewDataSource,UITableViewDelegate>
@property (nonatomic,strong) UITableView *leftTable;
@property (nonatomic,strong) UITableView *rightTable;
@property (nonatomic,strong) NSArray  *radioArr;
@property (nonatomic,assign) NSInteger selectIndex;
@end

static NSString *leftCell = @"leftCell";
static NSString *rightCell = @"rightCell";
@implementation RadioMainController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.title = @"电台";
    [self initUI];
  //  [self requestData];
}

-(void)initUI
{
    //左table
    self.leftTable.frame = CGRectMake(0, 0, 50, SHeight - 44);
    [_leftTable registerClass:[UITableViewCell class] forCellReuseIdentifier:leftCell];
    _leftTable.delegate = self;
    _leftTable.dataSource = self;
    [self.view addSubview:_leftTable];
    
    //右table
    self.rightTable.frame = CGRectMake(50, 64, SWidth - 60, SHeight - 64);
    [_rightTable registerNib:[UINib nibWithNibName:@"RadioMainRightTableCell" bundle:nil] forCellReuseIdentifier:rightCell];
    _rightTable.delegate = self;
    _rightTable.dataSource = self;
    [self.view addSubview:_rightTable];
    
    self.radioArr = @[@"综合台",@"文艺台",@"音乐台",@"新闻台",@"故事台"];
    
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
//
-(void)requestData
{
    [NetWorkRequest requestWithMethod:GET URL:@"http://mobile.ximalaya.com/mobile/discovery/v2/category/keyword/albums?calcDimension=hot&categoryId=17&device=iPad&keywordId=113&pageId=1&pageSize=20&statEvent=pageview%2Fcategory%40%E7%94%B5%E5%8F%B0&statModule=%E7%94%B5%E5%8F%B0&statPage=tab%40%E5%8F%91%E7%8E%B0_%E5%88%86%E7%B1%BB&status=0&version=5.4.27" para:nil success:^(NSData *data) {
        NSDictionary *dic = [NSJSONSerialization JSONObjectWithData:data options:0 error:nil];
        NSLog(@"dic======%@",dic);
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
    }
    return _rightTable;
}

#pragma mark - Table view data source
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    // 左边表格
    if (tableView == _leftTable)
    {
        return _radioArr.count;
    }
    else
    {
        // 右边表格
        
        return 20;
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

        cell.textLabel.text = _radioArr[indexPath.row];
        cell.textLabel.textColor = [UIColor grayColor];
        cell.textLabel.numberOfLines = 0;
        if (indexPath.row == 0) {

            cell.textLabel.textColor = [UIColor redColor];
        }
        //        cell.accessoryType = UITableViewCellAccessoryDisclosureIndicator;
        
        cell.selectionStyle = UITableViewCellSelectionStyleNone;
        return cell;
    } else {
        // 右边表格
        
        RadioMainRightTableCell *cell = [tableView dequeueReusableCellWithIdentifier:rightCell];
        
        // 获得左边表格被选中的模型
        //        XMGCategory *c = self.categories[self.categoryTableView.indexPathForSelectedRow.row];
        cell.titlelabel.text = @"头条";
        cell.playCount.text = @"一万";
        cell.NumCount.text = @"11";
        cell.desc.text = @"获得左边表格被选中的模型获得左边表格被选中的模型获得左边表格被选中的模型获得左边表格被选中的模型";

        
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
        return 100;
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
        
    }else{
        RadioDetailList *listVC = [RadioDetailList new];
        [self.navigationController pushViewController:listVC animated:YES];
        
    }
}
@end
