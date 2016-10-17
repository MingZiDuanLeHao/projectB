//
//  VedioModelComments.m
//
//  Created by   on 2016/10/12
//  Copyright (c) 2016 __MyCompanyName__. All rights reserved.
//

#import "VedioModelComments.h"


NSString *const kVedioModelCommentsUserName = @"user_name";
NSString *const kVedioModelCommentsUserProfileUrl = @"user_profile_url";
NSString *const kVedioModelCommentsGroupId = @"group_id";
NSString *const kVedioModelCommentsIsDigg = @"is_digg";
NSString *const kVedioModelCommentsUserBury = @"user_bury";
NSString *const kVedioModelCommentsStatus = @"status";
NSString *const kVedioModelCommentsUserId = @"user_id";
NSString *const kVedioModelCommentsCreateTime = @"create_time";
NSString *const kVedioModelCommentsDiggCount = @"digg_count";
NSString *const kVedioModelCommentsShareType = @"share_type";
NSString *const kVedioModelCommentsBuryCount = @"bury_count";
NSString *const kVedioModelCommentsUserVerified = @"user_verified";
NSString *const kVedioModelCommentsShareUrl = @"share_url";
NSString *const kVedioModelCommentsAvatarUrl = @"avatar_url";
NSString *const kVedioModelCommentsPlatformId = @"platform_id";
NSString *const kVedioModelCommentsId = @"id";
NSString *const kVedioModelCommentsPlatform = @"platform";
NSString *const kVedioModelCommentsUserDigg = @"user_digg";
NSString *const kVedioModelCommentsUserProfileImageUrl = @"user_profile_image_url";
NSString *const kVedioModelCommentsText = @"text";
NSString *const kVedioModelCommentsDescription = @"description";


@interface VedioModelComments ()

- (id)objectOrNilForKey:(id)aKey fromDictionary:(NSDictionary *)dict;

@end

@implementation VedioModelComments

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
@synthesize commentsIdentifier = _commentsIdentifier;
@synthesize platform = _platform;
@synthesize userDigg = _userDigg;
@synthesize userProfileImageUrl = _userProfileImageUrl;
@synthesize text = _text;
@synthesize commentsDescription = _commentsDescription;


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
            self.userName = [self objectOrNilForKey:kVedioModelCommentsUserName fromDictionary:dict];
            self.userProfileUrl = [self objectOrNilForKey:kVedioModelCommentsUserProfileUrl fromDictionary:dict];
            self.groupId = [[self objectOrNilForKey:kVedioModelCommentsGroupId fromDictionary:dict] doubleValue];
            self.isDigg = [[self objectOrNilForKey:kVedioModelCommentsIsDigg fromDictionary:dict] doubleValue];
            self.userBury = [[self objectOrNilForKey:kVedioModelCommentsUserBury fromDictionary:dict] doubleValue];
            self.status = [[self objectOrNilForKey:kVedioModelCommentsStatus fromDictionary:dict] doubleValue];
            self.userId = [[self objectOrNilForKey:kVedioModelCommentsUserId fromDictionary:dict] doubleValue];
            self.createTime = [[self objectOrNilForKey:kVedioModelCommentsCreateTime fromDictionary:dict] doubleValue];
            self.diggCount = [[self objectOrNilForKey:kVedioModelCommentsDiggCount fromDictionary:dict] doubleValue];
            self.shareType = [[self objectOrNilForKey:kVedioModelCommentsShareType fromDictionary:dict] doubleValue];
            self.buryCount = [[self objectOrNilForKey:kVedioModelCommentsBuryCount fromDictionary:dict] doubleValue];
            self.userVerified = [[self objectOrNilForKey:kVedioModelCommentsUserVerified fromDictionary:dict] boolValue];
            self.shareUrl = [self objectOrNilForKey:kVedioModelCommentsShareUrl fromDictionary:dict];
            self.avatarUrl = [self objectOrNilForKey:kVedioModelCommentsAvatarUrl fromDictionary:dict];
            self.platformId = [self objectOrNilForKey:kVedioModelCommentsPlatformId fromDictionary:dict];
            self.commentsIdentifier = [[self objectOrNilForKey:kVedioModelCommentsId fromDictionary:dict] doubleValue];
            self.platform = [self objectOrNilForKey:kVedioModelCommentsPlatform fromDictionary:dict];
            self.userDigg = [[self objectOrNilForKey:kVedioModelCommentsUserDigg fromDictionary:dict] doubleValue];
            self.userProfileImageUrl = [self objectOrNilForKey:kVedioModelCommentsUserProfileImageUrl fromDictionary:dict];
            self.text = [self objectOrNilForKey:kVedioModelCommentsText fromDictionary:dict];
            self.commentsDescription = [self objectOrNilForKey:kVedioModelCommentsDescription fromDictionary:dict];

    }
    
    return self;
    
}

- (NSDictionary *)dictionaryRepresentation
{
    NSMutableDictionary *mutableDict = [NSMutableDictionary dictionary];
    [mutableDict setValue:self.userName forKey:kVedioModelCommentsUserName];
    [mutableDict setValue:self.userProfileUrl forKey:kVedioModelCommentsUserProfileUrl];
    [mutableDict setValue:[NSNumber numberWithDouble:self.groupId] forKey:kVedioModelCommentsGroupId];
    [mutableDict setValue:[NSNumber numberWithDouble:self.isDigg] forKey:kVedioModelCommentsIsDigg];
    [mutableDict setValue:[NSNumber numberWithDouble:self.userBury] forKey:kVedioModelCommentsUserBury];
    [mutableDict setValue:[NSNumber numberWithDouble:self.status] forKey:kVedioModelCommentsStatus];
    [mutableDict setValue:[NSNumber numberWithDouble:self.userId] forKey:kVedioModelCommentsUserId];
    [mutableDict setValue:[NSNumber numberWithDouble:self.createTime] forKey:kVedioModelCommentsCreateTime];
    [mutableDict setValue:[NSNumber numberWithDouble:self.diggCount] forKey:kVedioModelCommentsDiggCount];
    [mutableDict setValue:[NSNumber numberWithDouble:self.shareType] forKey:kVedioModelCommentsShareType];
    [mutableDict setValue:[NSNumber numberWithDouble:self.buryCount] forKey:kVedioModelCommentsBuryCount];
    [mutableDict setValue:[NSNumber numberWithBool:self.userVerified] forKey:kVedioModelCommentsUserVerified];
    [mutableDict setValue:self.shareUrl forKey:kVedioModelCommentsShareUrl];
    [mutableDict setValue:self.avatarUrl forKey:kVedioModelCommentsAvatarUrl];
    [mutableDict setValue:self.platformId forKey:kVedioModelCommentsPlatformId];
    [mutableDict setValue:[NSNumber numberWithDouble:self.commentsIdentifier] forKey:kVedioModelCommentsId];
    [mutableDict setValue:self.platform forKey:kVedioModelCommentsPlatform];
    [mutableDict setValue:[NSNumber numberWithDouble:self.userDigg] forKey:kVedioModelCommentsUserDigg];
    [mutableDict setValue:self.userProfileImageUrl forKey:kVedioModelCommentsUserProfileImageUrl];
    [mutableDict setValue:self.text forKey:kVedioModelCommentsText];
    [mutableDict setValue:self.commentsDescription forKey:kVedioModelCommentsDescription];

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

    self.userName = [aDecoder decodeObjectForKey:kVedioModelCommentsUserName];
    self.userProfileUrl = [aDecoder decodeObjectForKey:kVedioModelCommentsUserProfileUrl];
    self.groupId = [aDecoder decodeDoubleForKey:kVedioModelCommentsGroupId];
    self.isDigg = [aDecoder decodeDoubleForKey:kVedioModelCommentsIsDigg];
    self.userBury = [aDecoder decodeDoubleForKey:kVedioModelCommentsUserBury];
    self.status = [aDecoder decodeDoubleForKey:kVedioModelCommentsStatus];
    self.userId = [aDecoder decodeDoubleForKey:kVedioModelCommentsUserId];
    self.createTime = [aDecoder decodeDoubleForKey:kVedioModelCommentsCreateTime];
    self.diggCount = [aDecoder decodeDoubleForKey:kVedioModelCommentsDiggCount];
    self.shareType = [aDecoder decodeDoubleForKey:kVedioModelCommentsShareType];
    self.buryCount = [aDecoder decodeDoubleForKey:kVedioModelCommentsBuryCount];
    self.userVerified = [aDecoder decodeBoolForKey:kVedioModelCommentsUserVerified];
    self.shareUrl = [aDecoder decodeObjectForKey:kVedioModelCommentsShareUrl];
    self.avatarUrl = [aDecoder decodeObjectForKey:kVedioModelCommentsAvatarUrl];
    self.platformId = [aDecoder decodeObjectForKey:kVedioModelCommentsPlatformId];
    self.commentsIdentifier = [aDecoder decodeDoubleForKey:kVedioModelCommentsId];
    self.platform = [aDecoder decodeObjectForKey:kVedioModelCommentsPlatform];
    self.userDigg = [aDecoder decodeDoubleForKey:kVedioModelCommentsUserDigg];
    self.userProfileImageUrl = [aDecoder decodeObjectForKey:kVedioModelCommentsUserProfileImageUrl];
    self.text = [aDecoder decodeObjectForKey:kVedioModelCommentsText];
    self.commentsDescription = [aDecoder decodeObjectForKey:kVedioModelCommentsDescription];
    return self;
}

- (void)encodeWithCoder:(NSCoder *)aCoder
{

    [aCoder encodeObject:_userName forKey:kVedioModelCommentsUserName];
    [aCoder encodeObject:_userProfileUrl forKey:kVedioModelCommentsUserProfileUrl];
    [aCoder encodeDouble:_groupId forKey:kVedioModelCommentsGroupId];
    [aCoder encodeDouble:_isDigg forKey:kVedioModelCommentsIsDigg];
    [aCoder encodeDouble:_userBury forKey:kVedioModelCommentsUserBury];
    [aCoder encodeDouble:_status forKey:kVedioModelCommentsStatus];
    [aCoder encodeDouble:_userId forKey:kVedioModelCommentsUserId];
    [aCoder encodeDouble:_createTime forKey:kVedioModelCommentsCreateTime];
    [aCoder encodeDouble:_diggCount forKey:kVedioModelCommentsDiggCount];
    [aCoder encodeDouble:_shareType forKey:kVedioModelCommentsShareType];
    [aCoder encodeDouble:_buryCount forKey:kVedioModelCommentsBuryCount];
    [aCoder encodeBool:_userVerified forKey:kVedioModelCommentsUserVerified];
    [aCoder encodeObject:_shareUrl forKey:kVedioModelCommentsShareUrl];
    [aCoder encodeObject:_avatarUrl forKey:kVedioModelCommentsAvatarUrl];
    [aCoder encodeObject:_platformId forKey:kVedioModelCommentsPlatformId];
    [aCoder encodeDouble:_commentsIdentifier forKey:kVedioModelCommentsId];
    [aCoder encodeObject:_platform forKey:kVedioModelCommentsPlatform];
    [aCoder encodeDouble:_userDigg forKey:kVedioModelCommentsUserDigg];
    [aCoder encodeObject:_userProfileImageUrl forKey:kVedioModelCommentsUserProfileImageUrl];
    [aCoder encodeObject:_text forKey:kVedioModelCommentsText];
    [aCoder encodeObject:_commentsDescription forKey:kVedioModelCommentsDescription];
}

- (id)copyWithZone:(NSZone *)zone
{
    VedioModelComments *copy = [[VedioModelComments alloc] init];
    
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
        copy.commentsIdentifier = self.commentsIdentifier;
        copy.platform = [self.platform copyWithZone:zone];
        copy.userDigg = self.userDigg;
        copy.userProfileImageUrl = [self.userProfileImageUrl copyWithZone:zone];
        copy.text = [self.text copyWithZone:zone];
        copy.commentsDescription = [self.commentsDescription copyWithZone:zone];
    }
    
    return copy;
}


@end
