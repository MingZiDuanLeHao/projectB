//
//  VedioDetailController.h
//  ProjectB
//
//  Created by lanou on 2016/10/14.
//  Copyright © 2016年 lanou. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface VedioDetailController : UIViewController
/**index*/
@property(nonatomic,assign) NSInteger index;
@property(nonatomic,strong) NSMutableArray *dataArray;
@property(nonatomic,strong) NSMutableArray *hightArray;
@property(nonatomic,strong) NSString *vedioUrl;
@property(nonatomic,strong) NSString *groupID;


@end
