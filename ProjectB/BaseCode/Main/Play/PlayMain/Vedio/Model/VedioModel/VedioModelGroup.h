//
//  VedioModelGroup.h
//
//  Created by   on 2016/10/12
//  Copyright (c) 2016 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>

@class VedioModelUser, VedioModelOriginVideo, VedioModelNeihanHotLink, VedioModelLargeCover, VedioModelMediumCover, VedioModelSTZpVideo, VedioModelActivity;

@interface VedioModelGroup : NSObject <NSCoding, NSCopying>

@property (nonatomic, assign) double userFavorite;
@property (nonatomic, strong) VedioModelUser *user;
@property (nonatomic, strong) NSString *publishTime;
@property (nonatomic, strong) NSString *uri;
@property (nonatomic, assign) double groupIdentifier;
@property (nonatomic, strong) VedioModelOriginVideo *originVideo;
@property (nonatomic, assign) double playCount;
@property (nonatomic, assign) double displayType;
@property (nonatomic, assign) double groupId;
@property (nonatomic, assign) BOOL categoryVisible;
@property (nonatomic, strong) NSString *flashUrl;
@property (nonatomic, strong) VedioModelNeihanHotLink *neihanHotLink;
@property (nonatomic, strong) NSString *title;
@property (nonatomic, assign) double userRepin;
@property (nonatomic, strong) NSString *coverImageUri;
@property (nonatomic, strong) NSString *statusDesc;
@property (nonatomic, assign) double status;
@property (nonatomic, strong) NSArray *dislikeReason;
@property (nonatomic, strong) NSString *coverImageUrl;
@property (nonatomic, assign) double repinCount;
@property (nonatomic, assign) double shareCount;
@property (nonatomic, assign) double type;
@property (nonatomic, assign) double diggCount;
@property (nonatomic, assign) double videoWidth;
@property (nonatomic, strong) NSString *neihanHotStartTime;
@property (nonatomic, assign) double isVideo;
@property (nonatomic, assign) double hasHotComments;
@property (nonatomic, assign) double commentCount;
@property (nonatomic, assign) double goDetailCount;
@property (nonatomic, assign) double favoriteCount;
@property (nonatomic, strong) VedioModelLargeCover *largeCover;
@property (nonatomic, strong) NSString *text;
@property (nonatomic, strong) NSString *categoryName;
@property (nonatomic, assign) double onlineTime;
@property (nonatomic, assign) double userDigg;
@property (nonatomic, assign) double createTime;
@property (nonatomic, assign) double categoryId;
@property (nonatomic, assign) double categoryType;
@property (nonatomic, strong) NSString *shareUrl;
@property (nonatomic, assign) BOOL isAnonymous;
@property (nonatomic, assign) BOOL quickComment;
@property (nonatomic, assign) double buryCount;
@property (nonatomic, assign) double userBury;
@property (nonatomic, assign) double mediaType;
@property (nonatomic, strong) VedioModelMediumCover *mediumCover;
@property (nonatomic, assign) double shareType;
@property (nonatomic, assign) double duration;
@property (nonatomic, assign) double videoHeight;
@property (nonatomic, assign) double isPublicUrl;
@property (nonatomic, strong) NSString *content;
@property (nonatomic, strong) NSString *neihanHotEndTime;
@property (nonatomic, assign) double isCanShare;
@property (nonatomic, assign) BOOL isNeihanHot;
@property (nonatomic, strong) NSString *mp4Url;
@property (nonatomic, assign) double hasComments;
@property (nonatomic, strong) NSString *keywords;
@property (nonatomic, strong) VedioModelSTZpVideo *STZpVideo;
@property (nonatomic, strong) NSString *m3u8Url;
@property (nonatomic, assign) double label;
@property (nonatomic, strong) NSString *idStr;
@property (nonatomic, strong) VedioModelActivity *activity;
@property (nonatomic, assign) BOOL allowDislike;

+ (instancetype)modelObjectWithDictionary:(NSDictionary *)dict;
- (instancetype)initWithDictionary:(NSDictionary *)dict;
- (NSDictionary *)dictionaryRepresentation;

@end
