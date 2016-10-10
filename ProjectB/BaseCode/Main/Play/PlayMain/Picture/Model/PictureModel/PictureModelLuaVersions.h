//
//  PictureModelLuaVersions.h
//
//  Created by   on 2016/10/9
//  Copyright (c) 2016 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>



@interface PictureModelLuaVersions : NSObject <NSCoding, NSCopying>

@property (nonatomic, assign) double sina;
@property (nonatomic, assign) double sohu;
@property (nonatomic, assign) double youku;
@property (nonatomic, assign) double tudou;
@property (nonatomic, assign) double fengxing;
@property (nonatomic, assign) double bilibili;
@property (nonatomic, assign) double weibo;
@property (nonatomic, assign) double miaopai;
@property (nonatomic, assign) double iqiyi;
@property (nonatomic, assign) double vlook;
@property (nonatomic, assign) double qq;
@property (nonatomic, assign) double acfun;

+ (instancetype)modelObjectWithDictionary:(NSDictionary *)dict;
- (instancetype)initWithDictionary:(NSDictionary *)dict;
- (NSDictionary *)dictionaryRepresentation;

@end
