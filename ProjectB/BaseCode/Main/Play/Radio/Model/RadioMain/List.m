//
//  List.m
//
//  Created by   on 2016/9/29
//  Copyright (c) 2016 __MyCompanyName__. All rights reserved.
//

#import "List.h"


NSString *const kListTitle = @"title";
NSString *const kListTags = @"tags";
NSString *const kListSerialState = @"serialState";
NSString *const kListNickname = @"nickname";
NSString *const kListCoverMiddle = @"coverMiddle";
NSString *const kListPlaysCounts = @"playsCounts";
NSString *const kListIntro = @"intro";
NSString *const kListIsPaid = @"isPaid";
NSString *const kListCommentsCount = @"commentsCount";
NSString *const kListAlbumId = @"albumId";
NSString *const kListId = @"id";
NSString *const kListCoverSmall = @"coverSmall";
NSString *const kListCoverLarge = @"coverLarge";
NSString *const kListUid = @"uid";
NSString *const kListTracks = @"tracks";
NSString *const kListTrackTitle = @"trackTitle";
NSString *const kListPriceTypeId = @"priceTypeId";
NSString *const kListIsFinished = @"isFinished";
NSString *const kListTrackId = @"trackId";
NSString *const kListAlbumCoverUrl290 = @"albumCoverUrl290";


@interface List ()

- (id)objectOrNilForKey:(id)aKey fromDictionary:(NSDictionary *)dict;

@end

@implementation List

@synthesize title = _title;
@synthesize tags = _tags;
@synthesize serialState = _serialState;
@synthesize nickname = _nickname;
@synthesize coverMiddle = _coverMiddle;
@synthesize playsCounts = _playsCounts;
@synthesize intro = _intro;
@synthesize isPaid = _isPaid;
@synthesize commentsCount = _commentsCount;
@synthesize albumId = _albumId;
@synthesize listIdentifier = _listIdentifier;
@synthesize coverSmall = _coverSmall;
@synthesize coverLarge = _coverLarge;
@synthesize uid = _uid;
@synthesize tracks = _tracks;
@synthesize trackTitle = _trackTitle;
@synthesize priceTypeId = _priceTypeId;
@synthesize isFinished = _isFinished;
@synthesize trackId = _trackId;
@synthesize albumCoverUrl290 = _albumCoverUrl290;


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
            self.title = [self objectOrNilForKey:kListTitle fromDictionary:dict];
            self.tags = [self objectOrNilForKey:kListTags fromDictionary:dict];
            self.serialState = [[self objectOrNilForKey:kListSerialState fromDictionary:dict] doubleValue];
            self.nickname = [self objectOrNilForKey:kListNickname fromDictionary:dict];
            self.coverMiddle = [self objectOrNilForKey:kListCoverMiddle fromDictionary:dict];
            self.playsCounts = [[self objectOrNilForKey:kListPlaysCounts fromDictionary:dict] doubleValue];
            self.intro = [self objectOrNilForKey:kListIntro fromDictionary:dict];
            self.isPaid = [[self objectOrNilForKey:kListIsPaid fromDictionary:dict] boolValue];
            self.commentsCount = [[self objectOrNilForKey:kListCommentsCount fromDictionary:dict] doubleValue];
            self.albumId = [[self objectOrNilForKey:kListAlbumId fromDictionary:dict] doubleValue];
            self.listIdentifier = [[self objectOrNilForKey:kListId fromDictionary:dict] doubleValue];
            self.coverSmall = [self objectOrNilForKey:kListCoverSmall fromDictionary:dict];
            self.coverLarge = [self objectOrNilForKey:kListCoverLarge fromDictionary:dict];
            self.uid = [[self objectOrNilForKey:kListUid fromDictionary:dict] doubleValue];
            self.tracks = [[self objectOrNilForKey:kListTracks fromDictionary:dict] doubleValue];
            self.trackTitle = [self objectOrNilForKey:kListTrackTitle fromDictionary:dict];
            self.priceTypeId = [[self objectOrNilForKey:kListPriceTypeId fromDictionary:dict] doubleValue];
            self.isFinished = [[self objectOrNilForKey:kListIsFinished fromDictionary:dict] doubleValue];
            self.trackId = [[self objectOrNilForKey:kListTrackId fromDictionary:dict] doubleValue];
            self.albumCoverUrl290 = [self objectOrNilForKey:kListAlbumCoverUrl290 fromDictionary:dict];

    }
    
    return self;
    
}

- (NSDictionary *)dictionaryRepresentation
{
    NSMutableDictionary *mutableDict = [NSMutableDictionary dictionary];
    [mutableDict setValue:self.title forKey:kListTitle];
    [mutableDict setValue:self.tags forKey:kListTags];
    [mutableDict setValue:[NSNumber numberWithDouble:self.serialState] forKey:kListSerialState];
    [mutableDict setValue:self.nickname forKey:kListNickname];
    [mutableDict setValue:self.coverMiddle forKey:kListCoverMiddle];
    [mutableDict setValue:[NSNumber numberWithDouble:self.playsCounts] forKey:kListPlaysCounts];
    [mutableDict setValue:self.intro forKey:kListIntro];
    [mutableDict setValue:[NSNumber numberWithBool:self.isPaid] forKey:kListIsPaid];
    [mutableDict setValue:[NSNumber numberWithDouble:self.commentsCount] forKey:kListCommentsCount];
    [mutableDict setValue:[NSNumber numberWithDouble:self.albumId] forKey:kListAlbumId];
    [mutableDict setValue:[NSNumber numberWithDouble:self.listIdentifier] forKey:kListId];
    [mutableDict setValue:self.coverSmall forKey:kListCoverSmall];
    [mutableDict setValue:self.coverLarge forKey:kListCoverLarge];
    [mutableDict setValue:[NSNumber numberWithDouble:self.uid] forKey:kListUid];
    [mutableDict setValue:[NSNumber numberWithDouble:self.tracks] forKey:kListTracks];
    [mutableDict setValue:self.trackTitle forKey:kListTrackTitle];
    [mutableDict setValue:[NSNumber numberWithDouble:self.priceTypeId] forKey:kListPriceTypeId];
    [mutableDict setValue:[NSNumber numberWithDouble:self.isFinished] forKey:kListIsFinished];
    [mutableDict setValue:[NSNumber numberWithDouble:self.trackId] forKey:kListTrackId];
    [mutableDict setValue:self.albumCoverUrl290 forKey:kListAlbumCoverUrl290];

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

    self.title = [aDecoder decodeObjectForKey:kListTitle];
    self.tags = [aDecoder decodeObjectForKey:kListTags];
    self.serialState = [aDecoder decodeDoubleForKey:kListSerialState];
    self.nickname = [aDecoder decodeObjectForKey:kListNickname];
    self.coverMiddle = [aDecoder decodeObjectForKey:kListCoverMiddle];
    self.playsCounts = [aDecoder decodeDoubleForKey:kListPlaysCounts];
    self.intro = [aDecoder decodeObjectForKey:kListIntro];
    self.isPaid = [aDecoder decodeBoolForKey:kListIsPaid];
    self.commentsCount = [aDecoder decodeDoubleForKey:kListCommentsCount];
    self.albumId = [aDecoder decodeDoubleForKey:kListAlbumId];
    self.listIdentifier = [aDecoder decodeDoubleForKey:kListId];
    self.coverSmall = [aDecoder decodeObjectForKey:kListCoverSmall];
    self.coverLarge = [aDecoder decodeObjectForKey:kListCoverLarge];
    self.uid = [aDecoder decodeDoubleForKey:kListUid];
    self.tracks = [aDecoder decodeDoubleForKey:kListTracks];
    self.trackTitle = [aDecoder decodeObjectForKey:kListTrackTitle];
    self.priceTypeId = [aDecoder decodeDoubleForKey:kListPriceTypeId];
    self.isFinished = [aDecoder decodeDoubleForKey:kListIsFinished];
    self.trackId = [aDecoder decodeDoubleForKey:kListTrackId];
    self.albumCoverUrl290 = [aDecoder decodeObjectForKey:kListAlbumCoverUrl290];
    return self;
}

- (void)encodeWithCoder:(NSCoder *)aCoder
{

    [aCoder encodeObject:_title forKey:kListTitle];
    [aCoder encodeObject:_tags forKey:kListTags];
    [aCoder encodeDouble:_serialState forKey:kListSerialState];
    [aCoder encodeObject:_nickname forKey:kListNickname];
    [aCoder encodeObject:_coverMiddle forKey:kListCoverMiddle];
    [aCoder encodeDouble:_playsCounts forKey:kListPlaysCounts];
    [aCoder encodeObject:_intro forKey:kListIntro];
    [aCoder encodeBool:_isPaid forKey:kListIsPaid];
    [aCoder encodeDouble:_commentsCount forKey:kListCommentsCount];
    [aCoder encodeDouble:_albumId forKey:kListAlbumId];
    [aCoder encodeDouble:_listIdentifier forKey:kListId];
    [aCoder encodeObject:_coverSmall forKey:kListCoverSmall];
    [aCoder encodeObject:_coverLarge forKey:kListCoverLarge];
    [aCoder encodeDouble:_uid forKey:kListUid];
    [aCoder encodeDouble:_tracks forKey:kListTracks];
    [aCoder encodeObject:_trackTitle forKey:kListTrackTitle];
    [aCoder encodeDouble:_priceTypeId forKey:kListPriceTypeId];
    [aCoder encodeDouble:_isFinished forKey:kListIsFinished];
    [aCoder encodeDouble:_trackId forKey:kListTrackId];
    [aCoder encodeObject:_albumCoverUrl290 forKey:kListAlbumCoverUrl290];
}

- (id)copyWithZone:(NSZone *)zone
{
    List *copy = [[List alloc] init];
    
    if (copy) {

        copy.title = [self.title copyWithZone:zone];
        copy.tags = [self.tags copyWithZone:zone];
        copy.serialState = self.serialState;
        copy.nickname = [self.nickname copyWithZone:zone];
        copy.coverMiddle = [self.coverMiddle copyWithZone:zone];
        copy.playsCounts = self.playsCounts;
        copy.intro = [self.intro copyWithZone:zone];
        copy.isPaid = self.isPaid;
        copy.commentsCount = self.commentsCount;
        copy.albumId = self.albumId;
        copy.listIdentifier = self.listIdentifier;
        copy.coverSmall = [self.coverSmall copyWithZone:zone];
        copy.coverLarge = [self.coverLarge copyWithZone:zone];
        copy.uid = self.uid;
        copy.tracks = self.tracks;
        copy.trackTitle = [self.trackTitle copyWithZone:zone];
        copy.priceTypeId = self.priceTypeId;
        copy.isFinished = self.isFinished;
        copy.trackId = self.trackId;
        copy.albumCoverUrl290 = [self.albumCoverUrl290 copyWithZone:zone];
    }
    
    return copy;
}


@end
