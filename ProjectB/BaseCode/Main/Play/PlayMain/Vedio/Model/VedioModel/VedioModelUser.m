//
//  VedioModelUser.m
//
//  Created by   on 2016/10/12
//  Copyright (c) 2016 __MyCompanyName__. All rights reserved.
//

#import "VedioModelUser.h"


NSString *const kVedioModelUserId = @"id";
NSString *const kVedioModelUserDescription = @"description";
NSString *const kVedioModelUserScreenName = @"screen_name";
NSString *const kVedioModelUserIsFollower = @"is_follower";
NSString *const kVedioModelUserAvatarUrl = @"avatar_url";
NSString *const kVedioModelUserUgcCount = @"ugc_count";
NSString *const kVedioModelUserIsFollowing = @"is_following";
NSString *const kVedioModelUserLargeAvatarUrl = @"large_avatar_url";
NSString *const kVedioModelUserFollowings = @"followings";
NSString *const kVedioModelUserUserId = @"user_id";
NSString *const kVedioModelUserUserVerified = @"user_verified";
NSString *const kVedioModelUserPoint = @"point";
NSString *const kVedioModelUserFollowers = @"followers";
NSString *const kVedioModelUserCreateTime = @"create_time";
NSString *const kVedioModelUserGender = @"gender";
NSString *const kVedioModelUserName = @"name";


@interface VedioModelUser ()

- (id)objectOrNilForKey:(id)aKey fromDictionary:(NSDictionary *)dict;

@end

@implementation VedioModelUser

@synthesize userIdentifier = _userIdentifier;
@synthesize userDescription = _userDescription;
@synthesize screenName = _screenName;
@synthesize isFollower = _isFollower;
@synthesize avatarUrl = _avatarUrl;
@synthesize ugcCount = _ugcCount;
@synthesize isFollowing = _isFollowing;
@synthesize largeAvatarUrl = _largeAvatarUrl;
@synthesize followings = _followings;
@synthesize userId = _userId;
@synthesize userVerified = _userVerified;
@synthesize point = _point;
@synthesize followers = _followers;
@synthesize createTime = _createTime;
@synthesize gender = _gender;
@synthesize name = _name;


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
            self.userIdentifier = [[self objectOrNilForKey:kVedioModelUserId fromDictionary:dict] doubleValue];
            self.userDescription = [self objectOrNilForKey:kVedioModelUserDescription fromDictionary:dict];
            self.screenName = [self objectOrNilForKey:kVedioModelUserScreenName fromDictionary:dict];
            self.isFollower = [[self objectOrNilForKey:kVedioModelUserIsFollower fromDictionary:dict] boolValue];
            self.avatarUrl = [self objectOrNilForKey:kVedioModelUserAvatarUrl fromDictionary:dict];
            self.ugcCount = [[self objectOrNilForKey:kVedioModelUserUgcCount fromDictionary:dict] doubleValue];
            self.isFollowing = [[self objectOrNilForKey:kVedioModelUserIsFollowing fromDictionary:dict] boolValue];
            self.largeAvatarUrl = [self objectOrNilForKey:kVedioModelUserLargeAvatarUrl fromDictionary:dict];
            self.followings = [[self objectOrNilForKey:kVedioModelUserFollowings fromDictionary:dict] doubleValue];
            self.userId = [[self objectOrNilForKey:kVedioModelUserUserId fromDictionary:dict] doubleValue];
            self.userVerified = [[self objectOrNilForKey:kVedioModelUserUserVerified fromDictionary:dict] boolValue];
            self.point = [[self objectOrNilForKey:kVedioModelUserPoint fromDictionary:dict] doubleValue];
            self.followers = [[self objectOrNilForKey:kVedioModelUserFollowers fromDictionary:dict] doubleValue];
            self.createTime = [[self objectOrNilForKey:kVedioModelUserCreateTime fromDictionary:dict] doubleValue];
            self.gender = [[self objectOrNilForKey:kVedioModelUserGender fromDictionary:dict] doubleValue];
            self.name = [self objectOrNilForKey:kVedioModelUserName fromDictionary:dict];

    }
    
    return self;
    
}

- (NSDictionary *)dictionaryRepresentation
{
    NSMutableDictionary *mutableDict = [NSMutableDictionary dictionary];
    [mutableDict setValue:[NSNumber numberWithDouble:self.userIdentifier] forKey:kVedioModelUserId];
    [mutableDict setValue:self.userDescription forKey:kVedioModelUserDescription];
    [mutableDict setValue:self.screenName forKey:kVedioModelUserScreenName];
    [mutableDict setValue:[NSNumber numberWithBool:self.isFollower] forKey:kVedioModelUserIsFollower];
    [mutableDict setValue:self.avatarUrl forKey:kVedioModelUserAvatarUrl];
    [mutableDict setValue:[NSNumber numberWithDouble:self.ugcCount] forKey:kVedioModelUserUgcCount];
    [mutableDict setValue:[NSNumber numberWithBool:self.isFollowing] forKey:kVedioModelUserIsFollowing];
    [mutableDict setValue:self.largeAvatarUrl forKey:kVedioModelUserLargeAvatarUrl];
    [mutableDict setValue:[NSNumber numberWithDouble:self.followings] forKey:kVedioModelUserFollowings];
    [mutableDict setValue:[NSNumber numberWithDouble:self.userId] forKey:kVedioModelUserUserId];
    [mutableDict setValue:[NSNumber numberWithBool:self.userVerified] forKey:kVedioModelUserUserVerified];
    [mutableDict setValue:[NSNumber numberWithDouble:self.point] forKey:kVedioModelUserPoint];
    [mutableDict setValue:[NSNumber numberWithDouble:self.followers] forKey:kVedioModelUserFollowers];
    [mutableDict setValue:[NSNumber numberWithDouble:self.createTime] forKey:kVedioModelUserCreateTime];
    [mutableDict setValue:[NSNumber numberWithDouble:self.gender] forKey:kVedioModelUserGender];
    [mutableDict setValue:self.name forKey:kVedioModelUserName];

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

    self.userIdentifier = [aDecoder decodeDoubleForKey:kVedioModelUserId];
    self.userDescription = [aDecoder decodeObjectForKey:kVedioModelUserDescription];
    self.screenName = [aDecoder decodeObjectForKey:kVedioModelUserScreenName];
    self.isFollower = [aDecoder decodeBoolForKey:kVedioModelUserIsFollower];
    self.avatarUrl = [aDecoder decodeObjectForKey:kVedioModelUserAvatarUrl];
    self.ugcCount = [aDecoder decodeDoubleForKey:kVedioModelUserUgcCount];
    self.isFollowing = [aDecoder decodeBoolForKey:kVedioModelUserIsFollowing];
    self.largeAvatarUrl = [aDecoder decodeObjectForKey:kVedioModelUserLargeAvatarUrl];
    self.followings = [aDecoder decodeDoubleForKey:kVedioModelUserFollowings];
    self.userId = [aDecoder decodeDoubleForKey:kVedioModelUserUserId];
    self.userVerified = [aDecoder decodeBoolForKey:kVedioModelUserUserVerified];
    self.point = [aDecoder decodeDoubleForKey:kVedioModelUserPoint];
    self.followers = [aDecoder decodeDoubleForKey:kVedioModelUserFollowers];
    self.createTime = [aDecoder decodeDoubleForKey:kVedioModelUserCreateTime];
    self.gender = [aDecoder decodeDoubleForKey:kVedioModelUserGender];
    self.name = [aDecoder decodeObjectForKey:kVedioModelUserName];
    return self;
}

- (void)encodeWithCoder:(NSCoder *)aCoder
{

    [aCoder encodeDouble:_userIdentifier forKey:kVedioModelUserId];
    [aCoder encodeObject:_userDescription forKey:kVedioModelUserDescription];
    [aCoder encodeObject:_screenName forKey:kVedioModelUserScreenName];
    [aCoder encodeBool:_isFollower forKey:kVedioModelUserIsFollower];
    [aCoder encodeObject:_avatarUrl forKey:kVedioModelUserAvatarUrl];
    [aCoder encodeDouble:_ugcCount forKey:kVedioModelUserUgcCount];
    [aCoder encodeBool:_isFollowing forKey:kVedioModelUserIsFollowing];
    [aCoder encodeObject:_largeAvatarUrl forKey:kVedioModelUserLargeAvatarUrl];
    [aCoder encodeDouble:_followings forKey:kVedioModelUserFollowings];
    [aCoder encodeDouble:_userId forKey:kVedioModelUserUserId];
    [aCoder encodeBool:_userVerified forKey:kVedioModelUserUserVerified];
    [aCoder encodeDouble:_point forKey:kVedioModelUserPoint];
    [aCoder encodeDouble:_followers forKey:kVedioModelUserFollowers];
    [aCoder encodeDouble:_createTime forKey:kVedioModelUserCreateTime];
    [aCoder encodeDouble:_gender forKey:kVedioModelUserGender];
    [aCoder encodeObject:_name forKey:kVedioModelUserName];
}

- (id)copyWithZone:(NSZone *)zone
{
    VedioModelUser *copy = [[VedioModelUser alloc] init];
    
    if (copy) {

        copy.userIdentifier = self.userIdentifier;
        copy.userDescription = [self.userDescription copyWithZone:zone];
        copy.screenName = [self.screenName copyWithZone:zone];
        copy.isFollower = self.isFollower;
        copy.avatarUrl = [self.avatarUrl copyWithZone:zone];
        copy.ugcCount = self.ugcCount;
        copy.isFollowing = self.isFollowing;
        copy.largeAvatarUrl = [self.largeAvatarUrl copyWithZone:zone];
        copy.followings = self.followings;
        copy.userId = self.userId;
        copy.userVerified = self.userVerified;
        copy.point = self.point;
        copy.followers = self.followers;
        copy.createTime = self.createTime;
        copy.gender = self.gender;
        copy.name = [self.name copyWithZone:zone];
    }
    
    return copy;
}


@end
