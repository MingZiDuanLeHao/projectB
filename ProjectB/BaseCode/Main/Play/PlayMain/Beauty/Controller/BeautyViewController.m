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
#import "BeautyCell.h"
#import "imageModel.h"
#import "UIImageView+WebCache.h"
#import "AppDelegate.h"

@interface BeautyViewController ()<UICollectionViewDataSource, UICollectionViewDelegate,waterFlowDelegate>
@property (nonatomic, weak) UICollectionView *collectionView;
@property(nonatomic,strong) NSMutableArray *muArr;
@property(nonatomic,strong) UIView *background;


@end

@implementation BeautyViewController

static NSString * const BeautyId = @"beauty";

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    [self loadData];
}
-(void)viewWillAppear:(BOOL)animated
{
    ((AppDelegate *)([UIApplication sharedApplication].delegate)).mainTabble.tabBar.hidden = YES;
}

//加载数据
-(void)loadData{
    //导入文件
    NSString *path = [[NSBundle mainBundle]pathForResource:@"Data" ofType:@"json"];
    NSData *data = [NSData dataWithContentsOfFile:path];
    
    if (data != nil) {
        //数组接收
        NSArray *dataArr = [NSJSONSerialization JSONObjectWithData:data options:NSJSONReadingAllowFragments error:nil];
        //
        for (NSDictionary *dic in dataArr)
        {
            imageModel *model = [[imageModel alloc]init];
            [model setValuesForKeysWithDictionary:dic];
            [self.muArr addObject:model];
        }
        
    }
    
    
    //创建flowLayout
    waterFlow *flowLayout = [[waterFlow alloc]init];
    
    CGFloat w = (SWidth - 40)/3;
    flowLayout.itemSize = CGSizeMake(w, w);
    flowLayout.sectionInset = UIEdgeInsetsMake(10, 10, 10, 10);
    flowLayout.minimumInteritemSpacing = 10;
    //显示列数
    flowLayout.numberOfcolums = 3 ;
    //创建collectView
    UICollectionView *collectView = [[UICollectionView alloc]initWithFrame:[UIScreen mainScreen].bounds collectionViewLayout:flowLayout];
    collectView.dataSource = self;
    collectView.delegate = self;
    flowLayout.delegate = self;
    [self.view addSubview:collectView];
    collectView.backgroundColor = [UIColor lightGrayColor];
    
    UINib *nib = [UINib nibWithNibName:@"BeautyCell" bundle:[NSBundle mainBundle]];
    [collectView registerNib:nib forCellWithReuseIdentifier:BeautyId];
    
}
-(CGFloat)heightForIndex:(NSIndexPath *)indexpath
{
    imageModel *model1 =  self.muArr[indexpath.item];
    CGFloat currentW = (SWidth - 40)/3;
    CGFloat currentH = model1.height/model1.width *currentW;
    return currentH;
}

//cell个数
-(NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section
{
    
    NSLog(@"&&& = %ld",_muArr.count);
    return _muArr.count;
    
}

-(UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath
{
    BeautyCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:BeautyId forIndexPath:indexPath];
    cell.model = self.muArr[indexPath.row];
    return cell;
}

-(void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath
{
    //创建一个黑色背景
    //初始化一个用来当做背景的View。我这里为了省时间计算，宽高直接用的5s的尺寸
    UIView *bgView = [[UIView alloc]initWithFrame:CGRectMake(0, 64, SWidth, SHeight - 64)];
    self.background = bgView;
    [bgView setBackgroundColor:[UIColor blackColor]];
    [self.view addSubview:bgView];
    
    //创建显示图像的视图
 
    imageModel *model = self.muArr[indexPath.row];
    CGFloat hight = SWidth / model.width * model.height;
    UIImageView *imgView = [[UIImageView alloc] initWithFrame:CGRectMake(0, (SHeight - hight)/2 - 32, SWidth, hight)];
    

    
    //要显示的图片，即要放大的图片


    [imgView sd_setImageWithURL:[NSURL URLWithString:model.thumbURL]];
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
