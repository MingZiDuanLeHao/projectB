//
//  waterFlow.h
//  ui_自定义瀑布流
//
//  Created by lanou on 16/8/4.
//  Copyright © 2016年 sh. All rights reserved.
//

#import <UIKit/UIKit.h>

@protocol waterFlowDelegate <NSObject>

-(CGFloat)heightForIndex:(NSIndexPath *)indexpath;

@end
@interface waterFlow : UICollectionViewLayout

/**item大小*/
@property(nonatomic,assign) CGSize itemSize;

/**内间距*/
@property(nonatomic,assign) UIEdgeInsets sectionInset;

/**item的间距*/
@property(nonatomic,assign) CGFloat minimumInteritemSpacing;

/**列数*/
@property(nonatomic,assign) NSInteger numberOfcolums;

/**代理*/
@property(nonatomic,assign) id<waterFlowDelegate> delegate;

@end
