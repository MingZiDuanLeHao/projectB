//
//  Video.h
//
//  Created by   on 2016/9/30
//  Copyright (c) 2016 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>



@interface Video : NSObject <NSCoding, NSCopying>

@property (nonatomic, strong) NSString *urlMp4;
@property (nonatomic, strong) NSString *commentid;
@property (nonatomic, strong) NSString *appurl;
@property (nonatomic, strong) NSString *mp4Url;
@property (nonatomic, strong) NSString *urlM3u8;
@property (nonatomic, strong) NSString *vid;
@property (nonatomic, strong) NSString *topicid;
@property (nonatomic, strong) NSString *m3u8HdUrl;
@property (nonatomic, strong) NSString *size;
@property (nonatomic, strong) NSString *commentboard;
@property (nonatomic, strong) NSString *broadcast;
@property (nonatomic, strong) NSString *cover;
@property (nonatomic, strong) NSString *videosource;
@property (nonatomic, strong) NSString *mp4HdUrl;
@property (nonatomic, strong) NSString *alt;
@property (nonatomic, strong) NSString *m3u8Url;
@property (nonatomic, strong) NSString *ref;

+ (instancetype)modelObjectWithDictionary:(NSDictionary *)dict;
- (instancetype)initWithDictionary:(NSDictionary *)dict;
- (NSDictionary *)dictionaryRepresentation;

@end
