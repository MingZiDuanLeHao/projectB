//
//  BeautyCell.h
//  ProjectB
//
//  Created by lanou on 2016/10/8.
//  Copyright © 2016年 lanou. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "imageModel.h"
@interface BeautyCell : UICollectionViewCell
@property (weak, nonatomic) IBOutlet UIImageView *img;
@property(nonatomic,strong) imageModel *model;

@end
