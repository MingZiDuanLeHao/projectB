//
//  VedioDetailController.h
//  ProjectB
//
//  Created by lanou on 2016/10/14.
//  Copyright © 2016年 lanou. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "BarButtomViewController.h"


@interface VedioDetailController : BarButtomViewController
/**index*/
@property(nonatomic,assign) NSInteger index;
@property(nonatomic,strong) NSDictionary *hightDic;
@property(nonatomic,strong) NSString *vedioUrl;
@property(nonatomic,strong) NSString *imgUrl;
@property(nonatomic,strong) NSString *groupID;
@property(nonatomic,assign) NSInteger vedioHight;
@property(nonatomic,strong) NSString *content;
@property(nonatomic,assign) CGRect contentRect;

@end
