//
//  ToolsHelper.h
//  抽屉效果demo
//
//  Created by 瓶子 on 16/9/12.
//  Copyright © 2016年 GZ_lanou. All rights reserved.
//

#ifndef ToolsHelper_h
#define ToolsHelper_h

//判断字符串是否为空
#define IsEmptyString(str) (([str isKindOfClass:[NSNull class]] || str == nil || [str length]<=0)? YES : NO )

//nslog
//#define NSLog(fmt, ...) NSLog((@"%s [Line %d] " fmt), __PRETTY_FUNCTION__, __LINE__, ##__VA_ARGS__);

//屏幕高宽
#define SWidth [UIScreen mainScreen].bounds.size.width
#define SHeight [UIScreen mainScreen].bounds.size.height
#define Ratio SWidth / 320

//输出中文
//#ifdef DEBUG
//#define NSLog(FORMAT, ...) fprintf(stderr,"\n %s:%d   %s\n",[[[NSString stringWithUTF8String:__FILE__] lastPathComponent] UTF8String],__LINE__, [[[NSString alloc] initWithData:[[NSString stringWithFormat:FORMAT, ##__VA_ARGS__] dataUsingEncoding:NSUTF8StringEncoding] encoding:NSNonLossyASCIIStringEncoding] UTF8String]);
//#else
//#define NSLog(...)
//#endif


#endif /* ToolsHelper_h */


