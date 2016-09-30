//
//  C20N3VJE000146BE.h
//
//  Created by   on 2016/9/30
//  Copyright (c) 2016 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>



@interface C20N3VJE000146BE : NSObject <NSCoding, NSCopying>

@property (nonatomic, strong) NSString *ptime;
@property (nonatomic, strong) NSString *source;
@property (nonatomic, strong) NSString *ec;
@property (nonatomic, strong) NSArray *link;
@property (nonatomic, strong) NSString *title;
@property (nonatomic, strong) NSArray *askbar;
@property (nonatomic, strong) NSArray *boboList;
@property (nonatomic, strong) NSString *tid;
@property (nonatomic, strong) NSArray *img;
@property (nonatomic, strong) NSArray *topiclistNews;
@property (nonatomic, assign) BOOL picnews;
@property (nonatomic, strong) NSString *template;
@property (nonatomic, strong) NSArray *video;
@property (nonatomic, strong) NSString *docid;
@property (nonatomic, strong) NSString *sourceUrl;
@property (nonatomic, strong) NSString *replyBoard;
@property (nonatomic, strong) NSArray *ydbaike;
@property (nonatomic, assign) double replyCount;
@property (nonatomic, strong) NSArray *topiclist;
@property (nonatomic, strong) NSString *body;
@property (nonatomic, assign) double threadAgainst;
@property (nonatomic, strong) NSArray *votes;
@property (nonatomic, strong) NSArray *huati;
@property (nonatomic, assign) BOOL hasNext;
@property (nonatomic, strong) NSString *voicecomment;
@property (nonatomic, strong) NSString *dkeys;
@property (nonatomic, strong) NSString *shareLink;
@property (nonatomic, strong) NSArray *users;
@property (nonatomic, assign) double threadVote;
@property (nonatomic, strong) NSArray *relativeSys;
@property (nonatomic, strong) NSString *digest;

+ (instancetype)modelObjectWithDictionary:(NSDictionary *)dict;
- (instancetype)initWithDictionary:(NSDictionary *)dict;
- (NSDictionary *)dictionaryRepresentation;

@end
