//
//  VedioConmmentModelTopComments.m
//
//  Created by   on 2016/10/14
//  Copyright (c) 2016 __MyCompanyName__. All rights reserved.
//

#import "VedioConmmentModelTopComments.h"
#import "VedioConmmentModelReplyComments.h"


NSString *const kVedioConmmentModelTopCommentsUserName = @"user_name";
NSString *const kVedioConmmentModelTopCommentsUserProfileUrl = @"user_profile_url";
NSString *const kVedioConmmentModelTopCommentsGroupId = @"group_id";
NSString *const kVedioConmmentModelTopCommentsIsDigg = @"is_digg";
NSString *const kVedioConmmentModelTopCommentsUserBury = @"user_bury";
NSString *const kVedioConmmentModelTopCommentsStatus = @"status";
NSString *const kVedioConmmentModelTopCommentsUserId = @"user_id";
NSString *const kVedioConmmentModelTopCommentsCreateTime = @"create_time";
NSString *const kVedioConmmentModelTopCommentsDiggCount = @"digg_count";
NSString *const kVedioConmmentModelTopCommentsShareType = @"share_type";
NSString *const kVedioConmmentModelTopCommentsBuryCount = @"bury_count";
NSString *const kVedioConmmentModelTopCommentsUserVerified = @"user_verified";
NSString *const kVedioConmmentModelTopCommentsShareUrl = @"share_url";
NSString *const kVedioConmmentModelTopCommentsAvatarUrl = @"avatar_url";
NSString *const kVedioConmmentModelTopCommentsPlatformId = @"platform_id";
NSString *const kVedioConmmentModelTopCommentsId = @"id";
NSString *const kVedioConmmentModelTopCommentsPlatform = @"platform";
NSString *const kVedioConmmentModelTopCommentsUserDigg = @"user_digg";
NSString *const kVedioConmmentModelTopCommentsUserProfileImageUrl = @"user_profile_image_url";
NSString *const kVedioConmmentModelTopCommentsText = @"text";
NSString *const kVedioConmmentModelTopCommentsReplyComments = @"reply_comments";
NSString *const kVedioConmmentModelTopCommentsDescription = @"description";


@interface VedioConmmentModelTopComments ()

- (id)objectOrNilForKey:(id)aKey fromDictionary:(NSDictionary *)dict;

@end

@implementation VedioConmmentModelTopComments

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
@synthesize topCommentsIdentifier = _topCommentsIdentifier;
@synthesize platform = _platform;
@synthesize userDigg = _userDigg;
@synthesize userProfileImageUrl = _userProfileImageUrl;
@synthesize text = _text;
@synthesize replyComments = _replyComments;
@synthesize topCommentsDescription = _topCommentsDescription;


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
            self.userName = [self objectOrNilForKey:kVedioConmmentModelTopCommentsUserName fromDictionary:dict];
            self.userProfileUrl = [self objectOrNilForKey:kVedioConmmentModelTopCommentsUserProfileUrl fromDictionary:dict];
            self.groupId = [[self objectOrNilForKey:kVedioConmmentModelTopCommentsGroupId fromDictionary:dict] intValue];
            self.isDigg = [[self objectOrNilForKey:kVedioConmmentModelTopCommentsIsDigg fromDictionary:dict] doubleValue];
            self.userBury = [[self objectOrNilForKey:kVedioConmmentModelTopCommentsUserBury fromDictionary:dict] doubleValue];
            self.status = [[self objectOrNilForKey:kVedioConmmentModelTopCommentsStatus fromDictionary:dict] doubleValue];
            self.userId = [[self objectOrNilForKey:kVedioConmmentModelTopCommentsUserId fromDictionary:dict] doubleValue];
            self.createTime = [[self objectOrNilForKey:kVedioConmmentModelTopCommentsCreateTime fromDictionary:dict] doubleValue];
            self.diggCount = [[self objectOrNilForKey:kVedioConmmentModelTopCommentsDiggCount fromDictionary:dict] doubleValue];
            self.shareType = [[self objectOrNilForKey:kVedioConmmentModelTopCommentsShareType fromDictionary:dict] doubleValue];
            self.buryCount = [[self objectOrNilForKey:kVedioConmmentModelTopCommentsBuryCount fromDictionary:dict] doubleValue];
            self.userVerified = [[self objectOrNilForKey:kVedioConmmentModelTopCommentsUserVerified fromDictionary:dict] boolValue];
            self.shareUrl = [self objectOrNilForKey:kVedioConmmentModelTopCommentsShareUrl fromDictionary:dict];
            self.avatarUrl = [self objectOrNilForKey:kVedioConmmentModelTopCommentsAvatarUrl fromDictionary:dict];
            self.platformId = [self objectOrNilForKey:kVedioConmmentModelTopCommentsPlatformId fromDictionary:dict];
            self.topCommentsIdentifier = [[self objectOrNilForKey:kVedioConmmentModelTopCommentsId fromDictionary:dict] doubleValue];
            self.platform = [self objectOrNilForKey:kVedioConmmentModelTopCommentsPlatform fromDictionary:dict];
            self.userDigg = [[self objectOrNilForKey:kVedioConmmentModelTopCommentsUserDigg fromDictionary:dict] doubleValue];
            self.userProfileImageUrl = [self objectOrNilForKey:kVedioConmmentModelTopCommentsUserProfileImageUrl fromDictionary:dict];
            self.text = [self objectOrNilForKey:kVedioConmmentModelTopCommentsText fromDictionary:dict];
    NSObject *receivedVedioConmmentModelReplyComments = [dict objectForKey:kVedioConmmentModelTopCommentsReplyComments];
    NSMutableArray *parsedVedioConmmentModelReplyComments = [NSMutableArray array];
    if ([receivedVedioConmmentModelReplyComments isKindOfClass:[NSArray class]]) {
        for (NSDictionary *item in (NSArray *)receivedVedioConmmentModelReplyComments) {
            if ([item isKindOfClass:[NSDictionary class]]) {
                [parsedVedioConmmentModelReplyComments addObject:[VedioConmmentModelReplyComments modelObjectWithDictionary:item]];
            }
       }
    } else if ([receivedVedioConmmentModelReplyComments isKindOfClass:[NSDictionary class]]) {
       [parsedVedioConmmentModelReplyComments addObject:[VedioConmmentModelReplyComments modelObjectWithDictionary:(NSDictionary *)receivedVedioConmmentModelReplyComments]];
    }

    self.replyComments = [NSArray arrayWithArray:parsedVedioConmmentModelReplyComments];
            self.topCommentsDescription = [self objectOrNilForKey:kVedioConmmentModelTopCommentsDescription fromDictionary:dict];

    }
    
    return self;
    
}

- (NSDictionary *)dictionaryRepresentation
{
    NSMutableDictionary *mutableDict = [NSMutableDictionary dictionary];
    [mutableDict setValue:self.userName forKey:kVedioConmmentModelTopCommentsUserName];
    [mutableDict setValue:self.userProfileUrl forKey:kVedioConmmentModelTopCommentsUserProfileUrl];
    [mutableDict setValue:[NSNumber numberWithInt:self.groupId] forKey:kVedioConmmentModelTopCommentsGroupId];
    [mutableDict setValue:[NSNumber numberWithDouble:self.isDigg] forKey:kVedioConmmentModelTopCommentsIsDigg];
    [mutableDict setValue:[NSNumber numberWithDouble:self.userBury] forKey:kVedioConmmentModelTopCommentsUserBury];
    [mutableDict setValue:[NSNumber numberWithDouble:self.status] forKey:kVedioConmmentModelTopCommentsStatus];
    [mutableDict setValue:[NSNumber numberWithDouble:self.userId] forKey:kVedioConmmentModelTopCommentsUserId];
    [mutableDict setValue:[NSNumber numberWithDouble:self.createTime] forKey:kVedioConmmentModelTopCommentsCreateTime];
    [mutableDict setValue:[NSNumber numberWithDouble:self.diggCount] forKey:kVedioConmmentModelTopCommentsDiggCount];
    [mutableDict setValue:[NSNumber numberWithDouble:self.shareType] forKey:kVedioConmmentModelTopCommentsShareType];
    [mutableDict setValue:[NSNumber numberWithDouble:self.buryCount] forKey:kVedioConmmentModelTopCommentsBuryCount];
    [mutableDict setValue:[NSNumber numberWithBool:self.userVerified] forKey:kVedioConmmentModelTopCommentsUserVerified];
    [mutableDict setValue:self.shareUrl forKey:kVedioConmmentModelTopCommentsShareUrl];
    [mutableDict setValue:self.avatarUrl forKey:kVedioConmmentModelTopCommentsAvatarUrl];
    [mutableDict setValue:self.platformId forKey:kVedioConmmentModelTopCommentsPlatformId];
    [mutableDict setValue:[NSNumber numberWithDouble:self.topCommentsIdentifier] forKey:kVedioConmmentModelTopCommentsId];
    [mutableDict setValue:self.platform forKey:kVedioConmmentModelTopCommentsPlatform];
    [mutableDict setValue:[NSNumber numberWithDouble:self.userDigg] forKey:kVedioConmmentModelTopCommentsUserDigg];
    [mutableDict setValue:self.userProfileImageUrl forKey:kVedioConmmentModelTopCommentsUserProfileImageUrl];
    [mutableDict setValue:self.text forKey:kVedioConmmentModelTopCommentsText];
    NSMutableArray *tempArrayForReplyComments = [NSMutableArray array];
    for (NSObject *subArrayObject in self.replyComments) {
        if([subArrayObject respondsToSelector:@selector(dictionaryRepresentation)]) {
            // This class is a model object
            [tempArrayForReplyComments addObject:[subArrayObject performSelector:@selector(dictionaryRepresentation)]];
        } else {
            // Generic object
            [tempArrayForReplyComments addObject:subArrayObject];
        }
    }
    [mutableDict setValue:[NSArray arrayWithArray:tempArrayForReplyComments] forKey:kVedioConmmentModelTopCommentsReplyComments];
    [mutableDict setValue:self.topCommentsDescription forKey:kVedioConmmentModelTopCommentsDescription];

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

    self.userName = [aDecoder decodeObjectForKey:kVedioConmmentModelTopCommentsUserName];
    self.userProfileUrl = [aDecoder decodeObjectForKey:kVedioConmmentModelTopCommentsUserProfileUrl];
    self.groupId = [aDecoder decodeIntegerForKey:kVedioConmmentModelTopCommentsGroupId];
    self.isDigg = [aDecoder decodeDoubleForKey:kVedioConmmentModelTopCommentsIsDigg];
    self.userBury = [aDecoder decodeDoubleForKey:kVedioConmmentModelTopCommentsUserBury];
    self.status = [aDecoder decodeDoubleForKey:kVedioConmmentModelTopCommentsStatus];
    self.userId = [aDecoder decodeDoubleForKey:kVedioConmmentModelTopCommentsUserId];
    self.createTime = [aDecoder decodeDoubleForKey:kVedioConmmentModelTopCommentsCreateTime];
    self.diggCount = [aDecoder decodeDoubleForKey:kVedioConmmentModelTopCommentsDiggCount];
    self.shareType = [aDecoder decodeDoubleForKey:kVedioConmmentModelTopCommentsShareType];
    self.buryCount = [aDecoder decodeDoubleForKey:kVedioConmmentModelTopCommentsBuryCount];
    self.userVerified = [aDecoder decodeBoolForKey:kVedioConmmentModelTopCommentsUserVerified];
    self.shareUrl = [aDecoder decodeObjectForKey:kVedioConmmentModelTopCommentsShareUrl];
    self.avatarUrl = [aDecoder decodeObjectForKey:kVedioConmmentModelTopCommentsAvatarUrl];
    self.platformId = [aDecoder decodeObjectForKey:kVedioConmmentModelTopCommentsPlatformId];
    self.topCommentsIdentifier = [aDecoder decodeDoubleForKey:kVedioConmmentModelTopCommentsId];
    self.platform = [aDecoder decodeObjectForKey:kVedioConmmentModelTopCommentsPlatform];
    self.userDigg = [aDecoder decodeDoubleForKey:kVedioConmmentModelTopCommentsUserDigg];
    self.userProfileImageUrl = [aDecoder decodeObjectForKey:kVedioConmmentModelTopCommentsUserProfileImageUrl];
    self.text = [aDecoder decodeObjectForKey:kVedioConmmentModelTopCommentsText];
    self.replyComments = [aDecoder decodeObjectForKey:kVedioConmmentModelTopCommentsReplyComments];
    self.topCommentsDescription = [aDecoder decodeObjectForKey:kVedioConmmentModelTopCommentsDescription];
    return self;
}

- (void)encodeWithCoder:(NSCoder *)aCoder
{

    [aCoder encodeObject:_userName forKey:kVedioConmmentModelTopCommentsUserName];
    [aCoder encodeObject:_userProfileUrl forKey:kVedioConmmentModelTopCommentsUserProfileUrl];
    [aCoder encodeInteger:_groupId forKey:kVedioConmmentModelTopCommentsGroupId];
    [aCoder encodeDouble:_isDigg forKey:kVedioConmmentModelTopCommentsIsDigg];
    [aCoder encodeDouble:_userBury forKey:kVedioConmmentModelTopCommentsUserBury];
    [aCoder encodeDouble:_status forKey:kVedioConmmentModelTopCommentsStatus];
    [aCoder encodeDouble:_userId forKey:kVedioConmmentModelTopCommentsUserId];
    [aCoder encodeDouble:_createTime forKey:kVedioConmmentModelTopCommentsCreateTime];
    [aCoder encodeDouble:_diggCount forKey:kVedioConmmentModelTopCommentsDiggCount];
    [aCoder encodeDouble:_shareType forKey:kVedioConmmentModelTopCommentsShareType];
    [aCoder encodeDouble:_buryCount forKey:kVedioConmmentModelTopCommentsBuryCount];
    [aCoder encodeBool:_userVerified forKey:kVedioConmmentModelTopCommentsUserVerified];
    [aCoder encodeObject:_shareUrl forKey:kVedioConmmentModelTopCommentsShareUrl];
    [aCoder encodeObject:_avatarUrl forKey:kVedioConmmentModelTopCommentsAvatarUrl];
    [aCoder encodeObject:_platformId forKey:kVedioConmmentModelTopCommentsPlatformId];
    [aCoder encodeDouble:_topCommentsIdentifier forKey:kVedioConmmentModelTopCommentsId];
    [aCoder encodeObject:_platform forKey:kVedioConmmentModelTopCommentsPlatform];
    [aCoder encodeDouble:_userDigg forKey:kVedioConmmentModelTopCommentsUserDigg];
    [aCoder encodeObject:_userProfileImageUrl forKey:kVedioConmmentModelTopCommentsUserProfileImageUrl];
    [aCoder encodeObject:_text forKey:kVedioConmmentModelTopCommentsText];
    [aCoder encodeObject:_replyComments forKey:kVedioConmmentModelTopCommentsReplyComments];
    [aCoder encodeObject:_topCommentsDescription forKey:kVedioConmmentModelTopCommentsDescription];
}

- (id)copyWithZone:(NSZone *)zone
{
    VedioConmmentModelTopComments *copy = [[VedioConmmentModelTopComments alloc] init];
    
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
        copy.topCommentsIdentifier = self.topCommentsIdentifier;
        copy.platform = [self.platform copyWithZone:zone];
        copy.userDigg = self.userDigg;
        copy.userProfileImageUrl = [self.userProfileImageUrl copyWithZone:zone];
        copy.text = [self.text copyWithZone:zone];
        copy.replyComments = [self.replyComments copyWithZone:zone];
        copy.topCommentsDescription = [self.topCommentsDescription copyWithZone:zone];
    }
    
    return copy;
}


@end
