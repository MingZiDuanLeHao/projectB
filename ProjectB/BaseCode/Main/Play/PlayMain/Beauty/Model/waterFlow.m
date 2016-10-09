//
//  waterFlow.m
//  ui_自定义瀑布流
//
//  Created by lanou on 16/8/4.
//  Copyright © 2016年 sh. All rights reserved.
//

#import "waterFlow.h"

@interface waterFlow ()

/** 获取item的总数 */
@property(nonatomic,assign) NSInteger numberOfItems;

/** 数组用来保存每一列的高度 */
@property(nonatomic,strong) NSMutableArray *columnHeights;

/** 用来保存每一个计算好的item的属性(x,y,wight,height) */
@property(nonatomic,strong) NSMutableArray *itemAttributes;

/** 保存每一个item的X值 */
@property(nonatomic,assign) CGFloat detalX;

/** 保存每一个item的y值 */
@property(nonatomic,assign) CGFloat detalY;


/** 用来计算最短的列 */
@property(nonatomic,assign) NSInteger shortsIndex;


/** 获取最长列的索引 */
-(NSInteger)p_indexForLongColumn;

/** 获取最短列的索引 */
-(NSInteger)p_indexForShortColumn;
@end

@implementation waterFlow


/** 懒加载 */
-(NSMutableArray *)columnHeights
{
    if (_columnHeights == nil) {
        self.columnHeights = [NSMutableArray array];
    }
    return _columnHeights;
}
/** 懒加载 */
-(NSMutableArray *)itemAttributes
{
    if (_itemAttributes == nil) {
        self.itemAttributes = [NSMutableArray array];
    }
    return _itemAttributes;
}

/** 获取最长列的索引 */
-(NSInteger)p_indexForLongColumn
{
    //记录哪一列最长
    NSInteger longIndex = 0;
    
    //记录当前最长高度
    CGFloat longsHeight = 0;
    
    for (int i = 0; i < self.numberOfcolums; i++) {
        //获取高度
        CGFloat currentHeight = [self.columnHeights[i] floatValue];
        //判断选出最长的高度
        if (currentHeight > longsHeight) {
            longsHeight  = currentHeight;
            longIndex = i ;
        }
    }
    return longIndex;
}

/** 获取最短列的索引 */
-(NSInteger)p_indexForShortColumn
{
    //记录索引
    NSInteger shortIndex = 0 ;
    //记录最小值
    CGFloat shortHeight  = MAXFLOAT;
    for (int i = 0; i <self.numberOfcolums; i++) {
        //获取高度
        CGFloat currentHeight = [self.columnHeights[i] floatValue];
        if (currentHeight < shortHeight) {
            shortHeight  = currentHeight;
            shortIndex = i ;
        }
      
    }
      return shortIndex;
}

/** 给每一列添加高度 top */
-(void)addHeightWithColumns
{
    for (int i = 0; i <self.numberOfcolums; i++) {
        self.columnHeights[i] = @(self.sectionInset.top);
    }
}

/** 查找最短的列 并且设置相关属性 */
-(void)searchShortColumns
{
    //获取最短列
    self.shortsIndex = [self p_indexForShortColumn];
    //接受最短列的高度
    CGFloat shortHeight = [self.columnHeights[self.shortsIndex] floatValue];
    
    //计算X值 :内边距left + (item宽 +item间距)*索引
    self.detalX = self.sectionInset.left + (self.itemSize.width + self.minimumInteritemSpacing) * _shortsIndex;
    //计算Y值
    self.detalY = shortHeight + self.minimumInteritemSpacing;
}

/** 设置属性和frame */

-(void)setFrame :(NSIndexPath *) indexPath{
    //设置属性
    UICollectionViewLayoutAttributes *layoutArr = [UICollectionViewLayoutAttributes layoutAttributesForCellWithIndexPath:indexPath];
    //保存item的高
    CGFloat itemHeight = 0;
    if ([self.delegate respondsToSelector:@selector(heightForIndex:)]) {
        itemHeight = [_delegate heightForIndex:indexPath];
    }
    //设置frame
    layoutArr.frame = CGRectMake(_detalX, _detalY, self.itemSize.width, itemHeight);
    //放入数组
    [self.itemAttributes addObject:layoutArr];
    //更新高度
    self.columnHeights[_shortsIndex] = @(_detalY + itemHeight);
}

-(void)prepareLayout{
    //调用父类的布局
    [super prepareLayout];
    [self addHeightWithColumns];
    //获取item数量
    self.numberOfItems = [self.collectionView numberOfItemsInSection:0];
    
    //再为每一个item设置frame的indexPath
    for (int i = 0; i <self.numberOfItems; i++) {
        //先查找最短的列 设置相关属性
        [self searchShortColumns];
        NSIndexPath *indexPath = [NSIndexPath indexPathForItem:i inSection:0];
        [self setFrame:indexPath];
    }
    
}

/** 计算conllectionView的大小 */

-(CGSize)collectionViewContentSize
{
    //获取最长高度的索引
    NSInteger longsIndex = [self p_indexForLongColumn];
    //通过索引获取高度
    CGFloat longH = [self.columnHeights[longsIndex] floatValue];
    
    //获取contentsize
    CGSize contentSize = self.collectionView.frame.size;
    //设置最大高度 + 下
    contentSize.height = longH + self.sectionInset.bottom;
    return contentSize;
}

/**
 *  返回每一个item的attribute
 */

-(NSArray<UICollectionViewLayoutAttributes *> *)layoutAttributesForElementsInRect:(CGRect)rect
{
    return  self.itemAttributes;
}
@end
