//
//  VedioModelVideoInfo.m
//
//  Created by   on 2016/10/12
//  Copyright (c) 2016 __MyCompanyName__. All rights reserved.
//

#import "VedioModelVideoInfo.h"


NSString *const kVedioModelVideoInfoVideoDuration = @"video_duration";
NSString *const kVedioModelVideoInfoBackupUrl = @"backup_url";
NSString *const kVedioModelVideoInfoCoverUrl = @"cover_url";
NSString *const kVedioModelVideoInfoHeight = @"height";
NSString *const kVedioModelVideoInfoWidth = @"width";
NSString *const kVedioModelVideoInfoVideoUrl = @"video_url";


@interface VedioModelVideoInfo ()

- (id)objectOrNilForKey:(id)aKey fromDictionary:(NSDictionary *)dict;

@end

@implementation VedioModelVideoInfo

@synthesize videoDuration = _videoDuration;
@synthesize backupUrl = _backupUrl;
@synthesize coverUrl = _coverUrl;
@synthesize height = _height;
@synthesize width = _width;
@synthesize videoUrl = _videoUrl;


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
            self.videoDuration = [[self objectOrNilForKey:kVedioModelVideoInfoVideoDuration fromDictionary:dict] doubleValue];
            self.backupUrl = [self objectOrNilForKey:kVedioModelVideoInfoBackupUrl fromDictionary:dict];
            self.coverUrl = [self objectOrNilForKey:kVedioModelVideoInfoCoverUrl fromDictionary:dict];
            self.height = [[self objectOrNilForKey:kVedioModelVideoInfoHeight fromDictionary:dict] doubleValue];
            self.width = [[self objectOrNilForKey:kVedioModelVideoInfoWidth fromDictionary:dict] doubleValue];
            self.videoUrl = [self objectOrNilForKey:kVedioModelVideoInfoVideoUrl fromDictionary:dict];

    }
    
    return self;
    
}

- (NSDictionary *)dictionaryRepresentation
{
    NSMutableDictionary *mutableDict = [NSMutableDictionary dictionary];
    [mutableDict setValue:[NSNumber numberWithDouble:self.videoDuration] forKey:kVedioModelVideoInfoVideoDuration];
    [mutableDict setValue:self.backupUrl forKey:kVedioModelVideoInfoBackupUrl];
    [mutableDict setValue:self.coverUrl forKey:kVedioModelVideoInfoCoverUrl];
    [mutableDict setValue:[NSNumber numberWithDouble:self.height] forKey:kVedioModelVideoInfoHeight];
    [mutableDict setValue:[NSNumber numberWithDouble:self.width] forKey:kVedioModelVideoInfoWidth];
    [mutableDict setValue:self.videoUrl forKey:kVedioModelVideoInfoVideoUrl];

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

    self.videoDuration = [aDecoder decodeDoubleForKey:kVedioModelVideoInfoVideoDuration];
    self.backupUrl = [aDecoder decodeObjectForKey:kVedioModelVideoInfoBackupUrl];
    self.coverUrl = [aDecoder decodeObjectForKey:kVedioModelVideoInfoCoverUrl];
    self.height = [aDecoder decodeDoubleForKey:kVedioModelVideoInfoHeight];
    self.width = [aDecoder decodeDoubleForKey:kVedioModelVideoInfoWidth];
    self.videoUrl = [aDecoder decodeObjectForKey:kVedioModelVideoInfoVideoUrl];
    return self;
}

- (void)encodeWithCoder:(NSCoder *)aCoder
{

    [aCoder encodeDouble:_videoDuration forKey:kVedioModelVideoInfoVideoDuration];
    [aCoder encodeObject:_backupUrl forKey:kVedioModelVideoInfoBackupUrl];
    [aCoder encodeObject:_coverUrl forKey:kVedioModelVideoInfoCoverUrl];
    [aCoder encodeDouble:_height forKey:kVedioModelVideoInfoHeight];
    [aCoder encodeDouble:_width forKey:kVedioModelVideoInfoWidth];
    [aCoder encodeObject:_videoUrl forKey:kVedioModelVideoInfoVideoUrl];
}

- (id)copyWithZone:(NSZone *)zone
{
    VedioModelVideoInfo *copy = [[VedioModelVideoInfo alloc] init];
    
    if (copy) {

        copy.videoDuration = self.videoDuration;
        copy.backupUrl = [self.backupUrl copyWithZone:zone];
        copy.coverUrl = [self.coverUrl copyWithZone:zone];
        copy.height = self.height;
        copy.width = self.width;
        copy.videoUrl = [self.videoUrl copyWithZone:zone];
    }
    
    return copy;
}


@end
