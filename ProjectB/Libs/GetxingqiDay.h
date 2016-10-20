//
//  GetxingqiDay.h
//  ProjectB
//
//  Created by 瓶子 on 2016/10/13.
//  Copyright © 2016年 lanou. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface GetxingqiDay : NSObject

+(instancetype)defaultDay;
- (NSString *)featureWeekdayWithDate:(NSString *)featureDate;
@end
