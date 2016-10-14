//
//  POContentView.m
//  pyyx
//
//  Created by xulinfeng on 16/9/21.
//  Copyright © 2016年 Chunlin Ma. All rights reserved.
//

#import "POContentView.h"
#import "POPopupOverlayer.h"
#import "ReuseView.h"
#import "UIImageView+WebCache.h"
#import "SDImageCache.h"

@interface POContentView ()<POPopupOverlayerDelegate, POPopupOverlayerDataSource>
@property (nonatomic,assign) NSInteger page;
@property (nonatomic,strong) NSString *updateTime;
@property (nonatomic,strong) NSString *lastestView;

@end

@implementation POContentView

- (instancetype)initWithFrame:(CGRect)frame{
    if (self = [super initWithFrame:frame]) {
        
        [self _createSubviews];
        [self _configurateSubviewsDefault];
        [self requestData];
        self.lastestView = [self getCurrentTime];
        self.updateTime = @"-1";
    }
    
    return self;
}



- (void)layoutSubviews{
    [super layoutSubviews];
    

    self.leftButton.frame = CGRectMake(24, SHeight - 60, 48, 48);
    self.rightButton.frame = CGRectMake(CGRectGetWidth([self bounds]) - 24 - 48, SHeight - 60, 48, 48);
    
    
    self.popupOverlayer.frame = CGRectMake(CGRectGetWidth([self bounds]) / 2. - 167/2., 150, 167, 167);
    self.popupOverlayer.userInteractionEnabled = YES;
    
    //文章介绍
    self.labelContent.frame = CGRectMake(5, 410, SWidth - 10, SHeight - 420 - 60);
    //文字的边角
    self.labelContent.layer.cornerRadius = 4;
    self.labelContent.layer.borderWidth = 2;
    self.labelContent.layer.masksToBounds = YES;
    self.labelContent.layer.borderColor = [[UIColor whiteColor] CGColor];
    self.labelContent.textAlignment = NSTextAlignmentCenter;
    self.labelContent.backgroundColor = [UIColor lightGrayColor];

    UITapGestureRecognizer *tapGesture = [[UITapGestureRecognizer alloc]initWithTarget:self action:@selector(tapAction)];
    [_popupOverlayer addGestureRecognizer:tapGesture];
    self.scroll = [[UIScrollView alloc]initWithFrame:[UIScreen mainScreen].bounds];

}

//获取当前时间的时间戳
-(NSString *)getCurrentTime
{
    NSDateFormatter *formatter = [[NSDateFormatter alloc]init];
    [formatter setDateFormat:@"yyyy-MM-dd HH:mm:ss"];
    NSString *dateTime = [formatter stringFromDate:[NSDate date]];
        NSLog(@"时间戳%@",dateTime);
    return dateTime;
}

#pragma mark请求数据
-(void)requestData{
    NSString *UrlStr = [NSString stringWithFormat:@"http://120.55.151.67/weibofun/weibo_list.php?apiver=20100&category=weibo_pics&page=%ld&page_size=20&max_timestamp=%@&latest_viewed_ts=%@&platform=iphone&appver=2.1&buildver=2010005&udid=3541CD2F-C590-4A66-A77D-44EB7616316C&sysver=9.3.3",self.page,self.updateTime,self.lastestView];
//    NSLog(@"!!!!!!!!!!!!%@",UrlStr);
    //转化一下,不然返回的data无法解析
    UrlStr = [UrlStr stringByAddingPercentEncodingWithAllowedCharacters:[NSCharacterSet characterSetWithCharactersInString:@"`#%^{}\"[]|\\<> "].invertedSet];
    [NetWorkRequest requestWithMethod:GET URL:UrlStr para:nil success:^(NSData *data) {
        if (data) {
            NSDictionary *dic = [NSJSONSerialization JSONObjectWithData:data options:0 error:nil];
            //   NSLog(@"dic======%@",dic);
            self.PictureModel = [PictureModelPictureModel modelObjectWithDictionary:dic];
        
            
                        //取出最后一个图片的时间戳,加载更多的时候需要
                        PictureModelItems *model1 =  [self.PictureModel.items lastObject];
                        self.updateTime = model1.updateTime;
            
            dispatch_async(dispatch_get_main_queue(), ^{
                [[self popupOverlayer] reloadData];
            });
        }
        
    } error:^(NSError *error) {
        NSLog(@"error===%@",error);
    } view:self];
}

-(void)tapAction
{
    //创建一个背景
    self.background = [UIView new];
    _background.frame = CGRectMake(0, 0, SWidth, SHeight);
   // _background.backgroundColor = [UIColor redColor];
    [self.scroll setBackgroundColor:[UIColor blackColor]];

    [_background addSubview:_scroll];
    [self addSubview:_background];
    
    //创建显示图像的视图
    //初始化要显示的图片内容的imageView
    UIImageView *imgView = [[UIImageView alloc] initWithFrame:CGRectMake(0, 0, SWidth, SHeight)];
    //要显示的图片，即要放大的图片
    PictureModelItems *model1 =  self.PictureModel.items[self.index - 2];
    CGFloat picH = [model1.wpicMHeight floatValue];
    CGFloat picW = [model1.wpicMWidth floatValue];
    CGFloat hight = SWidth / picW * picH;

    _scroll.contentSize = CGSizeMake(SWidth, hight);
        if (hight >= SHeight) {
        imgView.frame = CGRectMake(0, 0 , SWidth, hight);

        }else{
            imgView.frame = CGRectMake(0, (SHeight - hight)/2  , SWidth, hight);

        }
    
    [imgView sd_setImageWithURL:[NSURL URLWithString:model1.wpicMiddle]];

    [_scroll addSubview:imgView];
    imgView.userInteractionEnabled = YES;
    
    //取得当前控制器,为了隐藏导航控制器
    UIViewController *vc;
    for (UIView* next = [self superview]; next; next = next.superview) {
        UIResponder* nextResponder = [next nextResponder];
        if ([nextResponder isKindOfClass:[objc_getClass("UIViewController") class]] ) {
            vc=(UIViewController*)nextResponder;
            
            vc.navigationController.navigationBar.hidden = YES;
        }
    }
    

    //添加点击手势（即点击图片后退出全屏）
    UITapGestureRecognizer *tapGesture = [[UITapGestureRecognizer alloc]initWithTarget:self action:@selector(closeView)];
    [_background addGestureRecognizer:tapGesture];
    
    [self shakeToShow:(UIView *)_scroll];//放大过程中的动画
  
}

-(void)closeView{
    [_background removeFromSuperview];
    //取得当前控制器,为了再显示导航控制器
    UIViewController *vc;
    for (UIView* next = [self superview]; next; next = next.superview) {
        UIResponder* nextResponder = [next nextResponder];
        if ([nextResponder isKindOfClass:[objc_getClass("UIViewController") class]] ) {
            vc=(UIViewController*)nextResponder;
            
            vc.navigationController.navigationBar.hidden = NO;
        }
    }
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
    self.leftButton = [UIButton new];
    self.rightButton = [UIButton new];
    self.labelContent = [UILabel new];
 
    [self addSubview:[self leftButton]];
    [self addSubview:[self rightButton]];
    [self addSubview:[self labelContent]];
    self.labelContent.numberOfLines = 0;
    [self addSubview:[self popupOverlayer]];
}

- (void)_configurateSubviewsDefault{
    
    self.dataSource = [NSMutableArray arrayWithObjects:@"0", @"1", @"2", @"3", @"4", @"5", @"6",@"7",@"8", @"9", @"10", @"11", @"12", @"13", @"14",@"15", @"16", @"17", @"18",@"19",nil];
    
    self.popupOverlayer.delegate = self;
    self.popupOverlayer.dataSource = self;
    self.popupOverlayer.maxTranslation = CGSizeMake(160, 160);
    self.popupOverlayer.itemViewRotateAngle = 5/180.f * M_PI;
    
    //左滑消失
    self.leftButton.titleLabel.font = [UIFont systemFontOfSize:24];
    self.leftButton.layer.cornerRadius = 48/2.;
    self.leftButton.layer.borderWidth = 1.f;
    self.leftButton.layer.borderColor = [[UIColor blackColor] CGColor];
    [[self leftButton] setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
    [[self leftButton] setTitleColor:[UIColor whiteColor] forState:UIControlStateHighlighted];
    [[self leftButton] setTitle:@"L" forState:UIControlStateNormal];
    [[self leftButton] addTarget:self action:@selector(didClickleft:) forControlEvents:UIControlEventTouchUpInside];
    
    //右划消失
    self.rightButton.titleLabel.font = [UIFont systemFontOfSize:24];
    self.rightButton.layer.cornerRadius = 48/2.;
    self.rightButton.layer.borderWidth = 1.f;
    self.rightButton.layer.borderColor = [[UIColor blackColor] CGColor];
    [[self rightButton] setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
    [[self rightButton] setTitleColor:[UIColor whiteColor] forState:UIControlStateHighlighted];
    [[self rightButton] setTitle:@"R" forState:UIControlStateNormal];
    [[self rightButton] addTarget:self action:@selector(didClickright:) forControlEvents:UIControlEventTouchUpInside];
    
    
    
//    [[self popupOverlayer] reloadData];
}
#pragma mark - 清理缓存




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

- (UIView *)popupOverlayer:(POPopupOverlayer *)popupOverlayer viewForItemAtIndex:(NSUInteger)nIndex reusingView:(ReuseView *)view
{
    if (!view) {
           view  = [[NSBundle mainBundle]loadNibNamed:@"ReuseView" owner:nil options:nil][0];

    }

    view.backgroundColor = [UIColor lightGrayColor];
    //图片的边角
    view.layer.cornerRadius = 4;
    view.layer.borderWidth = 2;
    view.layer.masksToBounds = YES;
    view.layer.borderColor = [[UIColor whiteColor] CGColor];
 

        PictureModelItems *model1 =  self.PictureModel.items[nIndex];
    
    //带进度条的img
    __block UIProgressView *pv;
    pv.backgroundColor = [UIColor grayColor];
    pv.progressTintColor = [UIColor greenColor];
    pv.trackTintColor = [UIColor redColor];
    __weak UIImageView *weakImageView = view.img;
    
    [view.img sd_setImageWithURL:[NSURL URLWithString:model1.wpicMiddle]
                placeholderImage:nil
                         options:SDWebImageCacheMemoryOnly
                        progress:^(NSInteger receivedSize, NSInteger expectedSize) {
                            if (!pv) {
                                float showProgress = (float)receivedSize/(float)expectedSize;
                                [pv setProgress:showProgress];
                                [weakImageView addSubview:pv = [UIProgressView.alloc initWithProgressViewStyle:UIProgressViewStyleDefault]];
                                pv.frame = CGRectMake(0, pv.superview.frame.size.height - 20, pv.superview.frame.size.width, 40);
                                [pv setProgress:receivedSize/expectedSize animated:YES];
                            }
                        }
                       completed:^(UIImage *image, NSError *error, SDImageCacheType cacheType, NSURL *imageURL) {
                           [pv removeFromSuperview];
                           pv = nil;
                       }];

//    [view.img sd_setImageWithPreviousCachedImageWithURL:[NSURL URLWithString:model1.wpicMiddle] placeholderImage:[UIImage imageNamed:@"占位图"] options:0 progress:nil completed:nil];
    
    if (nIndex >= 2) {
        PictureModelItems *model1 =  self.PictureModel.items[nIndex - 2];
        self.labelContent.text = model1.wbody;
    }
    
    if (nIndex == 19) {
        //最新
        self.page ++;
        self.lastestView = @"-1";
        [self requestData];
    }
    
    NSUInteger size = [[SDImageCache sharedImageCache] getSize];

   // if (150 < size/1000.0/1000) {
        NSLog(@"缓存大小%fM",size/1000.0/1000);
        [[SDImageCache sharedImageCache]clearMemory];
       // [[SDImageCache sharedImageCache]clearDisk];
   // }


    self.index = nIndex;
    
    return view;
}

- (void)popupOverlayer:(POPopupOverlayer *)popupOverlayer movingItemViewWithTranslation:(CGPoint)translation atIndex:(NSUInteger)nIndex;{
    POPopupOverlayerAnimationDirection direction = [popupOverlayer directionAtTranslation:translation];
    self.leftButton.highlighted = direction & POPopupOverlayerAnimationDirectionLeft;
    self.rightButton.highlighted = direction & POPopupOverlayerAnimationDirectionRight;
}
- (BOOL)popupOverlayer:(POPopupOverlayer *)popupOverlayer shouldPopupOverItemView:(UIView *)itemView direction:(POPopupOverlayerAnimationDirection)direction atIndex:(NSUInteger)nIndex;{
    return YES;
}



- (void)popupOverlayer:(POPopupOverlayer *)popupOverlayer didMoveItemViewWithTranslation:(CGPoint)translation atIndex:(NSUInteger)nIndex;{
    self.leftButton.highlighted = NO;
    self.rightButton.highlighted = NO;

}

- (void)popupOverlayer:(POPopupOverlayer *)popupOverlayer didPopupOverItemViewOnDirection:(POPopupOverlayerAnimationDirection)direction atIndex:(NSUInteger)nIndex;{
    
}

#pragma mark - actions

- (IBAction)didClickGodReview:(id)sender{

//    [[self dataSource] insertObject:@"0" atIndex:0];
//    [[self popupOverlayer] insertItemAtIndex:0 animated:YES];
}


- (IBAction)didClickleft:(id)sender{
//    NSUInteger size = [[SDImageCache sharedImageCache] getSize];
//    NSLog(@"缓存大小%fM",size/1000.0/1000);
//    if (150 < size) {
//        [[SDImageCache sharedImageCache]clearMemory];
//    }
    [[self dataSource] insertObject:@"0" atIndex:0];
    [[self popupOverlayer] insertItemAtIndex:0 animated:YES];
//    [[self popupOverlayer] popOverTopItemViewOnDirection:POPopupOverlayerAnimationDirectionLeft animated:YES];
}

- (IBAction)didClickright:(id)sender{
    [[self popupOverlayer] popOverTopItemViewOnDirection:POPopupOverlayerAnimationDirectionRight animated:YES];
}


@end
