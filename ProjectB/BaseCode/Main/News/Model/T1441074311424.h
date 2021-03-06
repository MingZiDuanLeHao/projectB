//
//  T1441074311424.h
//
//  Created by   on 2016/9/29
//  Copyright (c) 2016 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>

@class LiveInfo;

@interface T1441074311424 : NSObject <NSCoding, NSCopying>

@property (nonatomic, strong) NSString *alias;
@property (nonatomic, assign) double imgType;
@property (nonatomic, assign) double replyCount;
@property (nonatomic, strong) NSString *lmodify;
@property (nonatomic, assign) BOOL hasCover;
@property (nonatomic, strong) NSString *subtitle;
@property (nonatomic, strong) NSString *pixel;
@property (nonatomic, strong) NSString *url;
@property (nonatomic, strong) NSString *ltitle;
@property (nonatomic, strong) NSString *ptime;
@property (nonatomic, strong) NSArray *editor;
@property (nonatomic, strong) NSString *postid;
@property (nonatomic, assign) double votecount;
@property (nonatomic, assign) double hasHead;
@property (nonatomic, assign) double priority;
@property (nonatomic, strong) NSString *digest;
@property (nonatomic, strong) NSString *tname;
@property (nonatomic, strong) NSString *template;
@property (nonatomic, assign) double hasAD;
@property (nonatomic, strong) NSString *skipType;
@property (nonatomic, strong) NSString *imgsrc;
@property (nonatomic, strong) NSString *source;
@property (nonatomic, strong) NSString *ename;
@property (nonatomic, assign) BOOL hasIcon;
@property (nonatomic, assign) double order;
@property (nonatomic, strong) NSString *url3w;
@property (nonatomic, strong) NSString *cid;
@property (nonatomic, strong) NSString *boardid;
@property (nonatomic, strong) NSString *docid;
@property (nonatomic, strong) NSString *tAG;
@property (nonatomic, assign) double hasImg;
@property (nonatomic, strong) LiveInfo *liveInfo;
@property (nonatomic, strong) NSString *title;
@property (nonatomic, strong) NSString *tAGS;
@property (nonatomic, strong) NSString *skipID;

+ (instancetype)modelObjectWithDictionary:(NSDictionary *)dict;
- (instancetype)initWithDictionary:(NSDictionary *)dict;
- (NSDictionary *)dictionaryRepresentation;

@end
