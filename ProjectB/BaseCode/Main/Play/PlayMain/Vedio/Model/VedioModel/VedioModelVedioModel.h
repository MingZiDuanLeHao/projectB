//
//  VedioModelVedioModel.h
//
//  Created by   on 2016/10/11
//  Copyright (c) 2016 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>

@class VedioModelLuaVersions;

@interface VedioModelVedioModel : NSObject <NSCoding, NSCopying>

@property (nonatomic, strong) NSString *category;
@property (nonatomic, strong) NSString *dataServerUrl;
@property (nonatomic, assign) double vip;
@property (nonatomic, assign) double useAdview;
@property (nonatomic, strong) NSString *inReviewAppVer;
@property (nonatomic, assign) double useLsAdMgr;
@property (nonatomic, assign) double total;
@property (nonatomic, assign) double commentsHidden;
@property (nonatomic, strong) NSString *ugcCloseMsg;
@property (nonatomic, assign) double encrypted;
@property (nonatomic, strong) NSString *ip;
@property (nonatomic, strong) NSArray *items;
@property (nonatomic, strong) NSString *page;
@property (nonatomic, strong) NSString *pageSize;
@property (nonatomic, strong) VedioModelLuaVersions *luaVersions;

+ (instancetype)modelObjectWithDictionary:(NSDictionary *)dict;
- (instancetype)initWithDictionary:(NSDictionary *)dict;
- (NSDictionary *)dictionaryRepresentation;

@end
