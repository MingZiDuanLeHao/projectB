//
//  RadioDetailListList.m
//
//  Created by   on 2016/9/30
//  Copyright (c) 2016 __MyCompanyName__. All rights reserved.
//

#import "RadioDetailListList.h"


NSString *const kRadioDetailListListStatus = @"status";
NSString *const kRadioDetailListListTitle = @"title";
NSString *const kRadioDetailListListLikes = @"likes";
NSString *const kRadioDetailListListUserSource = @"userSource";
NSString *const kRadioDetailListListDuration = @"duration";
NSString *const kRadioDetailListListNickname = @"nickname";
NSString *const kRadioDetailListListProcessState = @"processState";
NSString *const kRadioDetailListListCoverMiddle = @"coverMiddle";
NSString *const kRadioDetailListListPlayPathHq = @"playPathHq";
NSString *const kRadioDetailListListShares = @"shares";
NSString *const kRadioDetailListListIsPaid = @"isPaid";
NSString *const kRadioDetailListListPlayPathAacv224 = @"playPathAacv224";
NSString *const kRadioDetailListListCreatedAt = @"createdAt";
NSString *const kRadioDetailListListSmallLogo = @"smallLogo";
NSString *const kRadioDetailListListAlbumId = @"albumId";
NSString *const kRadioDetailListListPlaytimes = @"playtimes";
NSString *const kRadioDetailListListPlayUrl64 = @"playUrl64";
NSString *const kRadioDetailListListPlayPathAacv164 = @"playPathAacv164";
NSString *const kRadioDetailListListPlayUrl32 = @"playUrl32";
NSString *const kRadioDetailListListUid = @"uid";
NSString *const kRadioDetailListListCoverSmall = @"coverSmall";
NSString *const kRadioDetailListListCoverLarge = @"coverLarge";
NSString *const kRadioDetailListListComments = @"comments";
NSString *const kRadioDetailListListTrackId = @"trackId";
NSString *const kRadioDetailListListOpType = @"opType";
NSString *const kRadioDetailListListIsPublic = @"isPublic";


@interface RadioDetailListList ()

- (id)objectOrNilForKey:(id)aKey fromDictionary:(NSDictionary *)dict;

@end

@implementation RadioDetailListList

@synthesize status = _status;
@synthesize title = _title;
@synthesize likes = _likes;
@synthesize userSource = _userSource;
@synthesize duration = _duration;
@synthesize nickname = _nickname;
@synthesize processState = _processState;
@synthesize coverMiddle = _coverMiddle;
@synthesize playPathHq = _playPathHq;
@synthesize shares = _shares;
@synthesize isPaid = _isPaid;
@synthesize playPathAacv224 = _playPathAacv224;
@synthesize createdAt = _createdAt;
@synthesize smallLogo = _smallLogo;
@synthesize albumId = _albumId;
@synthesize playtimes = _playtimes;
@synthesize playUrl64 = _playUrl64;
@synthesize playPathAacv164 = _playPathAacv164;
@synthesize playUrl32 = _playUrl32;
@synthesize uid = _uid;
@synthesize coverSmall = _coverSmall;
@synthesize coverLarge = _coverLarge;
@synthesize comments = _comments;
@synthesize trackId = _trackId;
@synthesize opType = _opType;
@synthesize isPublic = _isPublic;


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
            self.status = [[self objectOrNilForKey:kRadioDetailListListStatus fromDictionary:dict] doubleValue];
            self.title = [self objectOrNilForKey:kRadioDetailListListTitle fromDictionary:dict];
            self.likes = [[self objectOrNilForKey:kRadioDetailListListLikes fromDictionary:dict] doubleValue];
            self.userSource = [[self objectOrNilForKey:kRadioDetailListListUserSource fromDictionary:dict] doubleValue];
            self.duration = [[self objectOrNilForKey:kRadioDetailListListDuration fromDictionary:dict] doubleValue];
            self.nickname = [self objectOrNilForKey:kRadioDetailListListNickname fromDictionary:dict];
            self.processState = [[self objectOrNilForKey:kRadioDetailListListProcessState fromDictionary:dict] doubleValue];
            self.coverMiddle = [self objectOrNilForKey:kRadioDetailListListCoverMiddle fromDictionary:dict];
            self.playPathHq = [self objectOrNilForKey:kRadioDetailListListPlayPathHq fromDictionary:dict];
            self.shares = [[self objectOrNilForKey:kRadioDetailListListShares fromDictionary:dict] doubleValue];
            self.isPaid = [[self objectOrNilForKey:kRadioDetailListListIsPaid fromDictionary:dict] boolValue];
            self.playPathAacv224 = [self objectOrNilForKey:kRadioDetailListListPlayPathAacv224 fromDictionary:dict];
            self.createdAt = [[self objectOrNilForKey:kRadioDetailListListCreatedAt fromDictionary:dict] doubleValue];
            self.smallLogo = [self objectOrNilForKey:kRadioDetailListListSmallLogo fromDictionary:dict];
            self.albumId = [[self objectOrNilForKey:kRadioDetailListListAlbumId fromDictionary:dict] doubleValue];
            self.playtimes = [[self objectOrNilForKey:kRadioDetailListListPlaytimes fromDictionary:dict] doubleValue];
            self.playUrl64 = [self objectOrNilForKey:kRadioDetailListListPlayUrl64 fromDictionary:dict];
            self.playPathAacv164 = [self objectOrNilForKey:kRadioDetailListListPlayPathAacv164 fromDictionary:dict];
            self.playUrl32 = [self objectOrNilForKey:kRadioDetailListListPlayUrl32 fromDictionary:dict];
            self.uid = [[self objectOrNilForKey:kRadioDetailListListUid fromDictionary:dict] doubleValue];
            self.coverSmall = [self objectOrNilForKey:kRadioDetailListListCoverSmall fromDictionary:dict];
            self.coverLarge = [self objectOrNilForKey:kRadioDetailListListCoverLarge fromDictionary:dict];
            self.comments = [[self objectOrNilForKey:kRadioDetailListListComments fromDictionary:dict] doubleValue];
            self.trackId = [[self objectOrNilForKey:kRadioDetailListListTrackId fromDictionary:dict] doubleValue];
            self.opType = [[self objectOrNilForKey:kRadioDetailListListOpType fromDictionary:dict] doubleValue];
            self.isPublic = [[self objectOrNilForKey:kRadioDetailListListIsPublic fromDictionary:dict] boolValue];

    }
    
    return self;
    
}

- (NSDictionary *)dictionaryRepresentation
{
    NSMutableDictionary *mutableDict = [NSMutableDictionary dictionary];
    [mutableDict setValue:[NSNumber numberWithDouble:self.status] forKey:kRadioDetailListListStatus];
    [mutableDict setValue:self.title forKey:kRadioDetailListListTitle];
    [mutableDict setValue:[NSNumber numberWithDouble:self.likes] forKey:kRadioDetailListListLikes];
    [mutableDict setValue:[NSNumber numberWithDouble:self.userSource] forKey:kRadioDetailListListUserSource];
    [mutableDict setValue:[NSNumber numberWithDouble:self.duration] forKey:kRadioDetailListListDuration];
    [mutableDict setValue:self.nickname forKey:kRadioDetailListListNickname];
    [mutableDict setValue:[NSNumber numberWithDouble:self.processState] forKey:kRadioDetailListListProcessState];
    [mutableDict setValue:self.coverMiddle forKey:kRadioDetailListListCoverMiddle];
    [mutableDict setValue:self.playPathHq forKey:kRadioDetailListListPlayPathHq];
    [mutableDict setValue:[NSNumber numberWithDouble:self.shares] forKey:kRadioDetailListListShares];
    [mutableDict setValue:[NSNumber numberWithBool:self.isPaid] forKey:kRadioDetailListListIsPaid];
    [mutableDict setValue:self.playPathAacv224 forKey:kRadioDetailListListPlayPathAacv224];
    [mutableDict setValue:[NSNumber numberWithDouble:self.createdAt] forKey:kRadioDetailListListCreatedAt];
    [mutableDict setValue:self.smallLogo forKey:kRadioDetailListListSmallLogo];
    [mutableDict setValue:[NSNumber numberWithDouble:self.albumId] forKey:kRadioDetailListListAlbumId];
    [mutableDict setValue:[NSNumber numberWithDouble:self.playtimes] forKey:kRadioDetailListListPlaytimes];
    [mutableDict setValue:self.playUrl64 forKey:kRadioDetailListListPlayUrl64];
    [mutableDict setValue:self.playPathAacv164 forKey:kRadioDetailListListPlayPathAacv164];
    [mutableDict setValue:self.playUrl32 forKey:kRadioDetailListListPlayUrl32];
    [mutableDict setValue:[NSNumber numberWithDouble:self.uid] forKey:kRadioDetailListListUid];
    [mutableDict setValue:self.coverSmall forKey:kRadioDetailListListCoverSmall];
    [mutableDict setValue:self.coverLarge forKey:kRadioDetailListListCoverLarge];
    [mutableDict setValue:[NSNumber numberWithDouble:self.comments] forKey:kRadioDetailListListComments];
    [mutableDict setValue:[NSNumber numberWithDouble:self.trackId] forKey:kRadioDetailListListTrackId];
    [mutableDict setValue:[NSNumber numberWithDouble:self.opType] forKey:kRadioDetailListListOpType];
    [mutableDict setValue:[NSNumber numberWithBool:self.isPublic] forKey:kRadioDetailListListIsPublic];

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

    self.status = [aDecoder decodeDoubleForKey:kRadioDetailListListStatus];
    self.title = [aDecoder decodeObjectForKey:kRadioDetailListListTitle];
    self.likes = [aDecoder decodeDoubleForKey:kRadioDetailListListLikes];
    self.userSource = [aDecoder decodeDoubleForKey:kRadioDetailListListUserSource];
    self.duration = [aDecoder decodeDoubleForKey:kRadioDetailListListDuration];
    self.nickname = [aDecoder decodeObjectForKey:kRadioDetailListListNickname];
    self.processState = [aDecoder decodeDoubleForKey:kRadioDetailListListProcessState];
    self.coverMiddle = [aDecoder decodeObjectForKey:kRadioDetailListListCoverMiddle];
    self.playPathHq = [aDecoder decodeObjectForKey:kRadioDetailListListPlayPathHq];
    self.shares = [aDecoder decodeDoubleForKey:kRadioDetailListListShares];
    self.isPaid = [aDecoder decodeBoolForKey:kRadioDetailListListIsPaid];
    self.playPathAacv224 = [aDecoder decodeObjectForKey:kRadioDetailListListPlayPathAacv224];
    self.createdAt = [aDecoder decodeDoubleForKey:kRadioDetailListListCreatedAt];
    self.smallLogo = [aDecoder decodeObjectForKey:kRadioDetailListListSmallLogo];
    self.albumId = [aDecoder decodeDoubleForKey:kRadioDetailListListAlbumId];
    self.playtimes = [aDecoder decodeDoubleForKey:kRadioDetailListListPlaytimes];
    self.playUrl64 = [aDecoder decodeObjectForKey:kRadioDetailListListPlayUrl64];
    self.playPathAacv164 = [aDecoder decodeObjectForKey:kRadioDetailListListPlayPathAacv164];
    self.playUrl32 = [aDecoder decodeObjectForKey:kRadioDetailListListPlayUrl32];
    self.uid = [aDecoder decodeDoubleForKey:kRadioDetailListListUid];
    self.coverSmall = [aDecoder decodeObjectForKey:kRadioDetailListListCoverSmall];
    self.coverLarge = [aDecoder decodeObjectForKey:kRadioDetailListListCoverLarge];
    self.comments = [aDecoder decodeDoubleForKey:kRadioDetailListListComments];
    self.trackId = [aDecoder decodeDoubleForKey:kRadioDetailListListTrackId];
    self.opType = [aDecoder decodeDoubleForKey:kRadioDetailListListOpType];
    self.isPublic = [aDecoder decodeBoolForKey:kRadioDetailListListIsPublic];
    return self;
}

- (void)encodeWithCoder:(NSCoder *)aCoder
{

    [aCoder encodeDouble:_status forKey:kRadioDetailListListStatus];
    [aCoder encodeObject:_title forKey:kRadioDetailListListTitle];
    [aCoder encodeDouble:_likes forKey:kRadioDetailListListLikes];
    [aCoder encodeDouble:_userSource forKey:kRadioDetailListListUserSource];
    [aCoder encodeDouble:_duration forKey:kRadioDetailListListDuration];
    [aCoder encodeObject:_nickname forKey:kRadioDetailListListNickname];
    [aCoder encodeDouble:_processState forKey:kRadioDetailListListProcessState];
    [aCoder encodeObject:_coverMiddle forKey:kRadioDetailListListCoverMiddle];
    [aCoder encodeObject:_playPathHq forKey:kRadioDetailListListPlayPathHq];
    [aCoder encodeDouble:_shares forKey:kRadioDetailListListShares];
    [aCoder encodeBool:_isPaid forKey:kRadioDetailListListIsPaid];
    [aCoder encodeObject:_playPathAacv224 forKey:kRadioDetailListListPlayPathAacv224];
    [aCoder encodeDouble:_createdAt forKey:kRadioDetailListListCreatedAt];
    [aCoder encodeObject:_smallLogo forKey:kRadioDetailListListSmallLogo];
    [aCoder encodeDouble:_albumId forKey:kRadioDetailListListAlbumId];
    [aCoder encodeDouble:_playtimes forKey:kRadioDetailListListPlaytimes];
    [aCoder encodeObject:_playUrl64 forKey:kRadioDetailListListPlayUrl64];
    [aCoder encodeObject:_playPathAacv164 forKey:kRadioDetailListListPlayPathAacv164];
    [aCoder encodeObject:_playUrl32 forKey:kRadioDetailListListPlayUrl32];
    [aCoder encodeDouble:_uid forKey:kRadioDetailListListUid];
    [aCoder encodeObject:_coverSmall forKey:kRadioDetailListListCoverSmall];
    [aCoder encodeObject:_coverLarge forKey:kRadioDetailListListCoverLarge];
    [aCoder encodeDouble:_comments forKey:kRadioDetailListListComments];
    [aCoder encodeDouble:_trackId forKey:kRadioDetailListListTrackId];
    [aCoder encodeDouble:_opType forKey:kRadioDetailListListOpType];
    [aCoder encodeBool:_isPublic forKey:kRadioDetailListListIsPublic];
}

- (id)copyWithZone:(NSZone *)zone
{
    RadioDetailListList *copy = [[RadioDetailListList alloc] init];
    
    if (copy) {

        copy.status = self.status;
        copy.title = [self.title copyWithZone:zone];
        copy.likes = self.likes;
        copy.userSource = self.userSource;
        copy.duration = self.duration;
        copy.nickname = [self.nickname copyWithZone:zone];
        copy.processState = self.processState;
        copy.coverMiddle = [self.coverMiddle copyWithZone:zone];
        copy.playPathHq = [self.playPathHq copyWithZone:zone];
        copy.shares = self.shares;
        copy.isPaid = self.isPaid;
        copy.playPathAacv224 = [self.playPathAacv224 copyWithZone:zone];
        copy.createdAt = self.createdAt;
        copy.smallLogo = [self.smallLogo copyWithZone:zone];
        copy.albumId = self.albumId;
        copy.playtimes = self.playtimes;
        copy.playUrl64 = [self.playUrl64 copyWithZone:zone];
        copy.playPathAacv164 = [self.playPathAacv164 copyWithZone:zone];
        copy.playUrl32 = [self.playUrl32 copyWithZone:zone];
        copy.uid = self.uid;
        copy.coverSmall = [self.coverSmall copyWithZone:zone];
        copy.coverLarge = [self.coverLarge copyWithZone:zone];
        copy.comments = self.comments;
        copy.trackId = self.trackId;
        copy.opType = self.opType;
        copy.isPublic = self.isPublic;
    }
    
    return copy;
}


@end
