//
//  POContentView.h
//  pyyx
//
//  Created by xulinfeng on 16/9/21.
//  Copyright © 2016年 Chunlin Ma. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "POPopupOverlayer.h"
#import "PictureDataModels.h"

@interface POContentView : UIView
@property (nonatomic, strong) POPopupOverlayer *popupOverlayer;
@property (nonatomic, strong) UIButton *GodReviewButton;

@property (nonatomic, strong) UIButton *leftButton;
@property (nonatomic, strong) UIButton *rightButton;

@property (nonatomic, strong) UILabel *labelContent;
@property (nonatomic, strong) UIImageView *imgView;

@property (nonatomic, strong) NSMutableArray *dataSource;
@property (nonatomic, strong) UIScrollView *scroll;
@property (nonatomic, strong) UIView *background;
@property (nonatomic, assign) NSInteger index;
@property (nonatomic, assign) NSInteger index1;
@property (nonatomic, strong) PictureModelPictureModel *PictureModel;
@end
