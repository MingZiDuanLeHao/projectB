//
//  VedioConmmentModelRecentComments.m
//
//  Created by   on 2016/10/14
//  Copyright (c) 2016 __MyCompanyName__. All rights reserved.
//

#import "VedioConmmentModelRecentComments.h"


NSString *const kVedioConmmentModelRecentCommentsUserName = @"user_name";
NSString *const kVedioConmmentModelRecentCommentsUserProfileUrl = @"user_profile_url";
NSString *const kVedioConmmentModelRecentCommentsGroupId = @"group_id";
NSString *const kVedioConmmentModelRecentCommentsIsDigg = @"is_digg";
NSString *const kVedioConmmentModelRecentCommentsUserBury = @"user_bury";
NSString *const kVedioConmmentModelRecentCommentsStatus = @"status";
NSString *const kVedioConmmentModelRecentCommentsUserId = @"user_id";
NSString *const kVedioConmmentModelRecentCommentsCreateTime = @"create_time";
NSString *const kVedioConmmentModelRecentCommentsDiggCount = @"digg_count";
NSString *const kVedioConmmentModelRecentCommentsShareType = @"share_type";
NSString *const kVedioConmmentModelRecentCommentsBuryCount = @"bury_count";
NSString *const kVedioConmmentModelRecentCommentsUserVerified = @"user_verified";
NSString *const kVedioConmmentModelRecentCommentsShareUrl = @"share_url";
NSString *const kVedioConmmentModelRecentCommentsAvatarUrl = @"avatar_url";
NSString *const kVedioConmmentModelRecentCommentsPlatformId = @"platform_id";
NSString *const kVedioConmmentModelRecentCommentsId = @"id";
NSString *const kVedioConmmentModelRecentCommentsPlatform = @"platform";
NSString *const kVedioConmmentModelRecentCommentsUserDigg = @"user_digg";
NSString *const kVedioConmmentModelRecentCommentsUserProfileImageUrl = @"user_profile_image_url";
NSString *const kVedioConmmentModelRecentCommentsText = @"text";
NSString *const kVedioConmmentModelRecentCommentsDescription = @"description";


@interface VedioConmmentModelRecentComments ()

- (id)objectOrNilForKey:(id)aKey fromDictionary:(NSDictionary *)dict;

@end

@implementation VedioConmmentModelRecentComments

@synthesize userName = _userName;
@synthesize userProfileUrl = _userProfileUrl;
@synthesize groupId = _groupId;
@synthesize isDigg = _isDigg;
@synthesize userBury = _userBury;
@synthesize status = _status;
@synthesize userId = _userId;
@synthesize createTime = _createTime;
@synthesize diggCount = _diggCount;
@synthesize shareType = _shareType;
@synthesize buryCount = _buryCount;
@synthesize userVerified = _userVerified;
@synthesize shareUrl = _shareUrl;
@synthesize avatarUrl = _avatarUrl;
@synthesize platformId = _platformId;
@synthesize recentCommentsIdentifier = _recentCommentsIdentifier;
@synthesize platform = _platform;
@synthesize userDigg = _userDigg;
@synthesize userProfileImageUrl = _userProfileImageUrl;
@synthesize text = _text;
@synthesize recentCommentsDescription = _recentCommentsDescription;


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
            self.userName = [self objectOrNilForKey:kVedioConmmentModelRecentCommentsUserName fromDictionary:dict];
            self.userProfileUrl = [self objectOrNilForKey:kVedioConmmentModelRecentCommentsUserProfileUrl fromDictionary:dict];
            self.groupId = [[self objectOrNilForKey:kVedioConmmentModelRecentCommentsGroupId fromDictionary:dict] intValue];
            self.isDigg = [[self objectOrNilForKey:kVedioConmmentModelRecentCommentsIsDigg fromDictionary:dict] doubleValue];
            self.userBury = [[self objectOrNilForKey:kVedioConmmentModelRecentCommentsUserBury fromDictionary:dict] doubleValue];
            self.status = [[self objectOrNilForKey:kVedioConmmentModelRecentCommentsStatus fromDictionary:dict] doubleValue];
            self.userId = [[self objectOrNilForKey:kVedioConmmentModelRecentCommentsUserId fromDictionary:dict] doubleValue];
            self.createTime = [[self objectOrNilForKey:kVedioConmmentModelRecentCommentsCreateTime fromDictionary:dict] doubleValue];
            self.diggCount = [[self objectOrNilForKey:kVedioConmmentModelRecentCommentsDiggCount fromDictionary:dict] doubleValue];
            self.shareType = [[self objectOrNilForKey:kVedioConmmentModelRecentCommentsShareType fromDictionary:dict] doubleValue];
            self.buryCount = [[self objectOrNilForKey:kVedioConmmentModelRecentCommentsBuryCount fromDictionary:dict] doubleValue];
            self.userVerified = [[self objectOrNilForKey:kVedioConmmentModelRecentCommentsUserVerified fromDictionary:dict] boolValue];
            self.shareUrl = [self objectOrNilForKey:kVedioConmmentModelRecentCommentsShareUrl fromDictionary:dict];
            self.avatarUrl = [self objectOrNilForKey:kVedioConmmentModelRecentCommentsAvatarUrl fromDictionary:dict];
            self.platformId = [self objectOrNilForKey:kVedioConmmentModelRecentCommentsPlatformId fromDictionary:dict];
            self.recentCommentsIdentifier = [[self objectOrNilForKey:kVedioConmmentModelRecentCommentsId fromDictionary:dict] doubleValue];
            self.platform = [self objectOrNilForKey:kVedioConmmentModelRecentCommentsPlatform fromDictionary:dict];
            self.userDigg = [[self objectOrNilForKey:kVedioConmmentModelRecentCommentsUserDigg fromDictionary:dict] doubleValue];
            self.userProfileImageUrl = [self objectOrNilForKey:kVedioConmmentModelRecentCommentsUserProfileImageUrl fromDictionary:dict];
            self.text = [self objectOrNilForKey:kVedioConmmentModelRecentCommentsText fromDictionary:dict];
            self.recentCommentsDescription = [self objectOrNilForKey:kVedioConmmentModelRecentCommentsDescription fromDictionary:dict];

    }
    
    return self;
    
}

- (NSDictionary *)dictionaryRepresentation
{
    NSMutableDictionary *mutableDict = [NSMutableDictionary dictionary];
    [mutableDict setValue:self.userName forKey:kVedioConmmentModelRecentCommentsUserName];
    [mutableDict setValue:self.userProfileUrl forKey:kVedioConmmentModelRecentCommentsUserProfileUrl];
    [mutableDict setValue:[NSNumber numberWithInt:self.groupId] forKey:kVedioConmmentModelRecentCommentsGroupId];
    [mutableDict setValue:[NSNumber numberWithDouble:self.isDigg] forKey:kVedioConmmentModelRecentCommentsIsDigg];
    [mutableDict setValue:[NSNumber numberWithDouble:self.userBury] forKey:kVedioConmmentModelRecentCommentsUserBury];
    [mutableDict setValue:[NSNumber numberWithDouble:self.status] forKey:kVedioConmmentModelRecentCommentsStatus];
    [mutableDict setValue:[NSNumber numberWithDouble:self.userId] forKey:kVedioConmmentModelRecentCommentsUserId];
    [mutableDict setValue:[NSNumber numberWithDouble:self.createTime] forKey:kVedioConmmentModelRecentCommentsCreateTime];
    [mutableDict setValue:[NSNumber numberWithDouble:self.diggCount] forKey:kVedioConmmentModelRecentCommentsDiggCount];
    [mutableDict setValue:[NSNumber numberWithDouble:self.shareType] forKey:kVedioConmmentModelRecentCommentsShareType];
    [mutableDict setValue:[NSNumber numberWithDouble:self.buryCount] forKey:kVedioConmmentModelRecentCommentsBuryCount];
    [mutableDict setValue:[NSNumber numberWithBool:self.userVerified] forKey:kVedioConmmentModelRecentCommentsUserVerified];
    [mutableDict setValue:self.shareUrl forKey:kVedioConmmentModelRecentCommentsShareUrl];
    [mutableDict setValue:self.avatarUrl forKey:kVedioConmmentModelRecentCommentsAvatarUrl];
    [mutableDict setValue:self.platformId forKey:kVedioConmmentModelRecentCommentsPlatformId];
    [mutableDict setValue:[NSNumber numberWithDouble:self.recentCommentsIdentifier] forKey:kVedioConmmentModelRecentCommentsId];
    [mutableDict setValue:self.platform forKey:kVedioConmmentModelRecentCommentsPlatform];
    [mutableDict setValue:[NSNumber numberWithDouble:self.userDigg] forKey:kVedioConmmentModelRecentCommentsUserDigg];
    [mutableDict setValue:self.userProfileImageUrl forKey:kVedioConmmentModelRecentCommentsUserProfileImageUrl];
    [mutableDict setValue:self.text forKey:kVedioConmmentModelRecentCommentsText];
    [mutableDict setValue:self.recentCommentsDescription forKey:kVedioConmmentModelRecentCommentsDescription];

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

    self.userName = [aDecoder decodeObjectForKey:kVedioConmmentModelRecentCommentsUserName];
    self.userProfileUrl = [aDecoder decodeObjectForKey:kVedioConmmentModelRecentCommentsUserProfileUrl];
    self.groupId = [aDecoder decodeIntegerForKey:kVedioConmmentModelRecentCommentsGroupId];
    self.isDigg = [aDecoder decodeDoubleForKey:kVedioConmmentModelRecentCommentsIsDigg];
    self.userBury = [aDecoder decodeDoubleForKey:kVedioConmmentModelRecentCommentsUserBury];
    self.status = [aDecoder decodeDoubleForKey:kVedioConmmentModelRecentCommentsStatus];
    self.userId = [aDecoder decodeDoubleForKey:kVedioConmmentModelRecentCommentsUserId];
    self.createTime = [aDecoder decodeDoubleForKey:kVedioConmmentModelRecentCommentsCreateTime];
    self.diggCount = [aDecoder decodeDoubleForKey:kVedioConmmentModelRecentCommentsDiggCount];
    self.shareType = [aDecoder decodeDoubleForKey:kVedioConmmentModelRecentCommentsShareType];
    self.buryCount = [aDecoder decodeDoubleForKey:kVedioConmmentModelRecentCommentsBuryCount];
    self.userVerified = [aDecoder decodeBoolForKey:kVedioConmmentModelRecentCommentsUserVerified];
    self.shareUrl = [aDecoder decodeObjectForKey:kVedioConmmentModelRecentCommentsShareUrl];
    self.avatarUrl = [aDecoder decodeObjectForKey:kVedioConmmentModelRecentCommentsAvatarUrl];
    self.platformId = [aDecoder decodeObjectForKey:kVedioConmmentModelRecentCommentsPlatformId];
    self.recentCommentsIdentifier = [aDecoder decodeDoubleForKey:kVedioConmmentModelRecentCommentsId];
    self.platform = [aDecoder decodeObjectForKey:kVedioConmmentModelRecentCommentsPlatform];
    self.userDigg = [aDecoder decodeDoubleForKey:kVedioConmmentModelRecentCommentsUserDigg];
    self.userProfileImageUrl = [aDecoder decodeObjectForKey:kVedioConmmentModelRecentCommentsUserProfileImageUrl];
    self.text = [aDecoder decodeObjectForKey:kVedioConmmentModelRecentCommentsText];
    self.recentCommentsDescription = [aDecoder decodeObjectForKey:kVedioConmmentModelRecentCommentsDescription];
    return self;
}

- (void)encodeWithCoder:(NSCoder *)aCoder
{

    [aCoder encodeObject:_userName forKey:kVedioConmmentModelRecentCommentsUserName];
    [aCoder encodeObject:_userProfileUrl forKey:kVedioConmmentModelRecentCommentsUserProfileUrl];
    [aCoder encodeInteger:_groupId forKey:kVedioConmmentModelRecentCommentsGroupId];
    [aCoder encodeDouble:_isDigg forKey:kVedioConmmentModelRecentCommentsIsDigg];
    [aCoder encodeDouble:_userBury forKey:kVedioConmmentModelRecentCommentsUserBury];
    [aCoder encodeDouble:_status forKey:kVedioConmmentModelRecentCommentsStatus];
    [aCoder encodeDouble:_userId forKey:kVedioConmmentModelRecentCommentsUserId];
    [aCoder encodeDouble:_createTime forKey:kVedioConmmentModelRecentCommentsCreateTime];
    [aCoder encodeDouble:_diggCount forKey:kVedioConmmentModelRecentCommentsDiggCount];
    [aCoder encodeDouble:_shareType forKey:kVedioConmmentModelRecentCommentsShareType];
    [aCoder encodeDouble:_buryCount forKey:kVedioConmmentModelRecentCommentsBuryCount];
    [aCoder encodeBool:_userVerified forKey:kVedioConmmentModelRecentCommentsUserVerified];
    [aCoder encodeObject:_shareUrl forKey:kVedioConmmentModelRecentCommentsShareUrl];
    [aCoder encodeObject:_avatarUrl forKey:kVedioConmmentModelRecentCommentsAvatarUrl];
    [aCoder encodeObject:_platformId forKey:kVedioConmmentModelRecentCommentsPlatformId];
    [aCoder encodeDouble:_recentCommentsIdentifier forKey:kVedioConmmentModelRecentCommentsId];
    [aCoder encodeObject:_platform forKey:kVedioConmmentModelRecentCommentsPlatform];
    [aCoder encodeDouble:_userDigg forKey:kVedioConmmentModelRecentCommentsUserDigg];
    [aCoder encodeObject:_userProfileImageUrl forKey:kVedioConmmentModelRecentCommentsUserProfileImageUrl];
    [aCoder encodeObject:_text forKey:kVedioConmmentModelRecentCommentsText];
    [aCoder encodeObject:_recentCommentsDescription forKey:kVedioConmmentModelRecentCommentsDescription];
}

- (id)copyWithZone:(NSZone *)zone
{
    VedioConmmentModelRecentComments *copy = [[VedioConmmentModelRecentComments alloc] init];
    
    if (copy) {

        copy.userName = [self.userName copyWithZone:zone];
        copy.userProfileUrl = [self.userProfileUrl copyWithZone:zone];
        copy.groupId = self.groupId;
        copy.isDigg = self.isDigg;
        copy.userBury = self.userBury;
        copy.status = self.status;
        copy.userId = self.userId;
        copy.createTime = self.createTime;
        copy.diggCount = self.diggCount;
        copy.shareType = self.shareType;
        copy.buryCount = self.buryCount;
        copy.userVerified = self.userVerified;
        copy.shareUrl = [self.shareUrl copyWithZone:zone];
        copy.avatarUrl = [self.avatarUrl copyWithZone:zone];
        copy.platformId = [self.platformId copyWithZone:zone];
        copy.recentCommentsIdentifier = self.recentCommentsIdentifier;
        copy.platform = [self.platform copyWithZone:zone];
        copy.userDigg = self.userDigg;
        copy.userProfileImageUrl = [self.userProfileImageUrl copyWithZone:zone];
        copy.text = [self.text copyWithZone:zone];
        copy.recentCommentsDescription = [self.recentCommentsDescription copyWithZone:zone];
    }
    
    return copy;
}


@end
