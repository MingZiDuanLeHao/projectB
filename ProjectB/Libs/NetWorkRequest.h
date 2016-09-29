//
//  NetWorkRequest.h
//  抽屉效果demo
//
//  Created by 瓶子 on 16/9/12.
//  Copyright © 2016年 GZ_lanou. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NetWorkRequest : NSObject

//枚举
typedef NS_ENUM(NSInteger, RequestType) {
    GET = 0,
    POST = 1
};

//成功 失败 Block
typedef void(^success)(NSData *data);
typedef void(^fail)(NSError *error);


+(void)requestWithMethod:(RequestType)method URL:(NSString *)requestURL para:(NSDictionary *)paraDic success:(success)suc error:(fail)failerror view:(UIView *)view;


@end
