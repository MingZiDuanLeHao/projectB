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

@interface RadioMainController ()<UITableViewDataSource,UITableViewDelegate>
@property (nonatomic,strong) UITableView *leftTable;
@property (nonatomic,strong) UITableView *rightTable;
@property (nonatomic,strong) NSArray  *radioArr;
@end

static NSString *leftCell = @"leftCell";
static NSString *rightCell = @"rightCell";
@implementation RadioMainController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.title = @"电台";
    [self initUI];
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

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    // 左边表格
    if (tableView == _leftTable) {
        
        UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:leftCell];

        cell.textLabel.highlightedTextColor = [UIColor redColor];
        
        cell.textLabel.text = _radioArr[indexPath.row];
        cell.textLabel.numberOfLines = 0;
        //        cell.accessoryType = UITableViewCellAccessoryDisclosureIndicator;
        
        
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
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
    if (tableView == _leftTable) {
        
    }else{
        RadioDetailList *listVC = [RadioDetailList new];
        [self.navigationController pushViewController:listVC animated:YES];
        
    }
}
@end
