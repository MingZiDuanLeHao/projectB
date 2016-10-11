//
//  VedioModelItems.m
//
//  Created by   on 2016/10/11
//  Copyright (c) 2016 __MyCompanyName__. All rights reserved.
//

#import "VedioModelItems.h"


NSString *const kVedioModelItemsViews = @"views";
NSString *const kVedioModelItemsComments = @"comments";
NSString *const kVedioModelItemsVpicSmall = @"vpic_small";
NSString *const kVedioModelItemsUid = @"uid";
NSString *const kVedioModelItemsWSensitive = @"w_sensitive";
NSString *const kVedioModelItemsSiteCode = @"site_code";
NSString *const kVedioModelItemsLikes = @"likes";
NSString *const kVedioModelItemsFetchPlayUrl = @"fetch_play_url";
NSString *const kVedioModelItemsNoCopyright = @"no_copyright";
NSString *const kVedioModelItemsVpicMiddle = @"vpic_middle";
NSString *const kVedioModelItemsVplayUrl = @"vplay_url";
NSString *const kVedioModelItemsWbody = @"wbody";
NSString *const kVedioModelItemsWid = @"wid";
NSString *const kVedioModelItemsUserName = @"user_name";
NSString *const kVedioModelItemsUserAvatar = @"user_avatar";
NSString *const kVedioModelItemsVsourceUrl = @"vsource_url";
NSString *const kVedioModelItemsUpdateTime = @"update_time";


@interface VedioModelItems ()

- (id)objectOrNilForKey:(id)aKey fromDictionary:(NSDictionary *)dict;

@end

@implementation VedioModelItems

@synthesize views = _views;
@synthesize comments = _comments;
@synthesize vpicSmall = _vpicSmall;
@synthesize uid = _uid;
@synthesize wSensitive = _wSensitive;
@synthesize siteCode = _siteCode;
@synthesize likes = _likes;
@synthesize fetchPlayUrl = _fetchPlayUrl;
@synthesize noCopyright = _noCopyright;
@synthesize vpicMiddle = _vpicMiddle;
@synthesize vplayUrl = _vplayUrl;
@synthesize wbody = _wbody;
@synthesize wid = _wid;
@synthesize userName = _userName;
@synthesize userAvatar = _userAvatar;
@synthesize vsourceUrl = _vsourceUrl;
@synthesize updateTime = _updateTime;


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
            self.views = [self objectOrNilForKey:kVedioModelItemsViews fromDictionary:dict];
            self.comments = [self objectOrNilForKey:kVedioModelItemsComments fromDictionary:dict];
            self.vpicSmall = [self objectOrNilForKey:kVedioModelItemsVpicSmall fromDictionary:dict];
            self.uid = [self objectOrNilForKey:kVedioModelItemsUid fromDictionary:dict];
            self.wSensitive = [self objectOrNilForKey:kVedioModelItemsWSensitive fromDictionary:dict];
            self.siteCode = [self objectOrNilForKey:kVedioModelItemsSiteCode fromDictionary:dict];
            self.likes = [self objectOrNilForKey:kVedioModelItemsLikes fromDictionary:dict];
            self.fetchPlayUrl = [self objectOrNilForKey:kVedioModelItemsFetchPlayUrl fromDictionary:dict];
            self.noCopyright = [self objectOrNilForKey:kVedioModelItemsNoCopyright fromDictionary:dict];
            self.vpicMiddle = [self objectOrNilForKey:kVedioModelItemsVpicMiddle fromDictionary:dict];
            self.vplayUrl = [self objectOrNilForKey:kVedioModelItemsVplayUrl fromDictionary:dict];
            self.wbody = [self objectOrNilForKey:kVedioModelItemsWbody fromDictionary:dict];
            self.wid = [self objectOrNilForKey:kVedioModelItemsWid fromDictionary:dict];
            self.userName = [self objectOrNilForKey:kVedioModelItemsUserName fromDictionary:dict];
            self.userAvatar = [self objectOrNilForKey:kVedioModelItemsUserAvatar fromDictionary:dict];
            self.vsourceUrl = [self objectOrNilForKey:kVedioModelItemsVsourceUrl fromDictionary:dict];
            self.updateTime = [self objectOrNilForKey:kVedioModelItemsUpdateTime fromDictionary:dict];

    }
    
    return self;
    
}

- (NSDictionary *)dictionaryRepresentation
{
    NSMutableDictionary *mutableDict = [NSMutableDictionary dictionary];
    [mutableDict setValue:self.views forKey:kVedioModelItemsViews];
    [mutableDict setValue:self.comments forKey:kVedioModelItemsComments];
    [mutableDict setValue:self.vpicSmall forKey:kVedioModelItemsVpicSmall];
    [mutableDict setValue:self.uid forKey:kVedioModelItemsUid];
    [mutableDict setValue:self.wSensitive forKey:kVedioModelItemsWSensitive];
    [mutableDict setValue:self.siteCode forKey:kVedioModelItemsSiteCode];
    [mutableDict setValue:self.likes forKey:kVedioModelItemsLikes];
    [mutableDict setValue:self.fetchPlayUrl forKey:kVedioModelItemsFetchPlayUrl];
    [mutableDict setValue:self.noCopyright forKey:kVedioModelItemsNoCopyright];
    [mutableDict setValue:self.vpicMiddle forKey:kVedioModelItemsVpicMiddle];
    [mutableDict setValue:self.vplayUrl forKey:kVedioModelItemsVplayUrl];
    [mutableDict setValue:self.wbody forKey:kVedioModelItemsWbody];
    [mutableDict setValue:self.wid forKey:kVedioModelItemsWid];
    [mutableDict setValue:self.userName forKey:kVedioModelItemsUserName];
    [mutableDict setValue:self.userAvatar forKey:kVedioModelItemsUserAvatar];
    [mutableDict setValue:self.vsourceUrl forKey:kVedioModelItemsVsourceUrl];
    [mutableDict setValue:self.updateTime forKey:kVedioModelItemsUpdateTime];

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

    self.views = [aDecoder decodeObjectForKey:kVedioModelItemsViews];
    self.comments = [aDecoder decodeObjectForKey:kVedioModelItemsComments];
    self.vpicSmall = [aDecoder decodeObjectForKey:kVedioModelItemsVpicSmall];
    self.uid = [aDecoder decodeObjectForKey:kVedioModelItemsUid];
    self.wSensitive = [aDecoder decodeObjectForKey:kVedioModelItemsWSensitive];
    self.siteCode = [aDecoder decodeObjectForKey:kVedioModelItemsSiteCode];
    self.likes = [aDecoder decodeObjectForKey:kVedioModelItemsLikes];
    self.fetchPlayUrl = [aDecoder decodeObjectForKey:kVedioModelItemsFetchPlayUrl];
    self.noCopyright = [aDecoder decodeObjectForKey:kVedioModelItemsNoCopyright];
    self.vpicMiddle = [aDecoder decodeObjectForKey:kVedioModelItemsVpicMiddle];
    self.vplayUrl = [aDecoder decodeObjectForKey:kVedioModelItemsVplayUrl];
    self.wbody = [aDecoder decodeObjectForKey:kVedioModelItemsWbody];
    self.wid = [aDecoder decodeObjectForKey:kVedioModelItemsWid];
    self.userName = [aDecoder decodeObjectForKey:kVedioModelItemsUserName];
    self.userAvatar = [aDecoder decodeObjectForKey:kVedioModelItemsUserAvatar];
    self.vsourceUrl = [aDecoder decodeObjectForKey:kVedioModelItemsVsourceUrl];
    self.updateTime = [aDecoder decodeObjectForKey:kVedioModelItemsUpdateTime];
    return self;
}

- (void)encodeWithCoder:(NSCoder *)aCoder
{

    [aCoder encodeObject:_views forKey:kVedioModelItemsViews];
    [aCoder encodeObject:_comments forKey:kVedioModelItemsComments];
    [aCoder encodeObject:_vpicSmall forKey:kVedioModelItemsVpicSmall];
    [aCoder encodeObject:_uid forKey:kVedioModelItemsUid];
    [aCoder encodeObject:_wSensitive forKey:kVedioModelItemsWSensitive];
    [aCoder encodeObject:_siteCode forKey:kVedioModelItemsSiteCode];
    [aCoder encodeObject:_likes forKey:kVedioModelItemsLikes];
    [aCoder encodeObject:_fetchPlayUrl forKey:kVedioModelItemsFetchPlayUrl];
    [aCoder encodeObject:_noCopyright forKey:kVedioModelItemsNoCopyright];
    [aCoder encodeObject:_vpicMiddle forKey:kVedioModelItemsVpicMiddle];
    [aCoder encodeObject:_vplayUrl forKey:kVedioModelItemsVplayUrl];
    [aCoder encodeObject:_wbody forKey:kVedioModelItemsWbody];
    [aCoder encodeObject:_wid forKey:kVedioModelItemsWid];
    [aCoder encodeObject:_userName forKey:kVedioModelItemsUserName];
    [aCoder encodeObject:_userAvatar forKey:kVedioModelItemsUserAvatar];
    [aCoder encodeObject:_vsourceUrl forKey:kVedioModelItemsVsourceUrl];
    [aCoder encodeObject:_updateTime forKey:kVedioModelItemsUpdateTime];
}

- (id)copyWithZone:(NSZone *)zone
{
    VedioModelItems *copy = [[VedioModelItems alloc] init];
    
    if (copy) {

        copy.views = [self.views copyWithZone:zone];
        copy.comments = [self.comments copyWithZone:zone];
        copy.vpicSmall = [self.vpicSmall copyWithZone:zone];
        copy.uid = [self.uid copyWithZone:zone];
        copy.wSensitive = [self.wSensitive copyWithZone:zone];
        copy.siteCode = [self.siteCode copyWithZone:zone];
        copy.likes = [self.likes copyWithZone:zone];
        copy.fetchPlayUrl = [self.fetchPlayUrl copyWithZone:zone];
        copy.noCopyright = [self.noCopyright copyWithZone:zone];
        copy.vpicMiddle = [self.vpicMiddle copyWithZone:zone];
        copy.vplayUrl = [self.vplayUrl copyWithZone:zone];
        copy.wbody = [self.wbody copyWithZone:zone];
        copy.wid = [self.wid copyWithZone:zone];
        copy.userName = [self.userName copyWithZone:zone];
        copy.userAvatar = [self.userAvatar copyWithZone:zone];
        copy.vsourceUrl = [self.vsourceUrl copyWithZone:zone];
        copy.updateTime = [self.updateTime copyWithZone:zone];
    }
    
    return copy;
}


@end
