//
//  NetWorkRequest.m
//  抽屉效果demo
//
//  Created by 瓶子 on 16/9/12.
//  Copyright © 2016年 GZ_lanou. All rights reserved.
//

#import "NetWorkRequest.h"

@implementation NetWorkRequest

+(void)requestWithMethod:(RequestType)method URL:(NSString *)requestURL para:(NSDictionary
                                                                              *)paraDic success:(success)suc error:(fail)failerror view:(UIView *)view
{
    //判断网络,显示HUD,呈现加载,没有网络直接return
    MBProgressHUD *hud = [MBProgressHUD showHUDAddedTo:view animated:YES];
    hud.label.text = NSLocalizedString(@"Loading...", @"HUD loading title");
    
    NSURLSession *session = [NSURLSession sharedSession];
    NSMutableURLRequest *request = [NSMutableURLRequest requestWithURL:[NSURL URLWithString:requestURL]];
    if (method == POST) {
        request.HTTPMethod = @"POST";
        NSData *Data= [NSJSONSerialization dataWithJSONObject:paraDic options:NSJSONWritingPrettyPrinted error:nil];
        request.HTTPBody = Data;
    }
    NSURLSessionTask *task = [session dataTaskWithRequest:request completionHandler:^(NSData * _Nullable data, NSURLResponse * _Nullable response, NSError * _Nullable error) {
        if (data) {
            //HUD 取消
            dispatch_async(dispatch_get_main_queue(), ^{
                
                [hud hideAnimated:YES];
                
            });
            
            suc(data);
        }
        else
        {
            //取消 给用户提示
            failerror(error);
            dispatch_async(dispatch_get_main_queue(), ^{
                
                [hud hideAnimated:YES];
                
            });
        }
    }];
    [task resume];
    
}
@end
