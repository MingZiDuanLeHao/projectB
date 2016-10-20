//
//  VedioModelAd.m
//
//  Created by   on 2016/10/12
//  Copyright (c) 2016 __MyCompanyName__. All rights reserved.
//

#import "VedioModelAd.h"
#import "VedioModelLogExtra.h"
#import "VedioModelVideoInfo.h"


NSString *const kVedioModelAdLogExtra = @"log_extra";
NSString *const kVedioModelAdSource = @"source";
NSString *const kVedioModelAdOpenUrl = @"open_url";
NSString *const kVedioModelAdTitle = @"title";
NSString *const kVedioModelAdGifUrl = @"gif_url";
NSString *const kVedioModelAdButtonText = @"button_text";
NSString *const kVedioModelAdDisplayImageHeight = @"display_image_height";
NSString *const kVedioModelAdIsAd = @"is_ad";
NSString *const kVedioModelAdAppleid = @"appleid";
NSString *const kVedioModelAdTrackUrlList = @"track_url_list";
NSString *const kVedioModelAdAbShowStyle = @"ab_show_style";
NSString *const kVedioModelAdAvatarName = @"avatar_name";
NSString *const kVedioModelAdHideIfExists = @"hide_if_exists";
NSString *const kVedioModelAdTrackUrl = @"track_url";
NSString *const kVedioModelAdAvatarUrl = @"avatar_url";
NSString *const kVedioModelAdWebUrl = @"web_url";
NSString *const kVedioModelAdDownloadUrl = @"download_url";
NSString *const kVedioModelAdType = @"type";
NSString *const kVedioModelAdId = @"id";
NSString *const kVedioModelAdDisplayInfo = @"display_info";
NSString *const kVedioModelAdDisplayType = @"display_type";
NSString *const kVedioModelAdLabel = @"label";
NSString *const kVedioModelAdDisplayImage = @"display_image";
NSString *const kVedioModelAdVideoInfo = @"video_info";
NSString *const kVedioModelAdPackage = @"package";
NSString *const kVedioModelAdEndTime = @"end_time";
NSString *const kVedioModelAdAdId = @"ad_id";
NSString *const kVedioModelAdDisplayImageWidth = @"display_image_width";
NSString *const kVedioModelAdIpaUrl = @"ipa_url";


@interface VedioModelAd ()

- (id)objectOrNilForKey:(id)aKey fromDictionary:(NSDictionary *)dict;

@end

@implementation VedioModelAd

@synthesize logExtra = _logExtra;
@synthesize source = _source;
@synthesize openUrl = _openUrl;
@synthesize title = _title;
@synthesize gifUrl = _gifUrl;
@synthesize buttonText = _buttonText;
@synthesize displayImageHeight = _displayImageHeight;
@synthesize isAd = _isAd;
@synthesize appleid = _appleid;
@synthesize trackUrlList = _trackUrlList;
@synthesize abShowStyle = _abShowStyle;
@synthesize avatarName = _avatarName;
@synthesize hideIfExists = _hideIfExists;
@synthesize trackUrl = _trackUrl;
@synthesize avatarUrl = _avatarUrl;
@synthesize webUrl = _webUrl;
@synthesize downloadUrl = _downloadUrl;
@synthesize type = _type;
@synthesize adIdentifier = _adIdentifier;
@synthesize displayInfo = _displayInfo;
@synthesize displayType = _displayType;
@synthesize label = _label;
@synthesize displayImage = _displayImage;
@synthesize videoInfo = _videoInfo;
@synthesize package = _package;
@synthesize endTime = _endTime;
@synthesize adId = _adId;
@synthesize displayImageWidth = _displayImageWidth;
@synthesize ipaUrl = _ipaUrl;


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
            self.logExtra = [VedioModelLogExtra modelObjectWithDictionary:[dict objectForKey:kVedioModelAdLogExtra]];
            self.source = [self objectOrNilForKey:kVedioModelAdSource fromDictionary:dict];
            self.openUrl = [self objectOrNilForKey:kVedioModelAdOpenUrl fromDictionary:dict];
            self.title = [self objectOrNilForKey:kVedioModelAdTitle fromDictionary:dict];
            self.gifUrl = [self objectOrNilForKey:kVedioModelAdGifUrl fromDictionary:dict];
            self.buttonText = [self objectOrNilForKey:kVedioModelAdButtonText fromDictionary:dict];
            self.displayImageHeight = [[self objectOrNilForKey:kVedioModelAdDisplayImageHeight fromDictionary:dict] doubleValue];
            self.isAd = [[self objectOrNilForKey:kVedioModelAdIsAd fromDictionary:dict] doubleValue];
            self.appleid = [self objectOrNilForKey:kVedioModelAdAppleid fromDictionary:dict];
            self.trackUrlList = [self objectOrNilForKey:kVedioModelAdTrackUrlList fromDictionary:dict];
            self.abShowStyle = [[self objectOrNilForKey:kVedioModelAdAbShowStyle fromDictionary:dict] doubleValue];
            self.avatarName = [self objectOrNilForKey:kVedioModelAdAvatarName fromDictionary:dict];
            self.hideIfExists = [[self objectOrNilForKey:kVedioModelAdHideIfExists fromDictionary:dict] doubleValue];
            self.trackUrl = [self objectOrNilForKey:kVedioModelAdTrackUrl fromDictionary:dict];
            self.avatarUrl = [self objectOrNilForKey:kVedioModelAdAvatarUrl fromDictionary:dict];
            self.webUrl = [self objectOrNilForKey:kVedioModelAdWebUrl fromDictionary:dict];
            self.downloadUrl = [self objectOrNilForKey:kVedioModelAdDownloadUrl fromDictionary:dict];
            self.type = [self objectOrNilForKey:kVedioModelAdType fromDictionary:dict];
            self.adIdentifier = [[self objectOrNilForKey:kVedioModelAdId fromDictionary:dict] doubleValue];
            self.displayInfo = [self objectOrNilForKey:kVedioModelAdDisplayInfo fromDictionary:dict];
            self.displayType = [[self objectOrNilForKey:kVedioModelAdDisplayType fromDictionary:dict] doubleValue];
            self.label = [self objectOrNilForKey:kVedioModelAdLabel fromDictionary:dict];
            self.displayImage = [self objectOrNilForKey:kVedioModelAdDisplayImage fromDictionary:dict];
            self.videoInfo = [VedioModelVideoInfo modelObjectWithDictionary:[dict objectForKey:kVedioModelAdVideoInfo]];
            self.package = [self objectOrNilForKey:kVedioModelAdPackage fromDictionary:dict];
            self.endTime = [[self objectOrNilForKey:kVedioModelAdEndTime fromDictionary:dict] doubleValue];
            self.adId = [[self objectOrNilForKey:kVedioModelAdAdId fromDictionary:dict] doubleValue];
            self.displayImageWidth = [[self objectOrNilForKey:kVedioModelAdDisplayImageWidth fromDictionary:dict] doubleValue];
            self.ipaUrl = [self objectOrNilForKey:kVedioModelAdIpaUrl fromDictionary:dict];

    }
    
    return self;
    
}

- (NSDictionary *)dictionaryRepresentation
{
    NSMutableDictionary *mutableDict = [NSMutableDictionary dictionary];
    [mutableDict setValue:[self.logExtra dictionaryRepresentation] forKey:kVedioModelAdLogExtra];
    [mutableDict setValue:self.source forKey:kVedioModelAdSource];
    [mutableDict setValue:self.openUrl forKey:kVedioModelAdOpenUrl];
    [mutableDict setValue:self.title forKey:kVedioModelAdTitle];
    [mutableDict setValue:self.gifUrl forKey:kVedioModelAdGifUrl];
    [mutableDict setValue:self.buttonText forKey:kVedioModelAdButtonText];
    [mutableDict setValue:[NSNumber numberWithDouble:self.displayImageHeight] forKey:kVedioModelAdDisplayImageHeight];
    [mutableDict setValue:[NSNumber numberWithDouble:self.isAd] forKey:kVedioModelAdIsAd];
    [mutableDict setValue:self.appleid forKey:kVedioModelAdAppleid];
    NSMutableArray *tempArrayForTrackUrlList = [NSMutableArray array];
    for (NSObject *subArrayObject in self.trackUrlList) {
        if([subArrayObject respondsToSelector:@selector(dictionaryRepresentation)]) {
            // This class is a model object
            [tempArrayForTrackUrlList addObject:[subArrayObject performSelector:@selector(dictionaryRepresentation)]];
        } else {
            // Generic object
            [tempArrayForTrackUrlList addObject:subArrayObject];
        }
    }
    [mutableDict setValue:[NSArray arrayWithArray:tempArrayForTrackUrlList] forKey:kVedioModelAdTrackUrlList];
    [mutableDict setValue:[NSNumber numberWithDouble:self.abShowStyle] forKey:kVedioModelAdAbShowStyle];
    [mutableDict setValue:self.avatarName forKey:kVedioModelAdAvatarName];
    [mutableDict setValue:[NSNumber numberWithDouble:self.hideIfExists] forKey:kVedioModelAdHideIfExists];
    [mutableDict setValue:self.trackUrl forKey:kVedioModelAdTrackUrl];
    [mutableDict setValue:self.avatarUrl forKey:kVedioModelAdAvatarUrl];
    [mutableDict setValue:self.webUrl forKey:kVedioModelAdWebUrl];
    [mutableDict setValue:self.downloadUrl forKey:kVedioModelAdDownloadUrl];
    [mutableDict setValue:self.type forKey:kVedioModelAdType];
    [mutableDict setValue:[NSNumber numberWithDouble:self.adIdentifier] forKey:kVedioModelAdId];
    [mutableDict setValue:self.displayInfo forKey:kVedioModelAdDisplayInfo];
    [mutableDict setValue:[NSNumber numberWithDouble:self.displayType] forKey:kVedioModelAdDisplayType];
    [mutableDict setValue:self.label forKey:kVedioModelAdLabel];
    [mutableDict setValue:self.displayImage forKey:kVedioModelAdDisplayImage];
    [mutableDict setValue:[self.videoInfo dictionaryRepresentation] forKey:kVedioModelAdVideoInfo];
    [mutableDict setValue:self.package forKey:kVedioModelAdPackage];
    [mutableDict setValue:[NSNumber numberWithDouble:self.endTime] forKey:kVedioModelAdEndTime];
    [mutableDict setValue:[NSNumber numberWithDouble:self.adId] forKey:kVedioModelAdAdId];
    [mutableDict setValue:[NSNumber numberWithDouble:self.displayImageWidth] forKey:kVedioModelAdDisplayImageWidth];
    [mutableDict setValue:self.ipaUrl forKey:kVedioModelAdIpaUrl];

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

    self.logExtra = [aDecoder decodeObjectForKey:kVedioModelAdLogExtra];
    self.source = [aDecoder decodeObjectForKey:kVedioModelAdSource];
    self.openUrl = [aDecoder decodeObjectForKey:kVedioModelAdOpenUrl];
    self.title = [aDecoder decodeObjectForKey:kVedioModelAdTitle];
    self.gifUrl = [aDecoder decodeObjectForKey:kVedioModelAdGifUrl];
    self.buttonText = [aDecoder decodeObjectForKey:kVedioModelAdButtonText];
    self.displayImageHeight = [aDecoder decodeDoubleForKey:kVedioModelAdDisplayImageHeight];
    self.isAd = [aDecoder decodeDoubleForKey:kVedioModelAdIsAd];
    self.appleid = [aDecoder decodeObjectForKey:kVedioModelAdAppleid];
    self.trackUrlList = [aDecoder decodeObjectForKey:kVedioModelAdTrackUrlList];
    self.abShowStyle = [aDecoder decodeDoubleForKey:kVedioModelAdAbShowStyle];
    self.avatarName = [aDecoder decodeObjectForKey:kVedioModelAdAvatarName];
    self.hideIfExists = [aDecoder decodeDoubleForKey:kVedioModelAdHideIfExists];
    self.trackUrl = [aDecoder decodeObjectForKey:kVedioModelAdTrackUrl];
    self.avatarUrl = [aDecoder decodeObjectForKey:kVedioModelAdAvatarUrl];
    self.webUrl = [aDecoder decodeObjectForKey:kVedioModelAdWebUrl];
    self.downloadUrl = [aDecoder decodeObjectForKey:kVedioModelAdDownloadUrl];
    self.type = [aDecoder decodeObjectForKey:kVedioModelAdType];
    self.adIdentifier = [aDecoder decodeDoubleForKey:kVedioModelAdId];
    self.displayInfo = [aDecoder decodeObjectForKey:kVedioModelAdDisplayInfo];
    self.displayType = [aDecoder decodeDoubleForKey:kVedioModelAdDisplayType];
    self.label = [aDecoder decodeObjectForKey:kVedioModelAdLabel];
    self.displayImage = [aDecoder decodeObjectForKey:kVedioModelAdDisplayImage];
    self.videoInfo = [aDecoder decodeObjectForKey:kVedioModelAdVideoInfo];
    self.package = [aDecoder decodeObjectForKey:kVedioModelAdPackage];
    self.endTime = [aDecoder decodeDoubleForKey:kVedioModelAdEndTime];
    self.adId = [aDecoder decodeDoubleForKey:kVedioModelAdAdId];
    self.displayImageWidth = [aDecoder decodeDoubleForKey:kVedioModelAdDisplayImageWidth];
    self.ipaUrl = [aDecoder decodeObjectForKey:kVedioModelAdIpaUrl];
    return self;
}

- (void)encodeWithCoder:(NSCoder *)aCoder
{

    [aCoder encodeObject:_logExtra forKey:kVedioModelAdLogExtra];
    [aCoder encodeObject:_source forKey:kVedioModelAdSource];
    [aCoder encodeObject:_openUrl forKey:kVedioModelAdOpenUrl];
    [aCoder encodeObject:_title forKey:kVedioModelAdTitle];
    [aCoder encodeObject:_gifUrl forKey:kVedioModelAdGifUrl];
    [aCoder encodeObject:_buttonText forKey:kVedioModelAdButtonText];
    [aCoder encodeDouble:_displayImageHeight forKey:kVedioModelAdDisplayImageHeight];
    [aCoder encodeDouble:_isAd forKey:kVedioModelAdIsAd];
    [aCoder encodeObject:_appleid forKey:kVedioModelAdAppleid];
    [aCoder encodeObject:_trackUrlList forKey:kVedioModelAdTrackUrlList];
    [aCoder encodeDouble:_abShowStyle forKey:kVedioModelAdAbShowStyle];
    [aCoder encodeObject:_avatarName forKey:kVedioModelAdAvatarName];
    [aCoder encodeDouble:_hideIfExists forKey:kVedioModelAdHideIfExists];
    [aCoder encodeObject:_trackUrl forKey:kVedioModelAdTrackUrl];
    [aCoder encodeObject:_avatarUrl forKey:kVedioModelAdAvatarUrl];
    [aCoder encodeObject:_webUrl forKey:kVedioModelAdWebUrl];
    [aCoder encodeObject:_downloadUrl forKey:kVedioModelAdDownloadUrl];
    [aCoder encodeObject:_type forKey:kVedioModelAdType];
    [aCoder encodeDouble:_adIdentifier forKey:kVedioModelAdId];
    [aCoder encodeObject:_displayInfo forKey:kVedioModelAdDisplayInfo];
    [aCoder encodeDouble:_displayType forKey:kVedioModelAdDisplayType];
    [aCoder encodeObject:_label forKey:kVedioModelAdLabel];
    [aCoder encodeObject:_displayImage forKey:kVedioModelAdDisplayImage];
    [aCoder encodeObject:_videoInfo forKey:kVedioModelAdVideoInfo];
    [aCoder encodeObject:_package forKey:kVedioModelAdPackage];
    [aCoder encodeDouble:_endTime forKey:kVedioModelAdEndTime];
    [aCoder encodeDouble:_adId forKey:kVedioModelAdAdId];
    [aCoder encodeDouble:_displayImageWidth forKey:kVedioModelAdDisplayImageWidth];
    [aCoder encodeObject:_ipaUrl forKey:kVedioModelAdIpaUrl];
}

- (id)copyWithZone:(NSZone *)zone
{
    VedioModelAd *copy = [[VedioModelAd alloc] init];
    
    if (copy) {

        copy.logExtra = [self.logExtra copyWithZone:zone];
        copy.source = [self.source copyWithZone:zone];
        copy.openUrl = [self.openUrl copyWithZone:zone];
        copy.title = [self.title copyWithZone:zone];
        copy.gifUrl = [self.gifUrl copyWithZone:zone];
        copy.buttonText = [self.buttonText copyWithZone:zone];
        copy.displayImageHeight = self.displayImageHeight;
        copy.isAd = self.isAd;
        copy.appleid = [self.appleid copyWithZone:zone];
        copy.trackUrlList = [self.trackUrlList copyWithZone:zone];
        copy.abShowStyle = self.abShowStyle;
        copy.avatarName = [self.avatarName copyWithZone:zone];
        copy.hideIfExists = self.hideIfExists;
        copy.trackUrl = [self.trackUrl copyWithZone:zone];
        copy.avatarUrl = [self.avatarUrl copyWithZone:zone];
        copy.webUrl = [self.webUrl copyWithZone:zone];
        copy.downloadUrl = [self.downloadUrl copyWithZone:zone];
        copy.type = [self.type copyWithZone:zone];
        copy.adIdentifier = self.adIdentifier;
        copy.displayInfo = [self.displayInfo copyWithZone:zone];
        copy.displayType = self.displayType;
        copy.label = [self.label copyWithZone:zone];
        copy.displayImage = [self.displayImage copyWithZone:zone];
        copy.videoInfo = [self.videoInfo copyWithZone:zone];
        copy.package = [self.package copyWithZone:zone];
        copy.endTime = self.endTime;
        copy.adId = self.adId;
        copy.displayImageWidth = self.displayImageWidth;
        copy.ipaUrl = [self.ipaUrl copyWithZone:zone];
    }
    
    return copy;
}


@end
