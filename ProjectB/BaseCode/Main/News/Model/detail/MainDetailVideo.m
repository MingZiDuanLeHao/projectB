//
//  MainDetailVideo.m
//
//  Created by   on 2016/9/30
//  Copyright (c) 2016 __MyCompanyName__. All rights reserved.
//

#import "MainDetailVideo.h"


NSString *const kMainDetailVideoUrlMp4 = @"url_mp4";
NSString *const kMainDetailVideoCommentid = @"commentid";
NSString *const kMainDetailVideoAppurl = @"appurl";
NSString *const kMainDetailVideoMp4Url = @"mp4_url";
NSString *const kMainDetailVideoUrlM3u8 = @"url_m3u8";
NSString *const kMainDetailVideoVid = @"vid";
NSString *const kMainDetailVideoTopicid = @"topicid";
NSString *const kMainDetailVideoM3u8HdUrl = @"m3u8Hd_url";
NSString *const kMainDetailVideoSize = @"size";
NSString *const kMainDetailVideoCommentboard = @"commentboard";
NSString *const kMainDetailVideoBroadcast = @"broadcast";
NSString *const kMainDetailVideoCover = @"cover";
NSString *const kMainDetailVideoVideosource = @"videosource";
NSString *const kMainDetailVideoMp4HdUrl = @"mp4Hd_url";
NSString *const kMainDetailVideoAlt = @"alt";
NSString *const kMainDetailVideoM3u8Url = @"m3u8_url";
NSString *const kMainDetailVideoRef = @"ref";


@interface MainDetailVideo ()

- (id)objectOrNilForKey:(id)aKey fromDictionary:(NSDictionary *)dict;

@end

@implementation MainDetailVideo

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
            self.urlMp4 = [self objectOrNilForKey:kMainDetailVideoUrlMp4 fromDictionary:dict];
            self.commentid = [self objectOrNilForKey:kMainDetailVideoCommentid fromDictionary:dict];
            self.appurl = [self objectOrNilForKey:kMainDetailVideoAppurl fromDictionary:dict];
            self.mp4Url = [self objectOrNilForKey:kMainDetailVideoMp4Url fromDictionary:dict];
            self.urlM3u8 = [self objectOrNilForKey:kMainDetailVideoUrlM3u8 fromDictionary:dict];
            self.vid = [self objectOrNilForKey:kMainDetailVideoVid fromDictionary:dict];
            self.topicid = [self objectOrNilForKey:kMainDetailVideoTopicid fromDictionary:dict];
            self.m3u8HdUrl = [self objectOrNilForKey:kMainDetailVideoM3u8HdUrl fromDictionary:dict];
            self.size = [self objectOrNilForKey:kMainDetailVideoSize fromDictionary:dict];
            self.commentboard = [self objectOrNilForKey:kMainDetailVideoCommentboard fromDictionary:dict];
            self.broadcast = [self objectOrNilForKey:kMainDetailVideoBroadcast fromDictionary:dict];
            self.cover = [self objectOrNilForKey:kMainDetailVideoCover fromDictionary:dict];
            self.videosource = [self objectOrNilForKey:kMainDetailVideoVideosource fromDictionary:dict];
            self.mp4HdUrl = [self objectOrNilForKey:kMainDetailVideoMp4HdUrl fromDictionary:dict];
            self.alt = [self objectOrNilForKey:kMainDetailVideoAlt fromDictionary:dict];
            self.m3u8Url = [self objectOrNilForKey:kMainDetailVideoM3u8Url fromDictionary:dict];
            self.ref = [self objectOrNilForKey:kMainDetailVideoRef fromDictionary:dict];

    }
    
    return self;
    
}

- (NSDictionary *)dictionaryRepresentation
{
    NSMutableDictionary *mutableDict = [NSMutableDictionary dictionary];
    [mutableDict setValue:self.urlMp4 forKey:kMainDetailVideoUrlMp4];
    [mutableDict setValue:self.commentid forKey:kMainDetailVideoCommentid];
    [mutableDict setValue:self.appurl forKey:kMainDetailVideoAppurl];
    [mutableDict setValue:self.mp4Url forKey:kMainDetailVideoMp4Url];
    [mutableDict setValue:self.urlM3u8 forKey:kMainDetailVideoUrlM3u8];
    [mutableDict setValue:self.vid forKey:kMainDetailVideoVid];
    [mutableDict setValue:self.topicid forKey:kMainDetailVideoTopicid];
    [mutableDict setValue:self.m3u8HdUrl forKey:kMainDetailVideoM3u8HdUrl];
    [mutableDict setValue:self.size forKey:kMainDetailVideoSize];
    [mutableDict setValue:self.commentboard forKey:kMainDetailVideoCommentboard];
    [mutableDict setValue:self.broadcast forKey:kMainDetailVideoBroadcast];
    [mutableDict setValue:self.cover forKey:kMainDetailVideoCover];
    [mutableDict setValue:self.videosource forKey:kMainDetailVideoVideosource];
    [mutableDict setValue:self.mp4HdUrl forKey:kMainDetailVideoMp4HdUrl];
    [mutableDict setValue:self.alt forKey:kMainDetailVideoAlt];
    [mutableDict setValue:self.m3u8Url forKey:kMainDetailVideoM3u8Url];
    [mutableDict setValue:self.ref forKey:kMainDetailVideoRef];

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

    self.urlMp4 = [aDecoder decodeObjectForKey:kMainDetailVideoUrlMp4];
    self.commentid = [aDecoder decodeObjectForKey:kMainDetailVideoCommentid];
    self.appurl = [aDecoder decodeObjectForKey:kMainDetailVideoAppurl];
    self.mp4Url = [aDecoder decodeObjectForKey:kMainDetailVideoMp4Url];
    self.urlM3u8 = [aDecoder decodeObjectForKey:kMainDetailVideoUrlM3u8];
    self.vid = [aDecoder decodeObjectForKey:kMainDetailVideoVid];
    self.topicid = [aDecoder decodeObjectForKey:kMainDetailVideoTopicid];
    self.m3u8HdUrl = [aDecoder decodeObjectForKey:kMainDetailVideoM3u8HdUrl];
    self.size = [aDecoder decodeObjectForKey:kMainDetailVideoSize];
    self.commentboard = [aDecoder decodeObjectForKey:kMainDetailVideoCommentboard];
    self.broadcast = [aDecoder decodeObjectForKey:kMainDetailVideoBroadcast];
    self.cover = [aDecoder decodeObjectForKey:kMainDetailVideoCover];
    self.videosource = [aDecoder decodeObjectForKey:kMainDetailVideoVideosource];
    self.mp4HdUrl = [aDecoder decodeObjectForKey:kMainDetailVideoMp4HdUrl];
    self.alt = [aDecoder decodeObjectForKey:kMainDetailVideoAlt];
    self.m3u8Url = [aDecoder decodeObjectForKey:kMainDetailVideoM3u8Url];
    self.ref = [aDecoder decodeObjectForKey:kMainDetailVideoRef];
    return self;
}

- (void)encodeWithCoder:(NSCoder *)aCoder
{

    [aCoder encodeObject:_urlMp4 forKey:kMainDetailVideoUrlMp4];
    [aCoder encodeObject:_commentid forKey:kMainDetailVideoCommentid];
    [aCoder encodeObject:_appurl forKey:kMainDetailVideoAppurl];
    [aCoder encodeObject:_mp4Url forKey:kMainDetailVideoMp4Url];
    [aCoder encodeObject:_urlM3u8 forKey:kMainDetailVideoUrlM3u8];
    [aCoder encodeObject:_vid forKey:kMainDetailVideoVid];
    [aCoder encodeObject:_topicid forKey:kMainDetailVideoTopicid];
    [aCoder encodeObject:_m3u8HdUrl forKey:kMainDetailVideoM3u8HdUrl];
    [aCoder encodeObject:_size forKey:kMainDetailVideoSize];
    [aCoder encodeObject:_commentboard forKey:kMainDetailVideoCommentboard];
    [aCoder encodeObject:_broadcast forKey:kMainDetailVideoBroadcast];
    [aCoder encodeObject:_cover forKey:kMainDetailVideoCover];
    [aCoder encodeObject:_videosource forKey:kMainDetailVideoVideosource];
    [aCoder encodeObject:_mp4HdUrl forKey:kMainDetailVideoMp4HdUrl];
    [aCoder encodeObject:_alt forKey:kMainDetailVideoAlt];
    [aCoder encodeObject:_m3u8Url forKey:kMainDetailVideoM3u8Url];
    [aCoder encodeObject:_ref forKey:kMainDetailVideoRef];
}

- (id)copyWithZone:(NSZone *)zone
{
    MainDetailVideo *copy = [[MainDetailVideo alloc] init];
    
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
