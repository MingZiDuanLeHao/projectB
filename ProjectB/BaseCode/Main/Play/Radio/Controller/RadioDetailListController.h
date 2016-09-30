//
//  RadioDetailList.h
//  ProjectB
//
//  Created by lanou on 2016/9/29.
//  Copyright © 2016年 lanou. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface RadioDetailListController : UIViewController
@property (weak, nonatomic) IBOutlet UISegmentedControl *segMent;
/**albumId*/
@property(nonatomic,strong) NSString *albumId;
/**statModule*/
@property(nonatomic,strong) NSString *statModule;
/**statEvent*/
@property(nonatomic,strong) NSString *statEvent;
/**主播*/
@property(nonatomic,strong) NSString *titleID;

@property (weak, nonatomic) IBOutlet UIImageView *avatar;
@property (weak, nonatomic) IBOutlet UILabel *titleLabel;
@property (weak, nonatomic) IBOutlet UILabel *nameLabel;
@property (weak, nonatomic) IBOutlet UILabel *playCount;

@end
