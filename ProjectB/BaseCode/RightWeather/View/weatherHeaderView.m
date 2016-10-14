//
//  weatherHeaderView.m
//  ProjectB
//
//  Created by 瓶子 on 2016/10/14.
//  Copyright © 2016年 lanou. All rights reserved.
//

#import "weatherHeaderView.h"
#import "WeherCollectionViewCell.h"

@interface weatherHeaderView ()<UICollectionViewDataSource,UICollectionViewDelegate>

@end

@implementation weatherHeaderView

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/
-(void)awakeFromNib
{
    
    //collectionView
    UICollectionViewFlowLayout *flowLayout = [[UICollectionViewFlowLayout alloc]init];
    //设置每个Item的大小
    flowLayout.itemSize = CGSizeMake(60, 89);
    
    //设置每个Item的间距(默认是10)
    flowLayout.minimumInteritemSpacing = 200;
    
    //设置每个Item的行间距(默认是10)
    flowLayout.minimumLineSpacing = (280 - 60*3 - 50)/2 ;
    
    //设置collection的Item距离屏幕上左下右间距
    flowLayout.sectionInset = UIEdgeInsetsMake(10, 25, 10, 25);
    
    //滑动方向
    flowLayout.scrollDirection = UICollectionViewScrollDirectionHorizontal ;
    
    _sevenDayCollView.collectionViewLayout = flowLayout;
    [_sevenDayCollView registerNib:[UINib nibWithNibName:@"WeherCollectionViewCell" bundle:nil] forCellWithReuseIdentifier:@"WeherCollectionViewCell"];
    _sevenDayCollView.backgroundColor = [UIColor clearColor];
    _sevenDayCollView.showsHorizontalScrollIndicator = NO;
    
    _sevenDayCollView.delegate = self;
    _sevenDayCollView.dataSource =self;
    
}


#pragma mark collectionView

//每区的cell个数
-(NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section
{
    return _dailyArr.count - 1;
}
//区数
-(NSInteger)numberOfSectionsInCollectionView:(UICollectionView *)collectionView
{
    return 1;
}

//返回cell
-(UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath
{
    WeherCollectionViewCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:@"WeherCollectionViewCell" forIndexPath:indexPath];
    cell.model = _dailyArr[indexPath.row + 1];
    cell.backgroundColor = [UIColor clearColor];
    
    return cell;
}

#pragma mark lazy Load
-(NSArray *)dailyArr
{
    if (!_dailyArr) {
        _dailyArr = [NSArray array];
    }
    return _dailyArr;
}

@end
