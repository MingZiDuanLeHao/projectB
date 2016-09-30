//
//  Video.m
//
//  Created by   on 2016/9/30
//  Copyright (c) 2016 __MyCompanyName__. All rights reserved.
//

#import "Video.h"


NSString *const kVideoUrlMp4 = @"url_mp4";
NSString *const kVideoCommentid = @"commentid";
NSString *const kVideoAppurl = @"appurl";
NSString *const kVideoMp4Url = @"mp4_url";
NSString *const kVideoUrlM3u8 = @"url_m3u8";
NSString *const kVideoVid = @"vid";
NSString *const kVideoTopicid = @"topicid";
NSString *const kVideoM3u8HdUrl = @"m3u8Hd_url";
NSString *const kVideoSize = @"size";
NSString *const kVideoCommentboard = @"commentboard";
NSString *const kVideoBroadcast = @"broadcast";
NSString *const kVideoCover = @"cover";
NSString *const kVideoVideosource = @"videosource";
NSString *const kVideoMp4HdUrl = @"mp4Hd_url";
NSString *const kVideoAlt = @"alt";
NSString *const kVideoM3u8Url = @"m3u8_url";
NSString *const kVideoRef = @"ref";


@interface Video ()

- (id)objectOrNilForKey:(id)aKey fromDictionary:(NSDictionary *)dict;

@end

@implementation Video

@synthesize urlMp4 = _urlMp4;
@synthesize commentid = _commentid;
@synthesize appurl = _appurl;
@synthesize mp4Url = _mp4Url;
@synthesize urlM3u8 = _urlM3u8;
@synthesize vid = _vid;
@synthesize topicid = _topicid;
@synthesize m3u8HdUrl = _m3u8HdUrl;
@synthesize size = _size;
@synthesize commentboard = _commentboard;
@synthesize broadcast = _broadcast;
@synthesize cover = _cover;
@synthesize videosource = _videosource;
@synthesize mp4HdUrl = _mp4HdUrl;
@synthesize alt = _alt;
@synthesize m3u8Url = _m3u8Url;
@synthesize ref = _ref;


+ (instancetype)modelObjectWithDictionary:(NSDictionary *)dict
{
    return [[self alloc] initWithDictionary:dict];
}

- (instancetype)initWithDictionary:(NSDictionary *)dict
{
    self = [super init];
    
    // This check serves to make sure that a non-NSDictionary object
    // passed into the model class doesn't break the parsing.
    if(self && [dict isKindOfClass:[NSDictionary class]]) {
            self.urlMp4 = [self objectOrNilForKey:kVideoUrlMp4 fromDictionary:dict];
            self.commentid = [self objectOrNilForKey:kVideoCommentid fromDictionary:dict];
            self.appurl = [self objectOrNilForKey:kVideoAppurl fromDictionary:dict];
            self.mp4Url = [self objectOrNilForKey:kVideoMp4Url fromDictionary:dict];
            self.urlM3u8 = [self objectOrNilForKey:kVideoUrlM3u8 fromDictionary:dict];
            self.vid = [self objectOrNilForKey:kVideoVid fromDictionary:dict];
            self.topicid = [self objectOrNilForKey:kVideoTopicid fromDictionary:dict];
            self.m3u8HdUrl = [self objectOrNilForKey:kVideoM3u8HdUrl fromDictionary:dict];
            self.size = [self objectOrNilForKey:kVideoSize fromDictionary:dict];
            self.commentboard = [self objectOrNilForKey:kVideoCommentboard fromDictionary:dict];
            self.broadcast = [self objectOrNilForKey:kVideoBroadcast fromDictionary:dict];
            self.cover = [self objectOrNilForKey:kVideoCover fromDictionary:dict];
            self.videosource = [self objectOrNilForKey:kVideoVideosource fromDictionary:dict];
            self.mp4HdUrl = [self objectOrNilForKey:kVideoMp4HdUrl fromDictionary:dict];
            self.alt = [self objectOrNilForKey:kVideoAlt fromDictionary:dict];
            self.m3u8Url = [self objectOrNilForKey:kVideoM3u8Url fromDictionary:dict];
            self.ref = [self objectOrNilForKey:kVideoRef fromDictionary:dict];

    }
    
    return self;
    
}

- (NSDictionary *)dictionaryRepresentation
{
    NSMutableDictionary *mutableDict = [NSMutableDictionary dictionary];
    [mutableDict setValue:self.urlMp4 forKey:kVideoUrlMp4];
    [mutableDict setValue:self.commentid forKey:kVideoCommentid];
    [mutableDict setValue:self.appurl forKey:kVideoAppurl];
    [mutableDict setValue:self.mp4Url forKey:kVideoMp4Url];
    [mutableDict setValue:self.urlM3u8 forKey:kVideoUrlM3u8];
    [mutableDict setValue:self.vid forKey:kVideoVid];
    [mutableDict setValue:self.topicid forKey:kVideoTopicid];
    [mutableDict setValue:self.m3u8HdUrl forKey:kVideoM3u8HdUrl];
    [mutableDict setValue:self.size forKey:kVideoSize];
    [mutableDict setValue:self.commentboard forKey:kVideoCommentboard];
    [mutableDict setValue:self.broadcast forKey:kVideoBroadcast];
    [mutableDict setValue:self.cover forKey:kVideoCover];
    [mutableDict setValue:self.videosource forKey:kVideoVideosource];
    [mutableDict setValue:self.mp4HdUrl forKey:kVideoMp4HdUrl];
    [mutableDict setValue:self.alt forKey:kVideoAlt];
    [mutableDict setValue:self.m3u8Url forKey:kVideoM3u8Url];
    [mutableDict setValue:self.ref forKey:kVideoRef];

    return [NSDictionary dictionaryWithDictionary:mutableDict];
}

- (NSString *)description 
{
    return [NSString stringWithFormat:@"%@", [self dictionaryRepresentation]];
}

#pragma mark - Helper Method
- (id)objectOrNilForKey:(id)aKey fromDictionary:(NSDictionary *)dict
{
    id object = [dict objectForKey:aKey];
    return [object isEqual:[NSNull null]] ? nil : object;
}


#pragma mark - NSCoding Methods

- (id)initWithCoder:(NSCoder *)aDecoder
{
    self = [super init];

    self.urlMp4 = [aDecoder decodeObjectForKey:kVideoUrlMp4];
    self.commentid = [aDecoder decodeObjectForKey:kVideoCommentid];
    self.appurl = [aDecoder decodeObjectForKey:kVideoAppurl];
    self.mp4Url = [aDecoder decodeObjectForKey:kVideoMp4Url];
    self.urlM3u8 = [aDecoder decodeObjectForKey:kVideoUrlM3u8];
    self.vid = [aDecoder decodeObjectForKey:kVideoVid];
    self.topicid = [aDecoder decodeObjectForKey:kVideoTopicid];
    self.m3u8HdUrl = [aDecoder decodeObjectForKey:kVideoM3u8HdUrl];
    self.size = [aDecoder decodeObjectForKey:kVideoSize];
    self.commentboard = [aDecoder decodeObjectForKey:kVideoCommentboard];
    self.broadcast = [aDecoder decodeObjectForKey:kVideoBroadcast];
    self.cover = [aDecoder decodeObjectForKey:kVideoCover];
    self.videosource = [aDecoder decodeObjectForKey:kVideoVideosource];
    self.mp4HdUrl = [aDecoder decodeObjectForKey:kVideoMp4HdUrl];
    self.alt = [aDecoder decodeObjectForKey:kVideoAlt];
    self.m3u8Url = [aDecoder decodeObjectForKey:kVideoM3u8Url];
    self.ref = [aDecoder decodeObjectForKey:kVideoRef];
    return self;
}

- (void)encodeWithCoder:(NSCoder *)aCoder
{

    [aCoder encodeObject:_urlMp4 forKey:kVideoUrlMp4];
    [aCoder encodeObject:_commentid forKey:kVideoCommentid];
    [aCoder encodeObject:_appurl forKey:kVideoAppurl];
    [aCoder encodeObject:_mp4Url forKey:kVideoMp4Url];
    [aCoder encodeObject:_urlM3u8 forKey:kVideoUrlM3u8];
    [aCoder encodeObject:_vid forKey:kVideoVid];
    [aCoder encodeObject:_topicid forKey:kVideoTopicid];
    [aCoder encodeObject:_m3u8HdUrl forKey:kVideoM3u8HdUrl];
    [aCoder encodeObject:_size forKey:kVideoSize];
    [aCoder encodeObject:_commentboard forKey:kVideoCommentboard];
    [aCoder encodeObject:_broadcast forKey:kVideoBroadcast];
    [aCoder encodeObject:_cover forKey:kVideoCover];
    [aCoder encodeObject:_videosource forKey:kVideoVideosource];
    [aCoder encodeObject:_mp4HdUrl forKey:kVideoMp4HdUrl];
    [aCoder encodeObject:_alt forKey:kVideoAlt];
    [aCoder encodeObject:_m3u8Url forKey:kVideoM3u8Url];
    [aCoder encodeObject:_ref forKey:kVideoRef];
}

- (id)copyWithZone:(NSZone *)zone
{
    Video *copy = [[Video alloc] init];
    
    if (copy) {

        copy.urlMp4 = [self.urlMp4 copyWithZone:zone];
        copy.commentid = [self.commentid copyWithZone:zone];
        copy.appurl = [self.appurl copyWithZone:zone];
        copy.mp4Url = [self.mp4Url copyWithZone:zone];
        copy.urlM3u8 = [self.urlM3u8 copyWithZone:zone];
        copy.vid = [self.vid copyWithZone:zone];
        copy.topicid = [self.topicid copyWithZone:zone];
        copy.m3u8HdUrl = [self.m3u8HdUrl copyWithZone:zone];
        copy.size = [self.size copyWithZone:zone];
        copy.commentboard = [self.commentboard copyWithZone:zone];
        copy.broadcast = [self.broadcast copyWithZone:zone];
        copy.cover = [self.cover copyWithZone:zone];
        copy.videosource = [self.videosource copyWithZone:zone];
        copy.mp4HdUrl = [self.mp4HdUrl copyWithZone:zone];
        copy.alt = [self.alt copyWithZone:zone];
        copy.m3u8Url = [self.m3u8Url copyWithZone:zone];
        copy.ref = [self.ref copyWithZone:zone];
    }
    
    return copy;
}


@end
