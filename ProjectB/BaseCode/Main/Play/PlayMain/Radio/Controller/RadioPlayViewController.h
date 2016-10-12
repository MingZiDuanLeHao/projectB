//
//  RadioPlayViewController.h
//  ProjectB
//
//  Created by 瓶子 on 2016/10/9.
//  Copyright © 2016年 lanou. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "RadioDetailListAlbum.h"
#import "BarButtomViewController.h"

@interface RadioPlayViewController : BarButtomViewController
//@property(nonatomic,strong)NSString *trackID;
//@property(nonatomic,strong)NSString *nickName;
//@property(nonatomic,strong)NSString *smallLogo;
//@property(nonatomic,strong)NSString *coverURL;
//@property(nonatomic,strong)NSString *playURL;
@property(nonatomic,assign)NSInteger selectIndex;
@property(nonatomic,strong)NSMutableArray *musicArray;
@property(nonatomic,strong)RadioDetailListAlbum *album;
@end
