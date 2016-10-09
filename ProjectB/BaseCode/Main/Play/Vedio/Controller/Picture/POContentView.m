//
//  POContentView.m
//  pyyx
//
//  Created by xulinfeng on 16/9/21.
//  Copyright © 2016年 Chunlin Ma. All rights reserved.
//

#import "POContentView.h"
#import "POPopupOverlayer.h"

@interface POContentView ()<POPopupOverlayerDelegate, POPopupOverlayerDataSource,UIScrollViewDelegate>

@property (nonatomic, strong) POPopupOverlayer *popupOverlayer;


@property (nonatomic, strong) UIButton *insertButton;
@property (nonatomic, strong) UIButton *deleteButton;

@property (nonatomic, strong) NSMutableArray *dataSource;
@property (nonatomic, strong) UIScrollView *scroll;
@property(nonatomic,strong) UIView *background;

@end

@implementation POContentView

- (instancetype)initWithFrame:(CGRect)frame{
    if (self = [super initWithFrame:frame]) {
        
        [self _createSubviews];
        [self _configurateSubviewsDefault];
    }
    return self;
}

-(UIScrollView *)scroll
{
    if (!_scroll) {
        _scroll = [[UIScrollView alloc]init];
    }
    return _scroll;
}


- (void)layoutSubviews{
    [super layoutSubviews];
    

    
    self.insertButton.frame = CGRectMake(24, 400, 48, 48);
    self.deleteButton.frame = CGRectMake(CGRectGetWidth([self bounds]) - 24 - 48, 400, 48, 48);
    
    self.popupOverlayer.frame = CGRectMake(CGRectGetWidth([self bounds]) / 2. - 167/2., 150, 167, 167);
    self.popupOverlayer.userInteractionEnabled = YES;
    //增加图片点击放大手势
//    [self.popupOverlayer addGestureRecognizer:[[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(tapAction)]];
    self.scroll.frame = CGRectMake(0, SHeight, SWidth, SHeight);
    self.scroll.delegate = self;
    self.scroll.backgroundColor = [UIColor redColor];
    _scroll.contentSize = CGSizeMake(SWidth, SHeight - 200);

    UITapGestureRecognizer *tapGesture = [[UITapGestureRecognizer alloc]initWithTarget:self action:@selector(tapAction)];
    [_popupOverlayer addGestureRecognizer:tapGesture];
}

-(void)tapAction
{
    //创建一个黑色背景scroll
    [self.scroll setBackgroundColor:[UIColor blackColor]];
    [self addSubview:_scroll];
    
    //创建显示图像的视图
    //初始化要显示的图片内容的imageView（这里位置继续偷懒...没有计算）
    UIImageView *imgView = [[UIImageView alloc] initWithFrame:CGRectMake(0, 64, SWidth, SHeight)];
    //要显示的图片，即要放大的图片
    [imgView setImage:[UIImage imageNamed:@"列表"]];
    [_scroll addSubview:imgView];
    
    imgView.userInteractionEnabled = YES;
    //添加点击手势（即点击图片后退出全屏）
    UITapGestureRecognizer *tapGesture = [[UITapGestureRecognizer alloc]initWithTarget:self action:@selector(closeView)];
    [imgView addGestureRecognizer:tapGesture];
    
    [self shakeToShow:(UIView *)_scroll];//放大过程中的动画
  
}

-(void)closeView{
    [_background removeFromSuperview];
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

#pragma mark - private

- (void)_createSubviews{
    
    self.popupOverlayer = [POPopupOverlayer new];
    self.insertButton = [UIButton new];
    self.deleteButton = [UIButton new];
    
    [self addSubview:[self insertButton]];
    [self addSubview:[self deleteButton]];
    [self addSubview:[self popupOverlayer]];
}

- (void)_configurateSubviewsDefault{
    
    self.dataSource = [NSMutableArray arrayWithObjects:@"", @"", @"", @"", @"", @"", @"", nil];
    
    self.popupOverlayer.delegate = self;
    self.popupOverlayer.dataSource = self;
    self.popupOverlayer.maxTranslation = CGSizeMake(160, 160);
    self.popupOverlayer.itemViewRotateAngle = 5/180.f * M_PI;
    
    
    self.insertButton.titleLabel.font = [UIFont systemFontOfSize:15];
    self.insertButton.layer.cornerRadius = 48/2.;
    self.insertButton.layer.borderWidth = 1.f;
    self.insertButton.layer.borderColor = [[UIColor whiteColor] CGColor];
    [[self insertButton] setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
    [[self insertButton] setTitle:@"神评" forState:UIControlStateNormal];
    [[self insertButton] addTarget:self action:@selector(didClickInsert:) forControlEvents:UIControlEventTouchUpInside];
    
    
    self.deleteButton.titleLabel.font = [UIFont systemFontOfSize:15];
    self.deleteButton.layer.cornerRadius = 48/2.;
    self.deleteButton.layer.borderWidth = 1.f;
    self.deleteButton.layer.borderColor = [[UIColor redColor] CGColor];
    [[self deleteButton] setTitleColor:[UIColor redColor] forState:UIControlStateNormal];
    [[self deleteButton] setTitle:@"更多" forState:UIControlStateNormal];
    [[self deleteButton] addTarget:self action:@selector(didClickDelete:) forControlEvents:UIControlEventTouchUpInside];
    
    [[self popupOverlayer] reloadData];
}

#pragma mark - POPopupOverlayerDelegate, POPopupOverlayerDataSource

- (NSInteger)numberOfItemsInPopupOverlayerView:(POPopupOverlayer *)popupOverlayer;{
    return [[self dataSource] count];
}

- (NSInteger)numberOfVisibleItemsInPopupOverlayerView:(POPopupOverlayer *)popupOverlayer;{
    return 3;
}

- (CGSize)popupOverlayer:(POPopupOverlayer *)popupOverlayer sizeForItemAtIndex:(NSUInteger)nIndex;{
    return CGSizeMake(300, 300);
}

- (UIView *)popupOverlayer:(POPopupOverlayer *)popupOverlayer viewForItemAtIndex:(NSUInteger)nIndex reusingView:(UIView *)view;{
    if (!view) {
        view = [UIView new];
    }
    view.layer.cornerRadius = 4;
    view.layer.borderWidth = 2;
    view.layer.masksToBounds = YES;
    view.layer.borderColor = [[UIColor whiteColor] CGColor];
    view.backgroundColor = [UIColor colorWithRed:(arc4random()%255)/255.f green:(arc4random()%255)/255.f blue:(arc4random()%255)/255.f alpha:1];
    
    
    return view;
}

- (BOOL)popupOverlayer:(POPopupOverlayer *)popupOverlayer shouldPopupOverItemView:(UIView *)itemView direction:(POPopupOverlayerAnimationDirection)direction atIndex:(NSUInteger)nIndex;{
    return YES;
}



- (void)popupOverlayer:(POPopupOverlayer *)popupOverlayer didMoveItemViewWithTranslation:(CGPoint)translation atIndex:(NSUInteger)nIndex;{

}

- (void)popupOverlayer:(POPopupOverlayer *)popupOverlayer didPopupOverItemViewOnDirection:(POPopupOverlayerAnimationDirection)direction atIndex:(NSUInteger)nIndex;{
}

#pragma mark - actions

- (IBAction)didClickInsert:(id)sender{
    [[self dataSource] insertObject:@"" atIndex:1];
    [[self popupOverlayer] insertItemAtIndex:1 animated:YES];
}

- (IBAction)didClickDelete:(id)sender{
    
    [[self dataSource] removeObjectAtIndex:1];
    [[self popupOverlayer] removeItemAtIndex:1 onDirection:POPopupOverlayerAnimationDirectionBottom animated:YES];
}


@end
