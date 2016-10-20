//
//  RadioTwoUser.m
//
//  Created by   on 2016/10/10
//  Copyright (c) 2016 __MyCompanyName__. All rights reserved.
//

#import "RadioTwoUser.h"


NSString *const kRadioTwoUserSmallLogo = @"smallLogo";
NSString *const kRadioTwoUserTracks = @"tracks";
NSString *const kRadioTwoUserUid = @"uid";
NSString *const kRadioTwoUserNickname = @"nickname";
NSString *const kRadioTwoUserIsVerified = @"isVerified";
NSString *const kRadioTwoUserAlbums = @"albums";
NSString *const kRadioTwoUserFollowers = @"followers";
NSString *const kRadioTwoUserPersonalSignature = @"personalSignature";
NSString *const kRadioTwoUserIsFollowed = @"isFollowed";
NSString *const kRadioTwoUserFollowings = @"followings";
NSString *const kRadioTwoUserPersonDescribe = @"personDescribe";


@interface RadioTwoUser ()

- (id)objectOrNilForKey:(id)aKey fromDictionary:(NSDictionary *)dict;

@end

@implementation RadioTwoUser

@synthesize smallLogo = _smallLogo;
@synthesize tracks = _tracks;
@synthesize uid = _uid;
@synthesize nickname = _nickname;
@synthesize isVerified = _isVerified;
@synthesize albums = _albums;
@synthesize followers = _followers;
@synthesize personalSignature = _personalSignature;
@synthesize isFollowed = _isFollowed;
@synthesize followings = _followings;
@synthesize personDescribe = _personDescribe;


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
            self.smallLogo = [self objectOrNilForKey:kRadioTwoUserSmallLogo fromDictionary:dict];
            self.tracks = [[self objectOrNilForKey:kRadioTwoUserTracks fromDictionary:dict] doubleValue];
            self.uid = [[self objectOrNilForKey:kRadioTwoUserUid fromDictionary:dict] doubleValue];
            self.nickname = [self objectOrNilForKey:kRadioTwoUserNickname fromDictionary:dict];
            self.isVerified = [[self objectOrNilForKey:kRadioTwoUserIsVerified fromDictionary:dict] boolValue];
            self.albums = [[self objectOrNilForKey:kRadioTwoUserAlbums fromDictionary:dict] doubleValue];
            self.followers = [[self objectOrNilForKey:kRadioTwoUserFollowers fromDictionary:dict] doubleValue];
            self.personalSignature = [self objectOrNilForKey:kRadioTwoUserPersonalSignature fromDictionary:dict];
            self.isFollowed = [[self objectOrNilForKey:kRadioTwoUserIsFollowed fromDictionary:dict] boolValue];
            self.followings = [[self objectOrNilForKey:kRadioTwoUserFollowings fromDictionary:dict] doubleValue];
            self.personDescribe = [self objectOrNilForKey:kRadioTwoUserPersonDescribe fromDictionary:dict];

    }
    
    return self;
    
}

- (NSDictionary *)dictionaryRepresentation
{
    NSMutableDictionary *mutableDict = [NSMutableDictionary dictionary];
    [mutableDict setValue:self.smallLogo forKey:kRadioTwoUserSmallLogo];
    [mutableDict setValue:[NSNumber numberWithDouble:self.tracks] forKey:kRadioTwoUserTracks];
    [mutableDict setValue:[NSNumber numberWithDouble:self.uid] forKey:kRadioTwoUserUid];
    [mutableDict setValue:self.nickname forKey:kRadioTwoUserNickname];
    [mutableDict setValue:[NSNumber numberWithBool:self.isVerified] forKey:kRadioTwoUserIsVerified];
    [mutableDict setValue:[NSNumber numberWithDouble:self.albums] forKey:kRadioTwoUserAlbums];
    [mutableDict setValue:[NSNumber numberWithDouble:self.followers] forKey:kRadioTwoUserFollowers];
    [mutableDict setValue:self.personalSignature forKey:kRadioTwoUserPersonalSignature];
    [mutableDict setValue:[NSNumber numberWithBool:self.isFollowed] forKey:kRadioTwoUserIsFollowed];
    [mutableDict setValue:[NSNumber numberWithDouble:self.followings] forKey:kRadioTwoUserFollowings];
    [mutableDict setValue:self.personDescribe forKey:kRadioTwoUserPersonDescribe];

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

    self.smallLogo = [aDecoder decodeObjectForKey:kRadioTwoUserSmallLogo];
    self.tracks = [aDecoder decodeDoubleForKey:kRadioTwoUserTracks];
    self.uid = [aDecoder decodeDoubleForKey:kRadioTwoUserUid];
    self.nickname = [aDecoder decodeObjectForKey:kRadioTwoUserNickname];
    self.isVerified = [aDecoder decodeBoolForKey:kRadioTwoUserIsVerified];
    self.albums = [aDecoder decodeDoubleForKey:kRadioTwoUserAlbums];
    self.followers = [aDecoder decodeDoubleForKey:kRadioTwoUserFollowers];
    self.personalSignature = [aDecoder decodeObjectForKey:kRadioTwoUserPersonalSignature];
    self.isFollowed = [aDecoder decodeBoolForKey:kRadioTwoUserIsFollowed];
    self.followings = [aDecoder decodeDoubleForKey:kRadioTwoUserFollowings];
    self.personDescribe = [aDecoder decodeObjectForKey:kRadioTwoUserPersonDescribe];
    return self;
}

- (void)encodeWithCoder:(NSCoder *)aCoder
{

    [aCoder encodeObject:_smallLogo forKey:kRadioTwoUserSmallLogo];
    [aCoder encodeDouble:_tracks forKey:kRadioTwoUserTracks];
    [aCoder encodeDouble:_uid forKey:kRadioTwoUserUid];
    [aCoder encodeObject:_nickname forKey:kRadioTwoUserNickname];
    [aCoder encodeBool:_isVerified forKey:kRadioTwoUserIsVerified];
    [aCoder encodeDouble:_albums forKey:kRadioTwoUserAlbums];
    [aCoder encodeDouble:_followers forKey:kRadioTwoUserFollowers];
    [aCoder encodeObject:_personalSignature forKey:kRadioTwoUserPersonalSignature];
    [aCoder encodeBool:_isFollowed forKey:kRadioTwoUserIsFollowed];
    [aCoder encodeDouble:_followings forKey:kRadioTwoUserFollowings];
    [aCoder encodeObject:_personDescribe forKey:kRadioTwoUserPersonDescribe];
}

- (id)copyWithZone:(NSZone *)zone
{
    RadioTwoUser *copy = [[RadioTwoUser alloc] init];
    
    if (copy) {

        copy.smallLogo = [self.smallLogo copyWithZone:zone];
        copy.tracks = self.tracks;
        copy.uid = self.uid;
        copy.nickname = [self.nickname copyWithZone:zone];
        copy.isVerified = self.isVerified;
        copy.albums = self.albums;
        copy.followers = self.followers;
        copy.personalSignature = [self.personalSignature copyWithZone:zone];
        copy.isFollowed = self.isFollowed;
        copy.followings = self.followings;
        copy.personDescribe = [self.personDescribe copyWithZone:zone];
    }
    
    return copy;
}


@end
