//
//  LiveInfo.m
//
//  Created by   on 2016/9/29
//  Copyright (c) 2016 __MyCompanyName__. All rights reserved.
//

#import "LiveInfo.h"


NSString *const kLiveInfoRoomId = @"roomId";
NSString *const kLiveInfoUserCount = @"user_count";
NSString *const kLiveInfoEndTime = @"end_time";
NSString *const kLiveInfoPano = @"pano";
NSString *const kLiveInfoStartTime = @"start_time";
NSString *const kLiveInfoMutilVideo = @"mutilVideo";
NSString *const kLiveInfoRemindTag = @"remindTag";
NSString *const kLiveInfoType = @"type";
NSString *const kLiveInfoVideo = @"video";


@interface LiveInfo ()

- (id)objectOrNilForKey:(id)aKey fromDictionary:(NSDictionary *)dict;

@end

@implementation LiveInfo

@synthesize roomId = _roomId;
@synthesize userCount = _userCount;
@synthesize endTime = _endTime;
@synthesize pano = _pano;
@synthesize startTime = _startTime;
@synthesize mutilVideo = _mutilVideo;
@synthesize remindTag = _remindTag;
@synthesize type = _type;
@synthesize video = _video;


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
            self.roomId = [[self objectOrNilForKey:kLiveInfoRoomId fromDictionary:dict] doubleValue];
            self.userCount = [[self objectOrNilForKey:kLiveInfoUserCount fromDictionary:dict] doubleValue];
            self.endTime = [self objectOrNilForKey:kLiveInfoEndTime fromDictionary:dict];
            self.pano = [[self objectOrNilForKey:kLiveInfoPano fromDictionary:dict] boolValue];
            self.startTime = [self objectOrNilForKey:kLiveInfoStartTime fromDictionary:dict];
            self.mutilVideo = [[self objectOrNilForKey:kLiveInfoMutilVideo fromDictionary:dict] boolValue];
            self.remindTag = [[self objectOrNilForKey:kLiveInfoRemindTag fromDictionary:dict] doubleValue];
            self.type = [[self objectOrNilForKey:kLiveInfoType fromDictionary:dict] doubleValue];
            self.video = [[self objectOrNilForKey:kLiveInfoVideo fromDictionary:dict] boolValue];

    }
    
    return self;
    
}

- (NSDictionary *)dictionaryRepresentation
{
    NSMutableDictionary *mutableDict = [NSMutableDictionary dictionary];
    [mutableDict setValue:[NSNumber numberWithDouble:self.roomId] forKey:kLiveInfoRoomId];
    [mutableDict setValue:[NSNumber numberWithDouble:self.userCount] forKey:kLiveInfoUserCount];
    [mutableDict setValue:self.endTime forKey:kLiveInfoEndTime];
    [mutableDict setValue:[NSNumber numberWithBool:self.pano] forKey:kLiveInfoPano];
    [mutableDict setValue:self.startTime forKey:kLiveInfoStartTime];
    [mutableDict setValue:[NSNumber numberWithBool:self.mutilVideo] forKey:kLiveInfoMutilVideo];
    [mutableDict setValue:[NSNumber numberWithDouble:self.remindTag] forKey:kLiveInfoRemindTag];
    [mutableDict setValue:[NSNumber numberWithDouble:self.type] forKey:kLiveInfoType];
    [mutableDict setValue:[NSNumber numberWithBool:self.video] forKey:kLiveInfoVideo];

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

    self.roomId = [aDecoder decodeDoubleForKey:kLiveInfoRoomId];
    self.userCount = [aDecoder decodeDoubleForKey:kLiveInfoUserCount];
    self.endTime = [aDecoder decodeObjectForKey:kLiveInfoEndTime];
    self.pano = [aDecoder decodeBoolForKey:kLiveInfoPano];
    self.startTime = [aDecoder decodeObjectForKey:kLiveInfoStartTime];
    self.mutilVideo = [aDecoder decodeBoolForKey:kLiveInfoMutilVideo];
    self.remindTag = [aDecoder decodeDoubleForKey:kLiveInfoRemindTag];
    self.type = [aDecoder decodeDoubleForKey:kLiveInfoType];
    self.video = [aDecoder decodeBoolForKey:kLiveInfoVideo];
    return self;
}

- (void)encodeWithCoder:(NSCoder *)aCoder
{

    [aCoder encodeDouble:_roomId forKey:kLiveInfoRoomId];
    [aCoder encodeDouble:_userCount forKey:kLiveInfoUserCount];
    [aCoder encodeObject:_endTime forKey:kLiveInfoEndTime];
    [aCoder encodeBool:_pano forKey:kLiveInfoPano];
    [aCoder encodeObject:_startTime forKey:kLiveInfoStartTime];
    [aCoder encodeBool:_mutilVideo forKey:kLiveInfoMutilVideo];
    [aCoder encodeDouble:_remindTag forKey:kLiveInfoRemindTag];
    [aCoder encodeDouble:_type forKey:kLiveInfoType];
    [aCoder encodeBool:_video forKey:kLiveInfoVideo];
}

- (id)copyWithZone:(NSZone *)zone
{
    LiveInfo *copy = [[LiveInfo alloc] init];
    
    if (copy) {

        copy.roomId = self.roomId;
        copy.userCount = self.userCount;
        copy.endTime = [self.endTime copyWithZone:zone];
        copy.pano = self.pano;
        copy.startTime = [self.startTime copyWithZone:zone];
        copy.mutilVideo = self.mutilVideo;
        copy.remindTag = self.remindTag;
        copy.type = self.type;
        copy.video = self.video;
    }
    
    return copy;
}


@end
