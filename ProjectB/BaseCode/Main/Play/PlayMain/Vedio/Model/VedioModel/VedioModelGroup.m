//
//  VedioModelGroup.m
//
//  Created by   on 2016/10/12
//  Copyright (c) 2016 __MyCompanyName__. All rights reserved.
//

#import "VedioModelGroup.h"
#import "VedioModelUser.h"
#import "VedioModelOriginVideo.h"
#import "VedioModelNeihanHotLink.h"
#import "VedioModelDislikeReason.h"
#import "VedioModelLargeCover.h"
#import "VedioModelMediumCover.h"
#import "VedioModelSTZpVideo.h"
#import "VedioModelActivity.h"


NSString *const kVedioModelGroupUserFavorite = @"user_favorite";
NSString *const kVedioModelGroupUser = @"user";
NSString *const kVedioModelGroupPublishTime = @"publish_time";
NSString *const kVedioModelGroupUri = @"uri";
NSString *const kVedioModelGroupId = @"id";
NSString *const kVedioModelGroupOriginVideo = @"origin_video";
NSString *const kVedioModelGroupPlayCount = @"play_count";
NSString *const kVedioModelGroupDisplayType = @"display_type";
NSString *const kVedioModelGroupGroupId = @"group_id";
NSString *const kVedioModelGroupCategoryVisible = @"category_visible";
NSString *const kVedioModelGroupFlashUrl = @"flash_url";
NSString *const kVedioModelGroupNeihanHotLink = @"neihan_hot_link";
NSString *const kVedioModelGroupTitle = @"title";
NSString *const kVedioModelGroupUserRepin = @"user_repin";
NSString *const kVedioModelGroupCoverImageUri = @"cover_image_uri";
NSString *const kVedioModelGroupStatusDesc = @"status_desc";
NSString *const kVedioModelGroupStatus = @"status";
NSString *const kVedioModelGroupDislikeReason = @"dislike_reason";
NSString *const kVedioModelGroupCoverImageUrl = @"cover_image_url";
NSString *const kVedioModelGroupRepinCount = @"repin_count";
NSString *const kVedioModelGroupShareCount = @"share_count";
NSString *const kVedioModelGroupType = @"type";
NSString *const kVedioModelGroupDiggCount = @"digg_count";
NSString *const kVedioModelGroupVideoWidth = @"video_width";
NSString *const kVedioModelGroupNeihanHotStartTime = @"neihan_hot_start_time";
NSString *const kVedioModelGroupIsVideo = @"is_video";
NSString *const kVedioModelGroupHasHotComments = @"has_hot_comments";
NSString *const kVedioModelGroupCommentCount = @"comment_count";
NSString *const kVedioModelGroupGoDetailCount = @"go_detail_count";
NSString *const kVedioModelGroupFavoriteCount = @"favorite_count";
NSString *const kVedioModelGroupLargeCover = @"large_cover";
NSString *const kVedioModelGroupText = @"text";
NSString *const kVedioModelGroupCategoryName = @"category_name";
NSString *const kVedioModelGroupOnlineTime = @"online_time";
NSString *const kVedioModelGroupUserDigg = @"user_digg";
NSString *const kVedioModelGroupCreateTime = @"create_time";
NSString *const kVedioModelGroupCategoryId = @"category_id";
NSString *const kVedioModelGroupCategoryType = @"category_type";
NSString *const kVedioModelGroupShareUrl = @"share_url";
NSString *const kVedioModelGroupIsAnonymous = @"is_anonymous";
NSString *const kVedioModelGroupQuickComment = @"quick_comment";
NSString *const kVedioModelGroupBuryCount = @"bury_count";
NSString *const kVedioModelGroupUserBury = @"user_bury";
NSString *const kVedioModelGroupMediaType = @"media_type";
NSString *const kVedioModelGroupMediumCover = @"medium_cover";
NSString *const kVedioModelGroupShareType = @"share_type";
NSString *const kVedioModelGroupDuration = @"duration";
NSString *const kVedioModelGroupVideoHeight = @"video_height";
NSString *const kVedioModelGroupIsPublicUrl = @"is_public_url";
NSString *const kVedioModelGroupContent = @"content";
NSString *const kVedioModelGroupNeihanHotEndTime = @"neihan_hot_end_time";
NSString *const kVedioModelGroupIsCanShare = @"is_can_share";
NSString *const kVedioModelGroupIsNeihanHot = @"is_neihan_hot";
NSString *const kVedioModelGroupMp4Url = @"mp4_url";
NSString *const kVedioModelGroupHasComments = @"has_comments";
NSString *const kVedioModelGroupKeywords = @"keywords";
NSString *const kVedioModelGroupSTZpVideo = @"STZp_video";
NSString *const kVedioModelGroupM3u8Url = @"m3u8_url";
NSString *const kVedioModelGroupLabel = @"label";
NSString *const kVedioModelGroupIdStr = @"id_str";
NSString *const kVedioModelGroupActivity = @"activity";
NSString *const kVedioModelGroupAllowDislike = @"allow_dislike";


@interface VedioModelGroup ()

- (id)objectOrNilForKey:(id)aKey fromDictionary:(NSDictionary *)dict;

@end

@implementation VedioModelGroup

@synthesize userFavorite = _userFavorite;
@synthesize user = _user;
@synthesize publishTime = _publishTime;
@synthesize uri = _uri;
@synthesize groupIdentifier = _groupIdentifier;
@synthesize originVideo = _originVideo;
@synthesize playCount = _playCount;
@synthesize displayType = _displayType;
@synthesize groupId = _groupId;
@synthesize categoryVisible = _categoryVisible;
@synthesize flashUrl = _flashUrl;
@synthesize neihanHotLink = _neihanHotLink;
@synthesize title = _title;
@synthesize userRepin = _userRepin;
@synthesize coverImageUri = _coverImageUri;
@synthesize statusDesc = _statusDesc;
@synthesize status = _status;
@synthesize dislikeReason = _dislikeReason;
@synthesize coverImageUrl = _coverImageUrl;
@synthesize repinCount = _repinCount;
@synthesize shareCount = _shareCount;
@synthesize type = _type;
@synthesize diggCount = _diggCount;
@synthesize videoWidth = _videoWidth;
@synthesize neihanHotStartTime = _neihanHotStartTime;
@synthesize isVideo = _isVideo;
@synthesize hasHotComments = _hasHotComments;
@synthesize commentCount = _commentCount;
@synthesize goDetailCount = _goDetailCount;
@synthesize favoriteCount = _favoriteCount;
@synthesize largeCover = _largeCover;
@synthesize text = _text;
@synthesize categoryName = _categoryName;
@synthesize onlineTime = _onlineTime;
@synthesize userDigg = _userDigg;
@synthesize createTime = _createTime;
@synthesize categoryId = _categoryId;
@synthesize categoryType = _categoryType;
@synthesize shareUrl = _shareUrl;
@synthesize isAnonymous = _isAnonymous;
@synthesize quickComment = _quickComment;
@synthesize buryCount = _buryCount;
@synthesize userBury = _userBury;
@synthesize mediaType = _mediaType;
@synthesize mediumCover = _mediumCover;
@synthesize shareType = _shareType;
@synthesize duration = _duration;
@synthesize videoHeight = _videoHeight;
@synthesize isPublicUrl = _isPublicUrl;
@synthesize content = _content;
@synthesize neihanHotEndTime = _neihanHotEndTime;
@synthesize isCanShare = _isCanShare;
@synthesize isNeihanHot = _isNeihanHot;
@synthesize mp4Url = _mp4Url;
@synthesize hasComments = _hasComments;
@synthesize keywords = _keywords;
@synthesize STZpVideo = _STZpVideo;
@synthesize m3u8Url = _m3u8Url;
@synthesize label = _label;
@synthesize idStr = _idStr;
@synthesize activity = _activity;
@synthesize allowDislike = _allowDislike;


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
            self.userFavorite = [[self objectOrNilForKey:kVedioModelGroupUserFavorite fromDictionary:dict] doubleValue];
            self.user = [VedioModelUser modelObjectWithDictionary:[dict objectForKey:kVedioModelGroupUser]];
            self.publishTime = [self objectOrNilForKey:kVedioModelGroupPublishTime fromDictionary:dict];
            self.uri = [self objectOrNilForKey:kVedioModelGroupUri fromDictionary:dict];
            self.groupIdentifier = [[self objectOrNilForKey:kVedioModelGroupId fromDictionary:dict] doubleValue];
            self.originVideo = [VedioModelOriginVideo modelObjectWithDictionary:[dict objectForKey:kVedioModelGroupOriginVideo]];
            self.playCount = [[self objectOrNilForKey:kVedioModelGroupPlayCount fromDictionary:dict] doubleValue];
            self.displayType = [[self objectOrNilForKey:kVedioModelGroupDisplayType fromDictionary:dict] doubleValue];
            self.groupId = [[self objectOrNilForKey:kVedioModelGroupGroupId fromDictionary:dict] doubleValue];
            self.categoryVisible = [[self objectOrNilForKey:kVedioModelGroupCategoryVisible fromDictionary:dict] boolValue];
            self.flashUrl = [self objectOrNilForKey:kVedioModelGroupFlashUrl fromDictionary:dict];
            self.neihanHotLink = [VedioModelNeihanHotLink modelObjectWithDictionary:[dict objectForKey:kVedioModelGroupNeihanHotLink]];
            self.title = [self objectOrNilForKey:kVedioModelGroupTitle fromDictionary:dict];
            self.userRepin = [[self objectOrNilForKey:kVedioModelGroupUserRepin fromDictionary:dict] doubleValue];
            self.coverImageUri = [self objectOrNilForKey:kVedioModelGroupCoverImageUri fromDictionary:dict];
            self.statusDesc = [self objectOrNilForKey:kVedioModelGroupStatusDesc fromDictionary:dict];
            self.status = [[self objectOrNilForKey:kVedioModelGroupStatus fromDictionary:dict] doubleValue];
    NSObject *receivedVedioModelDislikeReason = [dict objectForKey:kVedioModelGroupDislikeReason];
    NSMutableArray *parsedVedioModelDislikeReason = [NSMutableArray array];
    if ([receivedVedioModelDislikeReason isKindOfClass:[NSArray class]]) {
        for (NSDictionary *item in (NSArray *)receivedVedioModelDislikeReason) {
            if ([item isKindOfClass:[NSDictionary class]]) {
                [parsedVedioModelDislikeReason addObject:[VedioModelDislikeReason modelObjectWithDictionary:item]];
            }
       }
    } else if ([receivedVedioModelDislikeReason isKindOfClass:[NSDictionary class]]) {
       [parsedVedioModelDislikeReason addObject:[VedioModelDislikeReason modelObjectWithDictionary:(NSDictionary *)receivedVedioModelDislikeReason]];
    }

    self.dislikeReason = [NSArray arrayWithArray:parsedVedioModelDislikeReason];
            self.coverImageUrl = [self objectOrNilForKey:kVedioModelGroupCoverImageUrl fromDictionary:dict];
            self.repinCount = [[self objectOrNilForKey:kVedioModelGroupRepinCount fromDictionary:dict] doubleValue];
            self.shareCount = [[self objectOrNilForKey:kVedioModelGroupShareCount fromDictionary:dict] doubleValue];
            self.type = [[self objectOrNilForKey:kVedioModelGroupType fromDictionary:dict] doubleValue];
            self.diggCount = [[self objectOrNilForKey:kVedioModelGroupDiggCount fromDictionary:dict] doubleValue];
            self.videoWidth = [[self objectOrNilForKey:kVedioModelGroupVideoWidth fromDictionary:dict] doubleValue];
            self.neihanHotStartTime = [self objectOrNilForKey:kVedioModelGroupNeihanHotStartTime fromDictionary:dict];
            self.isVideo = [[self objectOrNilForKey:kVedioModelGroupIsVideo fromDictionary:dict] doubleValue];
            self.hasHotComments = [[self objectOrNilForKey:kVedioModelGroupHasHotComments fromDictionary:dict] doubleValue];
            self.commentCount = [[self objectOrNilForKey:kVedioModelGroupCommentCount fromDictionary:dict] doubleValue];
            self.goDetailCount = [[self objectOrNilForKey:kVedioModelGroupGoDetailCount fromDictionary:dict] doubleValue];
            self.favoriteCount = [[self objectOrNilForKey:kVedioModelGroupFavoriteCount fromDictionary:dict] doubleValue];
            self.largeCover = [VedioModelLargeCover modelObjectWithDictionary:[dict objectForKey:kVedioModelGroupLargeCover]];
            self.text = [self objectOrNilForKey:kVedioModelGroupText fromDictionary:dict];
            self.categoryName = [self objectOrNilForKey:kVedioModelGroupCategoryName fromDictionary:dict];
            self.onlineTime = [[self objectOrNilForKey:kVedioModelGroupOnlineTime fromDictionary:dict] doubleValue];
            self.userDigg = [[self objectOrNilForKey:kVedioModelGroupUserDigg fromDictionary:dict] doubleValue];
            self.createTime = [[self objectOrNilForKey:kVedioModelGroupCreateTime fromDictionary:dict] doubleValue];
            self.categoryId = [[self objectOrNilForKey:kVedioModelGroupCategoryId fromDictionary:dict] doubleValue];
            self.categoryType = [[self objectOrNilForKey:kVedioModelGroupCategoryType fromDictionary:dict] doubleValue];
            self.shareUrl = [self objectOrNilForKey:kVedioModelGroupShareUrl fromDictionary:dict];
            self.isAnonymous = [[self objectOrNilForKey:kVedioModelGroupIsAnonymous fromDictionary:dict] boolValue];
            self.quickComment = [[self objectOrNilForKey:kVedioModelGroupQuickComment fromDictionary:dict] boolValue];
            self.buryCount = [[self objectOrNilForKey:kVedioModelGroupBuryCount fromDictionary:dict] doubleValue];
            self.userBury = [[self objectOrNilForKey:kVedioModelGroupUserBury fromDictionary:dict] doubleValue];
            self.mediaType = [[self objectOrNilForKey:kVedioModelGroupMediaType fromDictionary:dict] doubleValue];
            self.mediumCover = [VedioModelMediumCover modelObjectWithDictionary:[dict objectForKey:kVedioModelGroupMediumCover]];
            self.shareType = [[self objectOrNilForKey:kVedioModelGroupShareType fromDictionary:dict] doubleValue];
            self.duration = [[self objectOrNilForKey:kVedioModelGroupDuration fromDictionary:dict] doubleValue];
            self.videoHeight = [[self objectOrNilForKey:kVedioModelGroupVideoHeight fromDictionary:dict] doubleValue];
            self.isPublicUrl = [[self objectOrNilForKey:kVedioModelGroupIsPublicUrl fromDictionary:dict] doubleValue];
            self.content = [self objectOrNilForKey:kVedioModelGroupContent fromDictionary:dict];
            self.neihanHotEndTime = [self objectOrNilForKey:kVedioModelGroupNeihanHotEndTime fromDictionary:dict];
            self.isCanShare = [[self objectOrNilForKey:kVedioModelGroupIsCanShare fromDictionary:dict] doubleValue];
            self.isNeihanHot = [[self objectOrNilForKey:kVedioModelGroupIsNeihanHot fromDictionary:dict] boolValue];
            self.mp4Url = [self objectOrNilForKey:kVedioModelGroupMp4Url fromDictionary:dict];
            self.hasComments = [[self objectOrNilForKey:kVedioModelGroupHasComments fromDictionary:dict] doubleValue];
            self.keywords = [self objectOrNilForKey:kVedioModelGroupKeywords fromDictionary:dict];
            self.STZpVideo = [VedioModelSTZpVideo modelObjectWithDictionary:[dict objectForKey:kVedioModelGroupSTZpVideo]];
            self.m3u8Url = [self objectOrNilForKey:kVedioModelGroupM3u8Url fromDictionary:dict];
            self.label = [[self objectOrNilForKey:kVedioModelGroupLabel fromDictionary:dict] doubleValue];
            self.idStr = [self objectOrNilForKey:kVedioModelGroupIdStr fromDictionary:dict];
            self.activity = [VedioModelActivity modelObjectWithDictionary:[dict objectForKey:kVedioModelGroupActivity]];
            self.allowDislike = [[self objectOrNilForKey:kVedioModelGroupAllowDislike fromDictionary:dict] boolValue];

    }
    
    return self;
    
}

- (NSDictionary *)dictionaryRepresentation
{
    NSMutableDictionary *mutableDict = [NSMutableDictionary dictionary];
    [mutableDict setValue:[NSNumber numberWithDouble:self.userFavorite] forKey:kVedioModelGroupUserFavorite];
    [mutableDict setValue:[self.user dictionaryRepresentation] forKey:kVedioModelGroupUser];
    [mutableDict setValue:self.publishTime forKey:kVedioModelGroupPublishTime];
    [mutableDict setValue:self.uri forKey:kVedioModelGroupUri];
    [mutableDict setValue:[NSNumber numberWithDouble:self.groupIdentifier] forKey:kVedioModelGroupId];
    [mutableDict setValue:[self.originVideo dictionaryRepresentation] forKey:kVedioModelGroupOriginVideo];
    [mutableDict setValue:[NSNumber numberWithDouble:self.playCount] forKey:kVedioModelGroupPlayCount];
    [mutableDict setValue:[NSNumber numberWithDouble:self.displayType] forKey:kVedioModelGroupDisplayType];
    [mutableDict setValue:[NSNumber numberWithDouble:self.groupId] forKey:kVedioModelGroupGroupId];
    [mutableDict setValue:[NSNumber numberWithBool:self.categoryVisible] forKey:kVedioModelGroupCategoryVisible];
    [mutableDict setValue:self.flashUrl forKey:kVedioModelGroupFlashUrl];
    [mutableDict setValue:[self.neihanHotLink dictionaryRepresentation] forKey:kVedioModelGroupNeihanHotLink];
    [mutableDict setValue:self.title forKey:kVedioModelGroupTitle];
    [mutableDict setValue:[NSNumber numberWithDouble:self.userRepin] forKey:kVedioModelGroupUserRepin];
    [mutableDict setValue:self.coverImageUri forKey:kVedioModelGroupCoverImageUri];
    [mutableDict setValue:self.statusDesc forKey:kVedioModelGroupStatusDesc];
    [mutableDict setValue:[NSNumber numberWithDouble:self.status] forKey:kVedioModelGroupStatus];
    NSMutableArray *tempArrayForDislikeReason = [NSMutableArray array];
    for (NSObject *subArrayObject in self.dislikeReason) {
        if([subArrayObject respondsToSelector:@selector(dictionaryRepresentation)]) {
            // This class is a model object
            [tempArrayForDislikeReason addObject:[subArrayObject performSelector:@selector(dictionaryRepresentation)]];
        } else {
            // Generic object
            [tempArrayForDislikeReason addObject:subArrayObject];
        }
    }
    [mutableDict setValue:[NSArray arrayWithArray:tempArrayForDislikeReason] forKey:kVedioModelGroupDislikeReason];
    [mutableDict setValue:self.coverImageUrl forKey:kVedioModelGroupCoverImageUrl];
    [mutableDict setValue:[NSNumber numberWithDouble:self.repinCount] forKey:kVedioModelGroupRepinCount];
    [mutableDict setValue:[NSNumber numberWithDouble:self.shareCount] forKey:kVedioModelGroupShareCount];
    [mutableDict setValue:[NSNumber numberWithDouble:self.type] forKey:kVedioModelGroupType];
    [mutableDict setValue:[NSNumber numberWithDouble:self.diggCount] forKey:kVedioModelGroupDiggCount];
    [mutableDict setValue:[NSNumber numberWithDouble:self.videoWidth] forKey:kVedioModelGroupVideoWidth];
    [mutableDict setValue:self.neihanHotStartTime forKey:kVedioModelGroupNeihanHotStartTime];
    [mutableDict setValue:[NSNumber numberWithDouble:self.isVideo] forKey:kVedioModelGroupIsVideo];
    [mutableDict setValue:[NSNumber numberWithDouble:self.hasHotComments] forKey:kVedioModelGroupHasHotComments];
    [mutableDict setValue:[NSNumber numberWithDouble:self.commentCount] forKey:kVedioModelGroupCommentCount];
    [mutableDict setValue:[NSNumber numberWithDouble:self.goDetailCount] forKey:kVedioModelGroupGoDetailCount];
    [mutableDict setValue:[NSNumber numberWithDouble:self.favoriteCount] forKey:kVedioModelGroupFavoriteCount];
    [mutableDict setValue:[self.largeCover dictionaryRepresentation] forKey:kVedioModelGroupLargeCover];
    [mutableDict setValue:self.text forKey:kVedioModelGroupText];
    [mutableDict setValue:self.categoryName forKey:kVedioModelGroupCategoryName];
    [mutableDict setValue:[NSNumber numberWithDouble:self.onlineTime] forKey:kVedioModelGroupOnlineTime];
    [mutableDict setValue:[NSNumber numberWithDouble:self.userDigg] forKey:kVedioModelGroupUserDigg];
    [mutableDict setValue:[NSNumber numberWithDouble:self.createTime] forKey:kVedioModelGroupCreateTime];
    [mutableDict setValue:[NSNumber numberWithDouble:self.categoryId] forKey:kVedioModelGroupCategoryId];
    [mutableDict setValue:[NSNumber numberWithDouble:self.categoryType] forKey:kVedioModelGroupCategoryType];
    [mutableDict setValue:self.shareUrl forKey:kVedioModelGroupShareUrl];
    [mutableDict setValue:[NSNumber numberWithBool:self.isAnonymous] forKey:kVedioModelGroupIsAnonymous];
    [mutableDict setValue:[NSNumber numberWithBool:self.quickComment] forKey:kVedioModelGroupQuickComment];
    [mutableDict setValue:[NSNumber numberWithDouble:self.buryCount] forKey:kVedioModelGroupBuryCount];
    [mutableDict setValue:[NSNumber numberWithDouble:self.userBury] forKey:kVedioModelGroupUserBury];
    [mutableDict setValue:[NSNumber numberWithDouble:self.mediaType] forKey:kVedioModelGroupMediaType];
    [mutableDict setValue:[self.mediumCover dictionaryRepresentation] forKey:kVedioModelGroupMediumCover];
    [mutableDict setValue:[NSNumber numberWithDouble:self.shareType] forKey:kVedioModelGroupShareType];
    [mutableDict setValue:[NSNumber numberWithDouble:self.duration] forKey:kVedioModelGroupDuration];
    [mutableDict setValue:[NSNumber numberWithDouble:self.videoHeight] forKey:kVedioModelGroupVideoHeight];
    [mutableDict setValue:[NSNumber numberWithDouble:self.isPublicUrl] forKey:kVedioModelGroupIsPublicUrl];
    [mutableDict setValue:self.content forKey:kVedioModelGroupContent];
    [mutableDict setValue:self.neihanHotEndTime forKey:kVedioModelGroupNeihanHotEndTime];
    [mutableDict setValue:[NSNumber numberWithDouble:self.isCanShare] forKey:kVedioModelGroupIsCanShare];
    [mutableDict setValue:[NSNumber numberWithBool:self.isNeihanHot] forKey:kVedioModelGroupIsNeihanHot];
    [mutableDict setValue:self.mp4Url forKey:kVedioModelGroupMp4Url];
    [mutableDict setValue:[NSNumber numberWithDouble:self.hasComments] forKey:kVedioModelGroupHasComments];
    [mutableDict setValue:self.keywords forKey:kVedioModelGroupKeywords];
    [mutableDict setValue:[self.STZpVideo dictionaryRepresentation] forKey:kVedioModelGroupSTZpVideo];
    [mutableDict setValue:self.m3u8Url forKey:kVedioModelGroupM3u8Url];
    [mutableDict setValue:[NSNumber numberWithDouble:self.label] forKey:kVedioModelGroupLabel];
    [mutableDict setValue:self.idStr forKey:kVedioModelGroupIdStr];
    [mutableDict setValue:[self.activity dictionaryRepresentation] forKey:kVedioModelGroupActivity];
    [mutableDict setValue:[NSNumber numberWithBool:self.allowDislike] forKey:kVedioModelGroupAllowDislike];

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

    self.userFavorite = [aDecoder decodeDoubleForKey:kVedioModelGroupUserFavorite];
    self.user = [aDecoder decodeObjectForKey:kVedioModelGroupUser];
    self.publishTime = [aDecoder decodeObjectForKey:kVedioModelGroupPublishTime];
    self.uri = [aDecoder decodeObjectForKey:kVedioModelGroupUri];
    self.groupIdentifier = [aDecoder decodeDoubleForKey:kVedioModelGroupId];
    self.originVideo = [aDecoder decodeObjectForKey:kVedioModelGroupOriginVideo];
    self.playCount = [aDecoder decodeDoubleForKey:kVedioModelGroupPlayCount];
    self.displayType = [aDecoder decodeDoubleForKey:kVedioModelGroupDisplayType];
    self.groupId = [aDecoder decodeDoubleForKey:kVedioModelGroupGroupId];
    self.categoryVisible = [aDecoder decodeBoolForKey:kVedioModelGroupCategoryVisible];
    self.flashUrl = [aDecoder decodeObjectForKey:kVedioModelGroupFlashUrl];
    self.neihanHotLink = [aDecoder decodeObjectForKey:kVedioModelGroupNeihanHotLink];
    self.title = [aDecoder decodeObjectForKey:kVedioModelGroupTitle];
    self.userRepin = [aDecoder decodeDoubleForKey:kVedioModelGroupUserRepin];
    self.coverImageUri = [aDecoder decodeObjectForKey:kVedioModelGroupCoverImageUri];
    self.statusDesc = [aDecoder decodeObjectForKey:kVedioModelGroupStatusDesc];
    self.status = [aDecoder decodeDoubleForKey:kVedioModelGroupStatus];
    self.dislikeReason = [aDecoder decodeObjectForKey:kVedioModelGroupDislikeReason];
    self.coverImageUrl = [aDecoder decodeObjectForKey:kVedioModelGroupCoverImageUrl];
    self.repinCount = [aDecoder decodeDoubleForKey:kVedioModelGroupRepinCount];
    self.shareCount = [aDecoder decodeDoubleForKey:kVedioModelGroupShareCount];
    self.type = [aDecoder decodeDoubleForKey:kVedioModelGroupType];
    self.diggCount = [aDecoder decodeDoubleForKey:kVedioModelGroupDiggCount];
    self.videoWidth = [aDecoder decodeDoubleForKey:kVedioModelGroupVideoWidth];
    self.neihanHotStartTime = [aDecoder decodeObjectForKey:kVedioModelGroupNeihanHotStartTime];
    self.isVideo = [aDecoder decodeDoubleForKey:kVedioModelGroupIsVideo];
    self.hasHotComments = [aDecoder decodeDoubleForKey:kVedioModelGroupHasHotComments];
    self.commentCount = [aDecoder decodeDoubleForKey:kVedioModelGroupCommentCount];
    self.goDetailCount = [aDecoder decodeDoubleForKey:kVedioModelGroupGoDetailCount];
    self.favoriteCount = [aDecoder decodeDoubleForKey:kVedioModelGroupFavoriteCount];
    self.largeCover = [aDecoder decodeObjectForKey:kVedioModelGroupLargeCover];
    self.text = [aDecoder decodeObjectForKey:kVedioModelGroupText];
    self.categoryName = [aDecoder decodeObjectForKey:kVedioModelGroupCategoryName];
    self.onlineTime = [aDecoder decodeDoubleForKey:kVedioModelGroupOnlineTime];
    self.userDigg = [aDecoder decodeDoubleForKey:kVedioModelGroupUserDigg];
    self.createTime = [aDecoder decodeDoubleForKey:kVedioModelGroupCreateTime];
    self.categoryId = [aDecoder decodeDoubleForKey:kVedioModelGroupCategoryId];
    self.categoryType = [aDecoder decodeDoubleForKey:kVedioModelGroupCategoryType];
    self.shareUrl = [aDecoder decodeObjectForKey:kVedioModelGroupShareUrl];
    self.isAnonymous = [aDecoder decodeBoolForKey:kVedioModelGroupIsAnonymous];
    self.quickComment = [aDecoder decodeBoolForKey:kVedioModelGroupQuickComment];
    self.buryCount = [aDecoder decodeDoubleForKey:kVedioModelGroupBuryCount];
    self.userBury = [aDecoder decodeDoubleForKey:kVedioModelGroupUserBury];
    self.mediaType = [aDecoder decodeDoubleForKey:kVedioModelGroupMediaType];
    self.mediumCover = [aDecoder decodeObjectForKey:kVedioModelGroupMediumCover];
    self.shareType = [aDecoder decodeDoubleForKey:kVedioModelGroupShareType];
    self.duration = [aDecoder decodeDoubleForKey:kVedioModelGroupDuration];
    self.videoHeight = [aDecoder decodeDoubleForKey:kVedioModelGroupVideoHeight];
    self.isPublicUrl = [aDecoder decodeDoubleForKey:kVedioModelGroupIsPublicUrl];
    self.content = [aDecoder decodeObjectForKey:kVedioModelGroupContent];
    self.neihanHotEndTime = [aDecoder decodeObjectForKey:kVedioModelGroupNeihanHotEndTime];
    self.isCanShare = [aDecoder decodeDoubleForKey:kVedioModelGroupIsCanShare];
    self.isNeihanHot = [aDecoder decodeBoolForKey:kVedioModelGroupIsNeihanHot];
    self.mp4Url = [aDecoder decodeObjectForKey:kVedioModelGroupMp4Url];
    self.hasComments = [aDecoder decodeDoubleForKey:kVedioModelGroupHasComments];
    self.keywords = [aDecoder decodeObjectForKey:kVedioModelGroupKeywords];
    self.STZpVideo = [aDecoder decodeObjectForKey:kVedioModelGroupSTZpVideo];
    self.m3u8Url = [aDecoder decodeObjectForKey:kVedioModelGroupM3u8Url];
    self.label = [aDecoder decodeDoubleForKey:kVedioModelGroupLabel];
    self.idStr = [aDecoder decodeObjectForKey:kVedioModelGroupIdStr];
    self.activity = [aDecoder decodeObjectForKey:kVedioModelGroupActivity];
    self.allowDislike = [aDecoder decodeBoolForKey:kVedioModelGroupAllowDislike];
    return self;
}

- (void)encodeWithCoder:(NSCoder *)aCoder
{

    [aCoder encodeDouble:_userFavorite forKey:kVedioModelGroupUserFavorite];
    [aCoder encodeObject:_user forKey:kVedioModelGroupUser];
    [aCoder encodeObject:_publishTime forKey:kVedioModelGroupPublishTime];
    [aCoder encodeObject:_uri forKey:kVedioModelGroupUri];
    [aCoder encodeDouble:_groupIdentifier forKey:kVedioModelGroupId];
    [aCoder encodeObject:_originVideo forKey:kVedioModelGroupOriginVideo];
    [aCoder encodeDouble:_playCount forKey:kVedioModelGroupPlayCount];
    [aCoder encodeDouble:_displayType forKey:kVedioModelGroupDisplayType];
    [aCoder encodeDouble:_groupId forKey:kVedioModelGroupGroupId];
    [aCoder encodeBool:_categoryVisible forKey:kVedioModelGroupCategoryVisible];
    [aCoder encodeObject:_flashUrl forKey:kVedioModelGroupFlashUrl];
    [aCoder encodeObject:_neihanHotLink forKey:kVedioModelGroupNeihanHotLink];
    [aCoder encodeObject:_title forKey:kVedioModelGroupTitle];
    [aCoder encodeDouble:_userRepin forKey:kVedioModelGroupUserRepin];
    [aCoder encodeObject:_coverImageUri forKey:kVedioModelGroupCoverImageUri];
    [aCoder encodeObject:_statusDesc forKey:kVedioModelGroupStatusDesc];
    [aCoder encodeDouble:_status forKey:kVedioModelGroupStatus];
    [aCoder encodeObject:_dislikeReason forKey:kVedioModelGroupDislikeReason];
    [aCoder encodeObject:_coverImageUrl forKey:kVedioModelGroupCoverImageUrl];
    [aCoder encodeDouble:_repinCount forKey:kVedioModelGroupRepinCount];
    [aCoder encodeDouble:_shareCount forKey:kVedioModelGroupShareCount];
    [aCoder encodeDouble:_type forKey:kVedioModelGroupType];
    [aCoder encodeDouble:_diggCount forKey:kVedioModelGroupDiggCount];
    [aCoder encodeDouble:_videoWidth forKey:kVedioModelGroupVideoWidth];
    [aCoder encodeObject:_neihanHotStartTime forKey:kVedioModelGroupNeihanHotStartTime];
    [aCoder encodeDouble:_isVideo forKey:kVedioModelGroupIsVideo];
    [aCoder encodeDouble:_hasHotComments forKey:kVedioModelGroupHasHotComments];
    [aCoder encodeDouble:_commentCount forKey:kVedioModelGroupCommentCount];
    [aCoder encodeDouble:_goDetailCount forKey:kVedioModelGroupGoDetailCount];
    [aCoder encodeDouble:_favoriteCount forKey:kVedioModelGroupFavoriteCount];
    [aCoder encodeObject:_largeCover forKey:kVedioModelGroupLargeCover];
    [aCoder encodeObject:_text forKey:kVedioModelGroupText];
    [aCoder encodeObject:_categoryName forKey:kVedioModelGroupCategoryName];
    [aCoder encodeDouble:_onlineTime forKey:kVedioModelGroupOnlineTime];
    [aCoder encodeDouble:_userDigg forKey:kVedioModelGroupUserDigg];
    [aCoder encodeDouble:_createTime forKey:kVedioModelGroupCreateTime];
    [aCoder encodeDouble:_categoryId forKey:kVedioModelGroupCategoryId];
    [aCoder encodeDouble:_categoryType forKey:kVedioModelGroupCategoryType];
    [aCoder encodeObject:_shareUrl forKey:kVedioModelGroupShareUrl];
    [aCoder encodeBool:_isAnonymous forKey:kVedioModelGroupIsAnonymous];
    [aCoder encodeBool:_quickComment forKey:kVedioModelGroupQuickComment];
    [aCoder encodeDouble:_buryCount forKey:kVedioModelGroupBuryCount];
    [aCoder encodeDouble:_userBury forKey:kVedioModelGroupUserBury];
    [aCoder encodeDouble:_mediaType forKey:kVedioModelGroupMediaType];
    [aCoder encodeObject:_mediumCover forKey:kVedioModelGroupMediumCover];
    [aCoder encodeDouble:_shareType forKey:kVedioModelGroupShareType];
    [aCoder encodeDouble:_duration forKey:kVedioModelGroupDuration];
    [aCoder encodeDouble:_videoHeight forKey:kVedioModelGroupVideoHeight];
    [aCoder encodeDouble:_isPublicUrl forKey:kVedioModelGroupIsPublicUrl];
    [aCoder encodeObject:_content forKey:kVedioModelGroupContent];
    [aCoder encodeObject:_neihanHotEndTime forKey:kVedioModelGroupNeihanHotEndTime];
    [aCoder encodeDouble:_isCanShare forKey:kVedioModelGroupIsCanShare];
    [aCoder encodeBool:_isNeihanHot forKey:kVedioModelGroupIsNeihanHot];
    [aCoder encodeObject:_mp4Url forKey:kVedioModelGroupMp4Url];
    [aCoder encodeDouble:_hasComments forKey:kVedioModelGroupHasComments];
    [aCoder encodeObject:_keywords forKey:kVedioModelGroupKeywords];
    [aCoder encodeObject:_STZpVideo forKey:kVedioModelGroupSTZpVideo];
    [aCoder encodeObject:_m3u8Url forKey:kVedioModelGroupM3u8Url];
    [aCoder encodeDouble:_label forKey:kVedioModelGroupLabel];
    [aCoder encodeObject:_idStr forKey:kVedioModelGroupIdStr];
    [aCoder encodeObject:_activity forKey:kVedioModelGroupActivity];
    [aCoder encodeBool:_allowDislike forKey:kVedioModelGroupAllowDislike];
}

- (id)copyWithZone:(NSZone *)zone
{
    VedioModelGroup *copy = [[VedioModelGroup alloc] init];
    
    if (copy) {

        copy.userFavorite = self.userFavorite;
        copy.user = [self.user copyWithZone:zone];
        copy.publishTime = [self.publishTime copyWithZone:zone];
        copy.uri = [self.uri copyWithZone:zone];
        copy.groupIdentifier = self.groupIdentifier;
        copy.originVideo = [self.originVideo copyWithZone:zone];
        copy.playCount = self.playCount;
        copy.displayType = self.displayType;
        copy.groupId = self.groupId;
        copy.categoryVisible = self.categoryVisible;
        copy.flashUrl = [self.flashUrl copyWithZone:zone];
        copy.neihanHotLink = [self.neihanHotLink copyWithZone:zone];
        copy.title = [self.title copyWithZone:zone];
        copy.userRepin = self.userRepin;
        copy.coverImageUri = [self.coverImageUri copyWithZone:zone];
        copy.statusDesc = [self.statusDesc copyWithZone:zone];
        copy.status = self.status;
        copy.dislikeReason = [self.dislikeReason copyWithZone:zone];
        copy.coverImageUrl = [self.coverImageUrl copyWithZone:zone];
        copy.repinCount = self.repinCount;
        copy.shareCount = self.shareCount;
        copy.type = self.type;
        copy.diggCount = self.diggCount;
        copy.videoWidth = self.videoWidth;
        copy.neihanHotStartTime = [self.neihanHotStartTime copyWithZone:zone];
        copy.isVideo = self.isVideo;
        copy.hasHotComments = self.hasHotComments;
        copy.commentCount = self.commentCount;
        copy.goDetailCount = self.goDetailCount;
        copy.favoriteCount = self.favoriteCount;
        copy.largeCover = [self.largeCover copyWithZone:zone];
        copy.text = [self.text copyWithZone:zone];
        copy.categoryName = [self.categoryName copyWithZone:zone];
        copy.onlineTime = self.onlineTime;
        copy.userDigg = self.userDigg;
        copy.createTime = self.createTime;
        copy.categoryId = self.categoryId;
        copy.categoryType = self.categoryType;
        copy.shareUrl = [self.shareUrl copyWithZone:zone];
        copy.isAnonymous = self.isAnonymous;
        copy.quickComment = self.quickComment;
        copy.buryCount = self.buryCount;
        copy.userBury = self.userBury;
        copy.mediaType = self.mediaType;
        copy.mediumCover = [self.mediumCover copyWithZone:zone];
        copy.shareType = self.shareType;
        copy.duration = self.duration;
        copy.videoHeight = self.videoHeight;
        copy.isPublicUrl = self.isPublicUrl;
        copy.content = [self.content copyWithZone:zone];
        copy.neihanHotEndTime = [self.neihanHotEndTime copyWithZone:zone];
        copy.isCanShare = self.isCanShare;
        copy.isNeihanHot = self.isNeihanHot;
        copy.mp4Url = [self.mp4Url copyWithZone:zone];
        copy.hasComments = self.hasComments;
        copy.keywords = [self.keywords copyWithZone:zone];
        copy.STZpVideo = [self.STZpVideo copyWithZone:zone];
        copy.m3u8Url = [self.m3u8Url copyWithZone:zone];
        copy.label = self.label;
        copy.idStr = [self.idStr copyWithZone:zone];
        copy.activity = [self.activity copyWithZone:zone];
        copy.allowDislike = self.allowDislike;
    }
    
    return copy;
}


@end
