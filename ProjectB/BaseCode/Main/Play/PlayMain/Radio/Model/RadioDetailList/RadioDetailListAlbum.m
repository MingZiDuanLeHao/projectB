//
//  RadioDetailListAlbum.m
//
//  Created by   on 2016/9/30
//  Copyright (c) 2016 __MyCompanyName__. All rights reserved.
//

#import "RadioDetailListAlbum.h"


NSString *const kRadioDetailListAlbumStatus = @"status";
NSString *const kRadioDetailListAlbumTitle = @"title";
NSString *const kRadioDetailListAlbumSerialState = @"serialState";
NSString *const kRadioDetailListAlbumCategoryName = @"categoryName";
NSString *const kRadioDetailListAlbumCoverWebLarge = @"coverWebLarge";
NSString *const kRadioDetailListAlbumCoverMiddle = @"coverMiddle";
NSString *const kRadioDetailListAlbumHasNew = @"hasNew";
NSString *const kRadioDetailListAlbumIsPaid = @"isPaid";
NSString *const kRadioDetailListAlbumIntro = @"intro";
NSString *const kRadioDetailListAlbumNickname = @"nickname";
NSString *const kRadioDetailListAlbumIsVerified = @"isVerified";
NSString *const kRadioDetailListAlbumIsRecordDesc = @"isRecordDesc";
NSString *const kRadioDetailListAlbumShares = @"shares";
NSString *const kRadioDetailListAlbumAvatarPath = @"avatarPath";
NSString *const kRadioDetailListAlbumCreatedAt = @"createdAt";
NSString *const kRadioDetailListAlbumLastUptrackAt = @"lastUptrackAt";
NSString *const kRadioDetailListAlbumUpdatedAt = @"updatedAt";
NSString *const kRadioDetailListAlbumAlbumId = @"albumId";
NSString *const kRadioDetailListAlbumDetailCoverPath = @"detailCoverPath";
NSString *const kRadioDetailListAlbumCoverSmall = @"coverSmall";
NSString *const kRadioDetailListAlbumCoverLarge = @"coverLarge";
NSString *const kRadioDetailListAlbumCoverOrigin = @"coverOrigin";
NSString *const kRadioDetailListAlbumUid = @"uid";
NSString *const kRadioDetailListAlbumTracks = @"tracks";
NSString *const kRadioDetailListAlbumPlayTrackId = @"playTrackId";
NSString *const kRadioDetailListAlbumIsFavorite = @"isFavorite";
NSString *const kRadioDetailListAlbumCoverLargePop = @"coverLargePop";
NSString *const kRadioDetailListAlbumSerializeStatus = @"serializeStatus";
NSString *const kRadioDetailListAlbumCategoryId = @"categoryId";
NSString *const kRadioDetailListAlbumPlayTimes = @"playTimes";


@interface RadioDetailListAlbum ()

- (id)objectOrNilForKey:(id)aKey fromDictionary:(NSDictionary *)dict;

@end

@implementation RadioDetailListAlbum

@synthesize status = _status;
@synthesize title = _title;
@synthesize serialState = _serialState;
@synthesize categoryName = _categoryName;
@synthesize coverWebLarge = _coverWebLarge;
@synthesize coverMiddle = _coverMiddle;
@synthesize hasNew = _hasNew;
@synthesize isPaid = _isPaid;
@synthesize intro = _intro;
@synthesize nickname = _nickname;
@synthesize isVerified = _isVerified;
@synthesize isRecordDesc = _isRecordDesc;
@synthesize shares = _shares;
@synthesize avatarPath = _avatarPath;
@synthesize createdAt = _createdAt;
@synthesize lastUptrackAt = _lastUptrackAt;
@synthesize updatedAt = _updatedAt;
@synthesize albumId = _albumId;
@synthesize detailCoverPath = _detailCoverPath;
@synthesize coverSmall = _coverSmall;
@synthesize coverLarge = _coverLarge;
@synthesize coverOrigin = _coverOrigin;
@synthesize uid = _uid;
@synthesize tracks = _tracks;
@synthesize playTrackId = _playTrackId;
@synthesize isFavorite = _isFavorite;
@synthesize coverLargePop = _coverLargePop;
@synthesize serializeStatus = _serializeStatus;
@synthesize categoryId = _categoryId;
@synthesize playTimes = _playTimes;


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
            self.status = [[self objectOrNilForKey:kRadioDetailListAlbumStatus fromDictionary:dict] doubleValue];
            self.title = [self objectOrNilForKey:kRadioDetailListAlbumTitle fromDictionary:dict];
            self.serialState = [[self objectOrNilForKey:kRadioDetailListAlbumSerialState fromDictionary:dict] doubleValue];
            self.categoryName = [self objectOrNilForKey:kRadioDetailListAlbumCategoryName fromDictionary:dict];
            self.coverWebLarge = [self objectOrNilForKey:kRadioDetailListAlbumCoverWebLarge fromDictionary:dict];
            self.coverMiddle = [self objectOrNilForKey:kRadioDetailListAlbumCoverMiddle fromDictionary:dict];
            self.hasNew = [[self objectOrNilForKey:kRadioDetailListAlbumHasNew fromDictionary:dict] boolValue];
            self.isPaid = [[self objectOrNilForKey:kRadioDetailListAlbumIsPaid fromDictionary:dict] boolValue];
            self.intro = [self objectOrNilForKey:kRadioDetailListAlbumIntro fromDictionary:dict];
            self.nickname = [self objectOrNilForKey:kRadioDetailListAlbumNickname fromDictionary:dict];
            self.isVerified = [[self objectOrNilForKey:kRadioDetailListAlbumIsVerified fromDictionary:dict] boolValue];
            self.isRecordDesc = [[self objectOrNilForKey:kRadioDetailListAlbumIsRecordDesc fromDictionary:dict] boolValue];
            self.shares = [[self objectOrNilForKey:kRadioDetailListAlbumShares fromDictionary:dict] doubleValue];
            self.avatarPath = [self objectOrNilForKey:kRadioDetailListAlbumAvatarPath fromDictionary:dict];
            self.createdAt = [[self objectOrNilForKey:kRadioDetailListAlbumCreatedAt fromDictionary:dict] doubleValue];
            self.lastUptrackAt = [[self objectOrNilForKey:kRadioDetailListAlbumLastUptrackAt fromDictionary:dict] doubleValue];
            self.updatedAt = [[self objectOrNilForKey:kRadioDetailListAlbumUpdatedAt fromDictionary:dict] doubleValue];
            self.albumId = [[self objectOrNilForKey:kRadioDetailListAlbumAlbumId fromDictionary:dict] doubleValue];
            self.detailCoverPath = [self objectOrNilForKey:kRadioDetailListAlbumDetailCoverPath fromDictionary:dict];
            self.coverSmall = [self objectOrNilForKey:kRadioDetailListAlbumCoverSmall fromDictionary:dict];
            self.coverLarge = [self objectOrNilForKey:kRadioDetailListAlbumCoverLarge fromDictionary:dict];
            self.coverOrigin = [self objectOrNilForKey:kRadioDetailListAlbumCoverOrigin fromDictionary:dict];
            self.uid = [[self objectOrNilForKey:kRadioDetailListAlbumUid fromDictionary:dict] doubleValue];
            self.tracks = [[self objectOrNilForKey:kRadioDetailListAlbumTracks fromDictionary:dict] doubleValue];
            self.playTrackId = [[self objectOrNilForKey:kRadioDetailListAlbumPlayTrackId fromDictionary:dict] doubleValue];
            self.isFavorite = [[self objectOrNilForKey:kRadioDetailListAlbumIsFavorite fromDictionary:dict] boolValue];
            self.coverLargePop = [self objectOrNilForKey:kRadioDetailListAlbumCoverLargePop fromDictionary:dict];
            self.serializeStatus = [[self objectOrNilForKey:kRadioDetailListAlbumSerializeStatus fromDictionary:dict] doubleValue];
            self.categoryId = [[self objectOrNilForKey:kRadioDetailListAlbumCategoryId fromDictionary:dict] doubleValue];
            self.playTimes = [[self objectOrNilForKey:kRadioDetailListAlbumPlayTimes fromDictionary:dict] doubleValue];

    }
    
    return self;
    
}

- (NSDictionary *)dictionaryRepresentation
{
    NSMutableDictionary *mutableDict = [NSMutableDictionary dictionary];
    [mutableDict setValue:[NSNumber numberWithDouble:self.status] forKey:kRadioDetailListAlbumStatus];
    [mutableDict setValue:self.title forKey:kRadioDetailListAlbumTitle];
    [mutableDict setValue:[NSNumber numberWithDouble:self.serialState] forKey:kRadioDetailListAlbumSerialState];
    [mutableDict setValue:self.categoryName forKey:kRadioDetailListAlbumCategoryName];
    [mutableDict setValue:self.coverWebLarge forKey:kRadioDetailListAlbumCoverWebLarge];
    [mutableDict setValue:self.coverMiddle forKey:kRadioDetailListAlbumCoverMiddle];
    [mutableDict setValue:[NSNumber numberWithBool:self.hasNew] forKey:kRadioDetailListAlbumHasNew];
    [mutableDict setValue:[NSNumber numberWithBool:self.isPaid] forKey:kRadioDetailListAlbumIsPaid];
    [mutableDict setValue:self.intro forKey:kRadioDetailListAlbumIntro];
    [mutableDict setValue:self.nickname forKey:kRadioDetailListAlbumNickname];
    [mutableDict setValue:[NSNumber numberWithBool:self.isVerified] forKey:kRadioDetailListAlbumIsVerified];
    [mutableDict setValue:[NSNumber numberWithBool:self.isRecordDesc] forKey:kRadioDetailListAlbumIsRecordDesc];
    [mutableDict setValue:[NSNumber numberWithDouble:self.shares] forKey:kRadioDetailListAlbumShares];
    [mutableDict setValue:self.avatarPath forKey:kRadioDetailListAlbumAvatarPath];
    [mutableDict setValue:[NSNumber numberWithDouble:self.createdAt] forKey:kRadioDetailListAlbumCreatedAt];
    [mutableDict setValue:[NSNumber numberWithDouble:self.lastUptrackAt] forKey:kRadioDetailListAlbumLastUptrackAt];
    [mutableDict setValue:[NSNumber numberWithDouble:self.updatedAt] forKey:kRadioDetailListAlbumUpdatedAt];
    [mutableDict setValue:[NSNumber numberWithDouble:self.albumId] forKey:kRadioDetailListAlbumAlbumId];
    [mutableDict setValue:self.detailCoverPath forKey:kRadioDetailListAlbumDetailCoverPath];
    [mutableDict setValue:self.coverSmall forKey:kRadioDetailListAlbumCoverSmall];
    [mutableDict setValue:self.coverLarge forKey:kRadioDetailListAlbumCoverLarge];
    [mutableDict setValue:self.coverOrigin forKey:kRadioDetailListAlbumCoverOrigin];
    [mutableDict setValue:[NSNumber numberWithDouble:self.uid] forKey:kRadioDetailListAlbumUid];
    [mutableDict setValue:[NSNumber numberWithDouble:self.tracks] forKey:kRadioDetailListAlbumTracks];
    [mutableDict setValue:[NSNumber numberWithDouble:self.playTrackId] forKey:kRadioDetailListAlbumPlayTrackId];
    [mutableDict setValue:[NSNumber numberWithBool:self.isFavorite] forKey:kRadioDetailListAlbumIsFavorite];
    [mutableDict setValue:self.coverLargePop forKey:kRadioDetailListAlbumCoverLargePop];
    [mutableDict setValue:[NSNumber numberWithDouble:self.serializeStatus] forKey:kRadioDetailListAlbumSerializeStatus];
    [mutableDict setValue:[NSNumber numberWithDouble:self.categoryId] forKey:kRadioDetailListAlbumCategoryId];
    [mutableDict setValue:[NSNumber numberWithDouble:self.playTimes] forKey:kRadioDetailListAlbumPlayTimes];

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

    self.status = [aDecoder decodeDoubleForKey:kRadioDetailListAlbumStatus];
    self.title = [aDecoder decodeObjectForKey:kRadioDetailListAlbumTitle];
    self.serialState = [aDecoder decodeDoubleForKey:kRadioDetailListAlbumSerialState];
    self.categoryName = [aDecoder decodeObjectForKey:kRadioDetailListAlbumCategoryName];
    self.coverWebLarge = [aDecoder decodeObjectForKey:kRadioDetailListAlbumCoverWebLarge];
    self.coverMiddle = [aDecoder decodeObjectForKey:kRadioDetailListAlbumCoverMiddle];
    self.hasNew = [aDecoder decodeBoolForKey:kRadioDetailListAlbumHasNew];
    self.isPaid = [aDecoder decodeBoolForKey:kRadioDetailListAlbumIsPaid];
    self.intro = [aDecoder decodeObjectForKey:kRadioDetailListAlbumIntro];
    self.nickname = [aDecoder decodeObjectForKey:kRadioDetailListAlbumNickname];
    self.isVerified = [aDecoder decodeBoolForKey:kRadioDetailListAlbumIsVerified];
    self.isRecordDesc = [aDecoder decodeBoolForKey:kRadioDetailListAlbumIsRecordDesc];
    self.shares = [aDecoder decodeDoubleForKey:kRadioDetailListAlbumShares];
    self.avatarPath = [aDecoder decodeObjectForKey:kRadioDetailListAlbumAvatarPath];
    self.createdAt = [aDecoder decodeDoubleForKey:kRadioDetailListAlbumCreatedAt];
    self.lastUptrackAt = [aDecoder decodeDoubleForKey:kRadioDetailListAlbumLastUptrackAt];
    self.updatedAt = [aDecoder decodeDoubleForKey:kRadioDetailListAlbumUpdatedAt];
    self.albumId = [aDecoder decodeDoubleForKey:kRadioDetailListAlbumAlbumId];
    self.detailCoverPath = [aDecoder decodeObjectForKey:kRadioDetailListAlbumDetailCoverPath];
    self.coverSmall = [aDecoder decodeObjectForKey:kRadioDetailListAlbumCoverSmall];
    self.coverLarge = [aDecoder decodeObjectForKey:kRadioDetailListAlbumCoverLarge];
    self.coverOrigin = [aDecoder decodeObjectForKey:kRadioDetailListAlbumCoverOrigin];
    self.uid = [aDecoder decodeDoubleForKey:kRadioDetailListAlbumUid];
    self.tracks = [aDecoder decodeDoubleForKey:kRadioDetailListAlbumTracks];
    self.playTrackId = [aDecoder decodeDoubleForKey:kRadioDetailListAlbumPlayTrackId];
    self.isFavorite = [aDecoder decodeBoolForKey:kRadioDetailListAlbumIsFavorite];
    self.coverLargePop = [aDecoder decodeObjectForKey:kRadioDetailListAlbumCoverLargePop];
    self.serializeStatus = [aDecoder decodeDoubleForKey:kRadioDetailListAlbumSerializeStatus];
    self.categoryId = [aDecoder decodeDoubleForKey:kRadioDetailListAlbumCategoryId];
    self.playTimes = [aDecoder decodeDoubleForKey:kRadioDetailListAlbumPlayTimes];
    return self;
}

- (void)encodeWithCoder:(NSCoder *)aCoder
{

    [aCoder encodeDouble:_status forKey:kRadioDetailListAlbumStatus];
    [aCoder encodeObject:_title forKey:kRadioDetailListAlbumTitle];
    [aCoder encodeDouble:_serialState forKey:kRadioDetailListAlbumSerialState];
    [aCoder encodeObject:_categoryName forKey:kRadioDetailListAlbumCategoryName];
    [aCoder encodeObject:_coverWebLarge forKey:kRadioDetailListAlbumCoverWebLarge];
    [aCoder encodeObject:_coverMiddle forKey:kRadioDetailListAlbumCoverMiddle];
    [aCoder encodeBool:_hasNew forKey:kRadioDetailListAlbumHasNew];
    [aCoder encodeBool:_isPaid forKey:kRadioDetailListAlbumIsPaid];
    [aCoder encodeObject:_intro forKey:kRadioDetailListAlbumIntro];
    [aCoder encodeObject:_nickname forKey:kRadioDetailListAlbumNickname];
    [aCoder encodeBool:_isVerified forKey:kRadioDetailListAlbumIsVerified];
    [aCoder encodeBool:_isRecordDesc forKey:kRadioDetailListAlbumIsRecordDesc];
    [aCoder encodeDouble:_shares forKey:kRadioDetailListAlbumShares];
    [aCoder encodeObject:_avatarPath forKey:kRadioDetailListAlbumAvatarPath];
    [aCoder encodeDouble:_createdAt forKey:kRadioDetailListAlbumCreatedAt];
    [aCoder encodeDouble:_lastUptrackAt forKey:kRadioDetailListAlbumLastUptrackAt];
    [aCoder encodeDouble:_updatedAt forKey:kRadioDetailListAlbumUpdatedAt];
    [aCoder encodeDouble:_albumId forKey:kRadioDetailListAlbumAlbumId];
    [aCoder encodeObject:_detailCoverPath forKey:kRadioDetailListAlbumDetailCoverPath];
    [aCoder encodeObject:_coverSmall forKey:kRadioDetailListAlbumCoverSmall];
    [aCoder encodeObject:_coverLarge forKey:kRadioDetailListAlbumCoverLarge];
    [aCoder encodeObject:_coverOrigin forKey:kRadioDetailListAlbumCoverOrigin];
    [aCoder encodeDouble:_uid forKey:kRadioDetailListAlbumUid];
    [aCoder encodeDouble:_tracks forKey:kRadioDetailListAlbumTracks];
    [aCoder encodeDouble:_playTrackId forKey:kRadioDetailListAlbumPlayTrackId];
    [aCoder encodeBool:_isFavorite forKey:kRadioDetailListAlbumIsFavorite];
    [aCoder encodeObject:_coverLargePop forKey:kRadioDetailListAlbumCoverLargePop];
    [aCoder encodeDouble:_serializeStatus forKey:kRadioDetailListAlbumSerializeStatus];
    [aCoder encodeDouble:_categoryId forKey:kRadioDetailListAlbumCategoryId];
    [aCoder encodeDouble:_playTimes forKey:kRadioDetailListAlbumPlayTimes];
}

- (id)copyWithZone:(NSZone *)zone
{
    RadioDetailListAlbum *copy = [[RadioDetailListAlbum alloc] init];
    
    if (copy) {

        copy.status = self.status;
        copy.title = [self.title copyWithZone:zone];
        copy.serialState = self.serialState;
        copy.categoryName = [self.categoryName copyWithZone:zone];
        copy.coverWebLarge = [self.coverWebLarge copyWithZone:zone];
        copy.coverMiddle = [self.coverMiddle copyWithZone:zone];
        copy.hasNew = self.hasNew;
        copy.isPaid = self.isPaid;
        copy.intro = [self.intro copyWithZone:zone];
        copy.nickname = [self.nickname copyWithZone:zone];
        copy.isVerified = self.isVerified;
        copy.isRecordDesc = self.isRecordDesc;
        copy.shares = self.shares;
        copy.avatarPath = [self.avatarPath copyWithZone:zone];
        copy.createdAt = self.createdAt;
        copy.lastUptrackAt = self.lastUptrackAt;
        copy.updatedAt = self.updatedAt;
        copy.albumId = self.albumId;
        copy.detailCoverPath = [self.detailCoverPath copyWithZone:zone];
        copy.coverSmall = [self.coverSmall copyWithZone:zone];
        copy.coverLarge = [self.coverLarge copyWithZone:zone];
        copy.coverOrigin = [self.coverOrigin copyWithZone:zone];
        copy.uid = self.uid;
        copy.tracks = self.tracks;
        copy.playTrackId = self.playTrackId;
        copy.isFavorite = self.isFavorite;
        copy.coverLargePop = [self.coverLargePop copyWithZone:zone];
        copy.serializeStatus = self.serializeStatus;
        copy.categoryId = self.categoryId;
        copy.playTimes = self.playTimes;
    }
    
    return copy;
}


@end
