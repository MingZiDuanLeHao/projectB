//
//  BeautyViewController.m
//  ProjectB
//
//  Created by 瓶子 on 2016/9/30.
//  Copyright © 2016年 lanou. All rights reserved.
//

#import "BeautyViewController.h"
#import "waterFlow.h"
#import "MJRefresh.h"
#import "BeautyCell.h"
#import "UIImageView+WebCache.h"
#import "AppDelegate.h"
#import "BeautyDataModels.h"

@interface BeautyViewController ()<UICollectionViewDataSource, UICollectionViewDelegate,waterFlowDelegate>
@property (nonatomic, weak) UICollectionView *collectionView;
@property(nonatomic,strong) NSMutableArray *muArr;
@property(nonatomic,strong) UIView *background;
@property(nonatomic,strong) BeautyModelBeautyModel *BeautyModel;
@property (nonatomic,assign) NSInteger page;
@property (nonatomic,strong) NSString *updateTime;
@property (nonatomic,strong) NSString *lastestView;


@end

@implementation BeautyViewController

static NSString * const BeautyId = @"beauty";

- (void)viewDidLoad {
    [super viewDidLoad];
    self.title = @"美女";
    [self requestData];
    [self initUI];

}
-(void)viewWillAppear:(BOOL)animated
{
    ((AppDelegate *)([UIApplication sharedApplication].delegate)).mainTabble.tabBar.hidden = YES;
    self.lastestView = [self getCurrentTime];
    self.updateTime = @"-1";
}
//获取当前时间
-(NSString *)getCurrentTime
{
    NSDateFormatter *formatter = [[NSDateFormatter alloc]init];
    [formatter setDateFormat:@"yyyy-MM-dd HH:mm:ss"];
    NSString *dateTime = [formatter stringFromDate:[NSDate date]];
    return dateTime;
}
-(void)requestData
{
    NSString *UrlStr = [NSString stringWithFormat:@"http://120.55.151.67/weibofun/weibo_list.php?apiver=20100&category=weibo_girls&page=%ld&page_size=30&max_timestamp=%@&latest_viewed_ts=%@&platform=iphone&appver=2.1&buildver=2010005&udid=3541CD2F-C590-4A66-A77D-44EB7616316C&sysver=9.3.3",self.page,self.updateTime,self.lastestView];
    //转化一下,不然返回的data无法解析
    UrlStr = [UrlStr stringByAddingPercentEncodingWithAllowedCharacters:[NSCharacterSet characterSetWithCharactersInString:@"`#%^{}\"[]|\\<> "].invertedSet];
    [NetWorkRequest requestWithMethod:GET URL:UrlStr para:nil success:^(NSData *data) {
        if (data) {
            NSDictionary *dic = [NSJSONSerialization JSONObjectWithData:data options:0 error:nil];
            // NSLog(@"dic======%@",dic);
            self.BeautyModel = [BeautyModelBeautyModel modelObjectWithDictionary:dic];
            //取出最后一个图片的时间戳,加载更多的时候需要
            BeautyModelItems *model1 =  [self.BeautyModel.items lastObject];
            self.updateTime = model1.updateTime;
            [self.muArr addObjectsFromArray:self.BeautyModel.items];
             //   NSLog(@"<<<<<<<1&&& = %ld",self.BeautyModel.items.count);
            dispatch_async(dispatch_get_main_queue(), ^{
                [_collectionView reloadData];
                [_collectionView.mj_footer endRefreshing];
            });
        }
        
    } error:^(NSError *error) {
        NSLog(@"error===%@",error);
    } view:self.view];
    
}


//加载数据
-(void)initUI{

    //创建flowLayout
    waterFlow *flowLayout = [[waterFlow alloc]init];
    
    CGFloat w = (SWidth - 40)/3;
    flowLayout.itemSize = CGSizeMake(w, w);
    flowLayout.sectionInset = UIEdgeInsetsMake(10, 10, 10, 10);
    flowLayout.minimumInteritemSpacing = 10;
    //显示列数
    flowLayout.numberOfcolums = 3 ;
    //创建collectView
    UICollectionView *collectView = [[UICollectionView alloc]initWithFrame:CGRectMake(0, 64, SWidth, SHeight - 64) collectionViewLayout:flowLayout];
    collectView.dataSource = self;
    collectView.delegate = self;
    flowLayout.delegate = self;
    [self.view addSubview:collectView];
    collectView.backgroundColor = [UIColor blackColor];
    
    UINib *nib = [UINib nibWithNibName:@"BeautyCell" bundle:[NSBundle mainBundle]];
    [collectView registerNib:nib forCellWithReuseIdentifier:BeautyId];
    self.collectionView = collectView;
    
    //上提加载更多
    _collectionView.mj_footer = [MJRefreshAutoNormalFooter footerWithRefreshingBlock:^{
        // 进入刷新状态后会自动调用这个block
        //最新
        self.page ++;
        self.lastestView = @"-1";
        [self requestData];
    }];
    
}
-(CGFloat)heightForIndex:(NSIndexPath *)indexpath
{
    BeautyModelItems *model1 =  self.muArr[indexpath.row];
    CGFloat currentW = (SWidth - 40)/3;
    CGFloat picH = [model1.wpicMHeight floatValue];
    CGFloat picW = [model1.wpicMWidth floatValue];
    if (picW != 0) {
        CGFloat currentH = picH/picW *currentW;
        return currentH;
    }

    return 0;
}

//cell个数
-(NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section
{

    return self.muArr.count;
    
}

-(UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath
{
    BeautyCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:BeautyId forIndexPath:indexPath];
    BeautyModelItems *model1 =  self.muArr[indexPath.row];
    cell.img.layer.cornerRadius = 4;
    cell.img.layer.borderWidth = 2;
    cell.img.layer.masksToBounds = YES;
    cell.img.layer.borderColor = [[UIColor whiteColor] CGColor];
    [cell.img sd_setImageWithPreviousCachedImageWithURL:[NSURL URLWithString:model1.wpicMiddle] placeholderImage:[UIImage imageNamed:@"占位图"] options:0 progress:nil completed:nil];
    //[cell.img sd_setImageWithURL:[NSURL URLWithString:model1.wpicMiddle]];
   
//    //时间戳
//    NSTimeInterval time=[model1.updateTime doubleValue]+28800;//因为时差问题要加8小时 == 28800 sec
//    NSDate*detaildate=[NSDate dateWithTimeIntervalSince1970:time];
//    NSLog(@"date:%@",[detaildate description]);
//    //实例化一个NSDateFormatter对象
//    NSDateFormatter*dateFormatter = [[NSDateFormatter alloc]init];
//    //设定时间格式,这里可以设置成自己需要的格式
//    [dateFormatter setDateFormat:@"yyyy-MM-dd HH:mm"];
//    NSString*currentDateStr = [dateFormatter stringFromDate:detaildate];
//    //    NSLog(@"date:%@",dateFormatter);

    return cell;
}

-(void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath
{
    //创建一个黑色背景
    //初始化一个用来当做背景的View。
    UIView *bgView = [[UIView alloc]initWithFrame:CGRectMake(0, 64, SWidth, SHeight - 64)];
    self.background = bgView;
    [bgView setBackgroundColor:[UIColor blackColor]];
    [self.view addSubview:bgView];

    //创建显示图像的视图
 
    BeautyModelItems *model1 =  self.muArr[indexPath.row];
    CGFloat picH = [model1.wpicMHeight floatValue];
    CGFloat picW = [model1.wpicMWidth floatValue];
    CGFloat hight = SWidth / picW * picH;
    UIImageView *imgView = [[UIImageView alloc] initWithFrame:CGRectMake(0, (SHeight - hight)/2 - 32, SWidth, hight)];
    

    
    //要显示的图片，即要放大的图片


    [imgView sd_setImageWithURL:[NSURL URLWithString:model1.wpicMiddle]];
    [bgView addSubview:imgView];
    
    //下载按钮
    UIButton *download = [[UIButton alloc]initWithFrame:CGRectMake(40, SHeight - 150, 50, 80)];
    [download setTitle:@"下载" forState:UIControlStateNormal];
    [download addTarget:self action:@selector(downloadHandle) forControlEvents:UIControlEventTouchUpInside];
    [bgView addSubview:download];
    
    imgView.userInteractionEnabled = YES;
    //添加点击手势（即点击图片后退出全屏）

    UITapGestureRecognizer *tapGesture = [[UITapGestureRecognizer alloc]initWithTarget:self action:@selector(closeView)];
    [imgView addGestureRecognizer:tapGesture];
    [self shakeToShow:bgView];//放大过程中的动画
}

-(void)closeView{
    [self.background removeFromSuperview];
    [_collectionView reloadData];
}
//放大过程中出现的缓慢动画
- (void) shakeToShow:(UIView*)aView{
    CAKeyframeAnimation* animation = [CAKeyframeAnimation animationWithKeyPath:@"transform"];
    animation.duration = 0.5;
    NSMutableArray *values = [NSMutableArray array];
    [values addObject:[NSValue valueWithCATransform3D:CATransform3DMakeScale(0.1, 0.1, 1.0)]];
    [values addObject:[NSValue valueWithCATransform3D:CATransform3DMakeScale(1.0, 1.0, 1.0)]];
    animation.values = values;
    [aView.layer addAnimation:animation forKey:nil];
}

-(void)downloadHandle
{
    
}

//懒加载
-(NSMutableArray *)muArr
{
    if (_muArr == nil) {
        _muArr = [NSMutableArray array];
    }
    return _muArr;
}

@end
