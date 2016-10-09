//
//  imageModel.h
//  ui_自定义瀑布流
//
//  Created by lanou on 16/8/4.
//  Copyright © 2016年 sh. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface imageModel : NSObject
/**URL*/
@property(nonatomic,strong) NSString *thumbURL;
/**width*/
@property(nonatomic,assign) float width;
/**height*/
@property(nonatomic,assign) float height;
@end
