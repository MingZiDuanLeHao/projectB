//
//  RadioTwoList.m
//
//  Created by   on 2016/10/10
//  Copyright (c) 2016 __MyCompanyName__. All rights reserved.
//

#import "RadioTwoList.h"


NSString *const kRadioTwoListUpdatedAt = @"updatedAt";
NSString *const kRadioTwoListIntro = @"intro";
NSString *const kRadioTwoListTracks = @"tracks";
NSString *const kRadioTwoListUid = @"uid";
NSString *const kRadioTwoListPlaysCounts = @"playsCounts";
NSString *const kRadioTwoListRecSrc = @"recSrc";
NSString *const kRadioTwoListCoverSmall = @"coverSmall";
NSString *const kRadioTwoListCoverMiddle = @"coverMiddle";
NSString *const kRadioTwoListTitle = @"title";
NSString *const kRadioTwoListPlayTimes = @"playTimes";
NSString *const kRadioTwoListCommentsCount = @"commentsCount";
NSString *const kRadioTwoListAlbumId = @"albumId";
NSString *const kRadioTwoListRecTrack = @"recTrack";


@interface RadioTwoList ()

- (id)objectOrNilForKey:(id)aKey fromDictionary:(NSDictionary *)dict;

@end

@implementation RadioTwoList

@synthesize updatedAt = _updatedAt;
@synthesize intro = _intro;
@synthesize tracks = _tracks;
@synthesize uid = _uid;
@synthesize playsCounts = _playsCounts;
@synthesize recSrc = _recSrc;
@synthesize coverSmall = _coverSmall;
@synthesize coverMiddle = _coverMiddle;
@synthesize title = _title;
@synthesize playTimes = _playTimes;
@synthesize commentsCount = _commentsCount;
@synthesize albumId = _albumId;
@synthesize recTrack = _recTrack;


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
            self.updatedAt = [[self objectOrNilForKey:kRadioTwoListUpdatedAt fromDictionary:dict] doubleValue];
            self.intro = [self objectOrNilForKey:kRadioTwoListIntro fromDictionary:dict];
            self.tracks = [[self objectOrNilForKey:kRadioTwoListTracks fromDictionary:dict] doubleValue];
            self.uid = [[self objectOrNilForKey:kRadioTwoListUid fromDictionary:dict] doubleValue];
            self.playsCounts = [[self objectOrNilForKey:kRadioTwoListPlaysCounts fromDictionary:dict] doubleValue];
            self.recSrc = [self objectOrNilForKey:kRadioTwoListRecSrc fromDictionary:dict];
            self.coverSmall = [self objectOrNilForKey:kRadioTwoListCoverSmall fromDictionary:dict];
            self.coverMiddle = [self objectOrNilForKey:kRadioTwoListCoverMiddle fromDictionary:dict];
            self.title = [self objectOrNilForKey:kRadioTwoListTitle fromDictionary:dict];
            self.playTimes = [[self objectOrNilForKey:kRadioTwoListPlayTimes fromDictionary:dict] doubleValue];
            self.commentsCount = [[self objectOrNilForKey:kRadioTwoListCommentsCount fromDictionary:dict] doubleValue];
            self.albumId = [[self objectOrNilForKey:kRadioTwoListAlbumId fromDictionary:dict] doubleValue];
            self.recTrack = [self objectOrNilForKey:kRadioTwoListRecTrack fromDictionary:dict];

    }
    
    return self;
    
}

- (NSDictionary *)dictionaryRepresentation
{
    NSMutableDictionary *mutableDict = [NSMutableDictionary dictionary];
    [mutableDict setValue:[NSNumber numberWithDouble:self.updatedAt] forKey:kRadioTwoListUpdatedAt];
    [mutableDict setValue:self.intro forKey:kRadioTwoListIntro];
    [mutableDict setValue:[NSNumber numberWithDouble:self.tracks] forKey:kRadioTwoListTracks];
    [mutableDict setValue:[NSNumber numberWithDouble:self.uid] forKey:kRadioTwoListUid];
    [mutableDict setValue:[NSNumber numberWithDouble:self.playsCounts] forKey:kRadioTwoListPlaysCounts];
    [mutableDict setValue:self.recSrc forKey:kRadioTwoListRecSrc];
    [mutableDict setValue:self.coverSmall forKey:kRadioTwoListCoverSmall];
    [mutableDict setValue:self.coverMiddle forKey:kRadioTwoListCoverMiddle];
    [mutableDict setValue:self.title forKey:kRadioTwoListTitle];
    [mutableDict setValue:[NSNumber numberWithDouble:self.playTimes] forKey:kRadioTwoListPlayTimes];
    [mutableDict setValue:[NSNumber numberWithDouble:self.commentsCount] forKey:kRadioTwoListCommentsCount];
    [mutableDict setValue:[NSNumber numberWithDouble:self.albumId] forKey:kRadioTwoListAlbumId];
    [mutableDict setValue:self.recTrack forKey:kRadioTwoListRecTrack];

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

    self.updatedAt = [aDecoder decodeDoubleForKey:kRadioTwoListUpdatedAt];
    self.intro = [aDecoder decodeObjectForKey:kRadioTwoListIntro];
    self.tracks = [aDecoder decodeDoubleForKey:kRadioTwoListTracks];
    self.uid = [aDecoder decodeDoubleForKey:kRadioTwoListUid];
    self.playsCounts = [aDecoder decodeDoubleForKey:kRadioTwoListPlaysCounts];
    self.recSrc = [aDecoder decodeObjectForKey:kRadioTwoListRecSrc];
    self.coverSmall = [aDecoder decodeObjectForKey:kRadioTwoListCoverSmall];
    self.coverMiddle = [aDecoder decodeObjectForKey:kRadioTwoListCoverMiddle];
    self.title = [aDecoder decodeObjectForKey:kRadioTwoListTitle];
    self.playTimes = [aDecoder decodeDoubleForKey:kRadioTwoListPlayTimes];
    self.commentsCount = [aDecoder decodeDoubleForKey:kRadioTwoListCommentsCount];
    self.albumId = [aDecoder decodeDoubleForKey:kRadioTwoListAlbumId];
    self.recTrack = [aDecoder decodeObjectForKey:kRadioTwoListRecTrack];
    return self;
}

- (void)encodeWithCoder:(NSCoder *)aCoder
{

    [aCoder encodeDouble:_updatedAt forKey:kRadioTwoListUpdatedAt];
    [aCoder encodeObject:_intro forKey:kRadioTwoListIntro];
    [aCoder encodeDouble:_tracks forKey:kRadioTwoListTracks];
    [aCoder encodeDouble:_uid forKey:kRadioTwoListUid];
    [aCoder encodeDouble:_playsCounts forKey:kRadioTwoListPlaysCounts];
    [aCoder encodeObject:_recSrc forKey:kRadioTwoListRecSrc];
    [aCoder encodeObject:_coverSmall forKey:kRadioTwoListCoverSmall];
    [aCoder encodeObject:_coverMiddle forKey:kRadioTwoListCoverMiddle];
    [aCoder encodeObject:_title forKey:kRadioTwoListTitle];
    [aCoder encodeDouble:_playTimes forKey:kRadioTwoListPlayTimes];
    [aCoder encodeDouble:_commentsCount forKey:kRadioTwoListCommentsCount];
    [aCoder encodeDouble:_albumId forKey:kRadioTwoListAlbumId];
    [aCoder encodeObject:_recTrack forKey:kRadioTwoListRecTrack];
}

- (id)copyWithZone:(NSZone *)zone
{
    RadioTwoList *copy = [[RadioTwoList alloc] init];
    
    if (copy) {

        copy.updatedAt = self.updatedAt;
        copy.intro = [self.intro copyWithZone:zone];
        copy.tracks = self.tracks;
        copy.uid = self.uid;
        copy.playsCounts = self.playsCounts;
        copy.recSrc = [self.recSrc copyWithZone:zone];
        copy.coverSmall = [self.coverSmall copyWithZone:zone];
        copy.coverMiddle = [self.coverMiddle copyWithZone:zone];
        copy.title = [self.title copyWithZone:zone];
        copy.playTimes = self.playTimes;
        copy.commentsCount = self.commentsCount;
        copy.albumId = self.albumId;
        copy.recTrack = [self.recTrack copyWithZone:zone];
    }
    
    return copy;
}


@end
