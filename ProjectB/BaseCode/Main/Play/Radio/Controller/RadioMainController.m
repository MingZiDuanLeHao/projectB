//
//  RadioMainController.m
//  ProjectB
//
//  Created by lanou on 2016/9/28.
//  Copyright © 2016年 lanou. All rights reserved.
//

#import "RadioMainController.h"
#import "RadioDetailList.h"

@interface RadioMainController ()<UITableViewDataSource,UITableViewDelegate>
@property (nonatomic,strong) UITableView *leftTable;
@property (nonatomic,strong) UITableView *rightTable;

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
    self.leftTable.frame = CGRectMake(0, 0, 60, 400);
    [_leftTable registerClass:[UITableViewCell class] forCellReuseIdentifier:leftCell];
    _leftTable.delegate = self;
    _leftTable.dataSource = self;
    [self.view addSubview:_leftTable];
    
    //右table
    self.rightTable.frame = CGRectMake(60, 64, SWidth - 60, SHeight - 64);
    [_rightTable registerClass:[UITableViewCell class] forCellReuseIdentifier:rightCell];
    _rightTable.delegate = self;
    _rightTable.dataSource = self;
    [self.view addSubview:_rightTable];
    
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
        return 5;
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
        
        
        //        XMGCategory *c = self.categories[indexPath.row];
        
        //        // 设置普通图片
        //        cell.imageView.image = [UIImage imageNamed:c.icon];
        //        // 设置高亮图片（cell选中 -> cell.imageView.highlighted = YES -> cell.imageView显示highlightedImage这个图片）
        //        cell.imageView.highlightedImage = [UIImage imageNamed:c.highlighted_icon];
        
        // 设置label高亮时的文字颜色
        cell.textLabel.highlightedTextColor = [UIColor redColor];
        
        cell.textLabel.text = @"音悦台";
        cell.textLabel.numberOfLines = 0;
        //        cell.accessoryType = UITableViewCellAccessoryDisclosureIndicator;
        
        
        return cell;
    } else {
        // 右边表格
        
        UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:rightCell];
        
        // 获得左边表格被选中的模型
        //        XMGCategory *c = self.categories[self.categoryTableView.indexPathForSelectedRow.row];
        cell.textLabel.text = @"22";
        
        
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
    if (tableView == _leftTable) {
        
    }else{
        RadioDetailList *listVC = [RadioDetailList new];
        [self.navigationController pushViewController:listVC animated:YES];
        
    }
}
@end
