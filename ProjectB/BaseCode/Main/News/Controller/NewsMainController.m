//
//  NewsMainController.m
//  ProjectB
//
//  Created by lanou on 2016/9/28.
//  Copyright © 2016年 lanou. All rights reserved.
//

#import "NewsMainController.h"
#import "NewsMainTableViewCell.h"
#import "DataModels.h"
#import "UIImageView+WebCache.h"
#import "NewsDetailController.h"
#import "UINavigationBar+Other.h"

@interface NewsMainController ()<UITableViewDataSource,UITableViewDelegate,UIScrollViewDelegate>
@property (weak, nonatomic) IBOutlet UIScrollView *titleScrollView;
@property (weak, nonatomic) IBOutlet UIScrollView *contentScrollView;
@property(nonatomic,assign)NSInteger titleIndex;
@property(nonatomic,strong)NSString *cateNumStr;
@property(nonatomic,assign)NSInteger tableTag;
@property(nonatomic,strong)NSMutableArray *cateNumArr;


@property(nonatomic,strong)BaseClass *base;

@end

@implementation NewsMainController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    [self setupTitle];
    [self someSet];
    [self setupContent];
    [self askData];
    [self.navigationController.navigationBar setColor:[UIColor colorWithRed:216.0/255 green:76.0/255 blue:68.0/255 alpha:1.0]];
    
}
-(void)viewWillAppear:(BOOL)animated
{
  
    
}

#pragma mark initUI
-(void)setupTitle
{
    CGFloat labelW = 80;
    CGFloat labelY = 0;
    CGFloat labelH = self.titleScrollView.frame.size.height;
    NSArray *titleArr = @[@"要闻",@"艺术",@"家居",@"时尚",@"旅游",@"社会"];
    for (NSInteger i = 0; i < 6; i++) {
        UILabel *label = [[UILabel alloc]init];
        label.frame = CGRectMake(labelW * i, labelY, labelW, labelH);
        label.text = titleArr[i];
        label.textAlignment = NSTextAlignmentCenter;
        [label addGestureRecognizer:[[UITapGestureRecognizer alloc]initWithTarget:self action:@selector(tapTitle:)]];
        label.userInteractionEnabled = YES;
        label.tag = i+100;
        [self.titleScrollView addSubview:label];
    }
    self.titleScrollView.contentSize = CGSizeMake(6 * labelW, 0);
    self.contentScrollView.contentSize = CGSizeMake(6* self.contentScrollView.frame.size.width * Ratio, 0);
    
    
}

-(void)someSet
{
    self.title = @"新闻";
    self.titleScrollView.showsHorizontalScrollIndicator = NO;
    self.contentScrollView.showsHorizontalScrollIndicator = NO;
    self.contentScrollView.pagingEnabled = YES;
    self.contentScrollView.delegate = self;
    self.edgesForExtendedLayout = UIRectEdgeNone;
    [self.contentScrollView setContentOffset: CGPointMake(0, 0)];
    UILabel *first = (UILabel *)[self.view viewWithTag:100];
    first.textColor = [UIColor redColor];
    _titleIndex = 100;
    _cateNumArr =[@[@"T1429173683626",@"T1441074311424",@"T1348654105308",@"T1348650593803",@"T1348654204705",@"T1348648037603"]mutableCopy];
    _cateNumStr = _cateNumArr[0];
    _tableTag = 200;
    
    
}


-(void)tapTitle:(UITapGestureRecognizer *)tap
{
    NSInteger index = tap.view.tag;
    CGPoint offset = self.contentScrollView.contentOffset;
    offset.x = (index-100) * self.contentScrollView.frame.size.width;
    [self.contentScrollView setContentOffset:offset animated:YES];
    self.titleIndex = index;
    _cateNumStr = _cateNumArr[index-100];
    _tableTag = 200 + index - 100;
    [self askData];
}
-(void)setupContent
{
    for (NSInteger i = 0; i < 6; i++) {
        UITableView *table = [[UITableView alloc]initWithFrame:CGRectMake(i * self.contentScrollView.frame.size.width * Ratio, 0, self.contentScrollView.frame.size.width * Ratio, self.contentScrollView.frame.size.height) style:UITableViewStylePlain];
        table.delegate = self;
        table.dataSource = self;
        UINib *myNib = [UINib nibWithNibName:@"NewsMainTableViewCell" bundle:nil];
        [table registerNib:myNib forCellReuseIdentifier:@"NewsMainTableViewCell"];
        table.estimatedRowHeight = 70;
        table.rowHeight = UITableViewAutomaticDimension;
        [table setSeparatorInset:UIEdgeInsetsZero];
        [table setLayoutMargins:UIEdgeInsetsZero];
        table.tag = i + 200;
        [self.contentScrollView addSubview:table];
        
    }
    
}
-(void)setTitleIndex:(NSInteger)titleIndex
{
    if (titleIndex == self.titleIndex) {
        return;
    }
    UILabel *nextLabel = (UILabel *)[self.view viewWithTag:titleIndex];
    nextLabel.textColor = [UIColor redColor];
    UILabel *lastLabel = (UILabel *)[self.view viewWithTag:self.titleIndex];
    lastLabel.textColor = [UIColor blackColor];
    _titleIndex = titleIndex;
}

#pragma mark handleData
-(void)askData
{
    NSString *url = [NSString stringWithFormat:@"http://c.m.163.com/nc/article/list/%@/0-20.html",_cateNumStr];
    [NetWorkRequest requestWithMethod:GET URL:url para:nil success:^(NSData *data) {
        if (data) {

            NSDictionary *dic = [NSJSONSerialization JSONObjectWithData:data options:NSJSONReadingMutableContainers error:nil];
            _base = [BaseClass modelObjectWithDictionary:dic key:_cateNumStr];
            
            UITableView *table = (UITableView *)[self.view viewWithTag:_tableTag];
            dispatch_async(dispatch_get_main_queue(), ^{
                [table reloadData];
            });
        }
    } error:^(NSError *error) {
        NSLog(@"error__%@",error);
    } view:self.view];

}

#pragma mark TableView代理
        
-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return _base.t1441074311424.count;
}

-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 1;
}

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    
    
    NewsMainTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"NewsMainTableViewCell"];
    T1441074311424 *model =  _base.t1441074311424[indexPath.row];
    [cell.coverimg sd_setImageWithURL:[NSURL URLWithString:model.imgsrc]];
    cell.mainTitle.text = model.title;
    cell.subTitle.text = model.digest;
    cell.From.text = model.source;
    cell.followCount.text = [NSString stringWithFormat:@"%.f",model.replyCount];
//    cell.selectionStyle = UITableViewCellSelectionStyleNone;
    
    [cell setSeparatorInset:UIEdgeInsetsZero];
    [cell setLayoutMargins:UIEdgeInsetsZero];
    
    return cell;
}

-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    [tableView deselectRowAtIndexPath:indexPath animated:NO];
    NewsDetailController *detailVC = [NewsDetailController new];
    T1441074311424 *model =  _base.t1441074311424[indexPath.row];
    detailVC.postid = model.postid;
    [self.navigationController pushViewController:detailVC animated:YES];
}

#pragma mark ScrollView

-(void)scrollViewDidEndDecelerating:(UIScrollView *)scrollView
{
    if (scrollView == self.contentScrollView) {
        
        
        // 一些临时变量
        CGFloat width = scrollView.frame.size.width;
        CGFloat offsetX = scrollView.contentOffset.x;
        
        // 当前位置需要显示的控制器的索引
        NSInteger index = offsetX / width;
        
        //刷新UI
        _cateNumStr = _cateNumArr[index];
        _tableTag = 200 + index;
        [self askData];
        
        // 让对应的顶部标题居中显示
        UILabel *label = self.titleScrollView.subviews[index];
        CGPoint titleOffset = self.titleScrollView.contentOffset;
        titleOffset.x = label.center.x - width * 0.5;
        // 左边超出处理
        if (titleOffset.x < 0) titleOffset.x = 0;
        // 右边超出处理
        CGFloat maxTitleOffsetX = self.titleScrollView.contentSize.width - width;
        if (titleOffset.x > maxTitleOffsetX) titleOffset.x = maxTitleOffsetX;
        
        [self.titleScrollView setContentOffset:titleOffset animated:YES];
        
        self.titleIndex = index + 100;
        
        
    }
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
