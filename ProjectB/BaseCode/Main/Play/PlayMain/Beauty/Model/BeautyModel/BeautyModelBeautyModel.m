//
//  BeautyModelBeautyModel.m
//
//  Created by   on 2016/10/9
//  Copyright (c) 2016 __MyCompanyName__. All rights reserved.
//

#import "BeautyModelBeautyModel.h"
#import "BeautyModelItems.h"
#import "BeautyModelLuaVersions.h"


NSString *const kBeautyModelBeautyModelCategory = @"category";
NSString *const kBeautyModelBeautyModelDataServerUrl = @"data_server_url";
NSString *const kBeautyModelBeautyModelVip = @"vip";
NSString *const kBeautyModelBeautyModelUseAdview = @"use_adview";
NSString *const kBeautyModelBeautyModelInReviewAppVer = @"in_review_app_ver";
NSString *const kBeautyModelBeautyModelUseLsAdMgr = @"use_ls_ad_mgr";
NSString *const kBeautyModelBeautyModelTotal = @"total";
NSString *const kBeautyModelBeautyModelCommentsHidden = @"comments_hidden";
NSString *const kBeautyModelBeautyModelUgcCloseMsg = @"ugc_close_msg";
NSString *const kBeautyModelBeautyModelEncrypted = @"encrypted";
NSString *const kBeautyModelBeautyModelIp = @"ip";
NSString *const kBeautyModelBeautyModelItems = @"items";
NSString *const kBeautyModelBeautyModelPage = @"page";
NSString *const kBeautyModelBeautyModelPageSize = @"page_size";
NSString *const kBeautyModelBeautyModelNewCount = @"new_count";
NSString *const kBeautyModelBeautyModelLuaVersions = @"lua_versions";


@interface BeautyModelBeautyModel ()

- (id)objectOrNilForKey:(id)aKey fromDictionary:(NSDictionary *)dict;

@end

@implementation BeautyModelBeautyModel

@synthesize category = _category;
@synthesize dataServerUrl = _dataServerUrl;
@synthesize vip = _vip;
@synthesize useAdview = _useAdview;
@synthesize inReviewAppVer = _inReviewAppVer;
@synthesize useLsAdMgr = _useLsAdMgr;
@synthesize total = _total;
@synthesize commentsHidden = _commentsHidden;
@synthesize ugcCloseMsg = _ugcCloseMsg;
@synthesize encrypted = _encrypted;
@synthesize ip = _ip;
@synthesize items = _items;
@synthesize page = _page;
@synthesize pageSize = _pageSize;
//@synthesize newCount = _newCount;
@synthesize luaVersions = _luaVersions;


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
            self.category = [self objectOrNilForKey:kBeautyModelBeautyModelCategory fromDictionary:dict];
            self.dataServerUrl = [self objectOrNilForKey:kBeautyModelBeautyModelDataServerUrl fromDictionary:dict];
            self.vip = [[self objectOrNilForKey:kBeautyModelBeautyModelVip fromDictionary:dict] doubleValue];
            self.useAdview = [[self objectOrNilForKey:kBeautyModelBeautyModelUseAdview fromDictionary:dict] doubleValue];
            self.inReviewAppVer = [self objectOrNilForKey:kBeautyModelBeautyModelInReviewAppVer fromDictionary:dict];
            self.useLsAdMgr = [[self objectOrNilForKey:kBeautyModelBeautyModelUseLsAdMgr fromDictionary:dict] doubleValue];
            self.total = [[self objectOrNilForKey:kBeautyModelBeautyModelTotal fromDictionary:dict] doubleValue];
            self.commentsHidden = [[self objectOrNilForKey:kBeautyModelBeautyModelCommentsHidden fromDictionary:dict] doubleValue];
            self.ugcCloseMsg = [self objectOrNilForKey:kBeautyModelBeautyModelUgcCloseMsg fromDictionary:dict];
            self.encrypted = [[self objectOrNilForKey:kBeautyModelBeautyModelEncrypted fromDictionary:dict] doubleValue];
            self.ip = [self objectOrNilForKey:kBeautyModelBeautyModelIp fromDictionary:dict];
    NSObject *receivedBeautyModelItems = [dict objectForKey:kBeautyModelBeautyModelItems];
    NSMutableArray *parsedBeautyModelItems = [NSMutableArray array];
    if ([receivedBeautyModelItems isKindOfClass:[NSArray class]]) {
        for (NSDictionary *item in (NSArray *)receivedBeautyModelItems) {
            if ([item isKindOfClass:[NSDictionary class]]) {
                [parsedBeautyModelItems addObject:[BeautyModelItems modelObjectWithDictionary:item]];
            }
       }
    } else if ([receivedBeautyModelItems isKindOfClass:[NSDictionary class]]) {
       [parsedBeautyModelItems addObject:[BeautyModelItems modelObjectWithDictionary:(NSDictionary *)receivedBeautyModelItems]];
    }

    self.items = [NSArray arrayWithArray:parsedBeautyModelItems];
            self.page = [self objectOrNilForKey:kBeautyModelBeautyModelPage fromDictionary:dict];
            self.pageSize = [self objectOrNilForKey:kBeautyModelBeautyModelPageSize fromDictionary:dict];
       //     self.newCount = [self objectOrNilForKey:kBeautyModelBeautyModelNewCount fromDictionary:dict];
            self.luaVersions = [BeautyModelLuaVersions modelObjectWithDictionary:[dict objectForKey:kBeautyModelBeautyModelLuaVersions]];

    }
    
    return self;
    
}

- (NSDictionary *)dictionaryRepresentation
{
    NSMutableDictionary *mutableDict = [NSMutableDictionary dictionary];
    [mutableDict setValue:self.category forKey:kBeautyModelBeautyModelCategory];
    [mutableDict setValue:self.dataServerUrl forKey:kBeautyModelBeautyModelDataServerUrl];
    [mutableDict setValue:[NSNumber numberWithDouble:self.vip] forKey:kBeautyModelBeautyModelVip];
    [mutableDict setValue:[NSNumber numberWithDouble:self.useAdview] forKey:kBeautyModelBeautyModelUseAdview];
    [mutableDict setValue:self.inReviewAppVer forKey:kBeautyModelBeautyModelInReviewAppVer];
    [mutableDict setValue:[NSNumber numberWithDouble:self.useLsAdMgr] forKey:kBeautyModelBeautyModelUseLsAdMgr];
    [mutableDict setValue:[NSNumber numberWithDouble:self.total] forKey:kBeautyModelBeautyModelTotal];
    [mutableDict setValue:[NSNumber numberWithDouble:self.commentsHidden] forKey:kBeautyModelBeautyModelCommentsHidden];
    [mutableDict setValue:self.ugcCloseMsg forKey:kBeautyModelBeautyModelUgcCloseMsg];
    [mutableDict setValue:[NSNumber numberWithDouble:self.encrypted] forKey:kBeautyModelBeautyModelEncrypted];
    [mutableDict setValue:self.ip forKey:kBeautyModelBeautyModelIp];
    NSMutableArray *tempArrayForItems = [NSMutableArray array];
    for (NSObject *subArrayObject in self.items) {
        if([subArrayObject respondsToSelector:@selector(dictionaryRepresentation)]) {
            // This class is a model object
            [tempArrayForItems addObject:[subArrayObject performSelector:@selector(dictionaryRepresentation)]];
        } else {
            // Generic object
            [tempArrayForItems addObject:subArrayObject];
        }
    }
    [mutableDict setValue:[NSArray arrayWithArray:tempArrayForItems] forKey:kBeautyModelBeautyModelItems];
    [mutableDict setValue:self.page forKey:kBeautyModelBeautyModelPage];
    [mutableDict setValue:self.pageSize forKey:kBeautyModelBeautyModelPageSize];
    //[mutableDict setValue:self.newCount forKey:kBeautyModelBeautyModelNewCount];
    [mutableDict setValue:[self.luaVersions dictionaryRepresentation] forKey:kBeautyModelBeautyModelLuaVersions];

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

    self.category = [aDecoder decodeObjectForKey:kBeautyModelBeautyModelCategory];
    self.dataServerUrl = [aDecoder decodeObjectForKey:kBeautyModelBeautyModelDataServerUrl];
    self.vip = [aDecoder decodeDoubleForKey:kBeautyModelBeautyModelVip];
    self.useAdview = [aDecoder decodeDoubleForKey:kBeautyModelBeautyModelUseAdview];
    self.inReviewAppVer = [aDecoder decodeObjectForKey:kBeautyModelBeautyModelInReviewAppVer];
    self.useLsAdMgr = [aDecoder decodeDoubleForKey:kBeautyModelBeautyModelUseLsAdMgr];
    self.total = [aDecoder decodeDoubleForKey:kBeautyModelBeautyModelTotal];
    self.commentsHidden = [aDecoder decodeDoubleForKey:kBeautyModelBeautyModelCommentsHidden];
    self.ugcCloseMsg = [aDecoder decodeObjectForKey:kBeautyModelBeautyModelUgcCloseMsg];
    self.encrypted = [aDecoder decodeDoubleForKey:kBeautyModelBeautyModelEncrypted];
    self.ip = [aDecoder decodeObjectForKey:kBeautyModelBeautyModelIp];
    self.items = [aDecoder decodeObjectForKey:kBeautyModelBeautyModelItems];
    self.page = [aDecoder decodeObjectForKey:kBeautyModelBeautyModelPage];
    self.pageSize = [aDecoder decodeObjectForKey:kBeautyModelBeautyModelPageSize];
   // self.newCount = [aDecoder decodeObjectForKey:kBeautyModelBeautyModelNewCount];
    self.luaVersions = [aDecoder decodeObjectForKey:kBeautyModelBeautyModelLuaVersions];
    return self;
}

- (void)encodeWithCoder:(NSCoder *)aCoder
{

    [aCoder encodeObject:_category forKey:kBeautyModelBeautyModelCategory];
    [aCoder encodeObject:_dataServerUrl forKey:kBeautyModelBeautyModelDataServerUrl];
    [aCoder encodeDouble:_vip forKey:kBeautyModelBeautyModelVip];
    [aCoder encodeDouble:_useAdview forKey:kBeautyModelBeautyModelUseAdview];
    [aCoder encodeObject:_inReviewAppVer forKey:kBeautyModelBeautyModelInReviewAppVer];
    [aCoder encodeDouble:_useLsAdMgr forKey:kBeautyModelBeautyModelUseLsAdMgr];
    [aCoder encodeDouble:_total forKey:kBeautyModelBeautyModelTotal];
    [aCoder encodeDouble:_commentsHidden forKey:kBeautyModelBeautyModelCommentsHidden];
    [aCoder encodeObject:_ugcCloseMsg forKey:kBeautyModelBeautyModelUgcCloseMsg];
    [aCoder encodeDouble:_encrypted forKey:kBeautyModelBeautyModelEncrypted];
    [aCoder encodeObject:_ip forKey:kBeautyModelBeautyModelIp];
    [aCoder encodeObject:_items forKey:kBeautyModelBeautyModelItems];
    [aCoder encodeObject:_page forKey:kBeautyModelBeautyModelPage];
    [aCoder encodeObject:_pageSize forKey:kBeautyModelBeautyModelPageSize];
  //  [aCoder encodeObject:_newCount forKey:kBeautyModelBeautyModelNewCount];
    [aCoder encodeObject:_luaVersions forKey:kBeautyModelBeautyModelLuaVersions];
}

- (id)copyWithZone:(NSZone *)zone
{
    BeautyModelBeautyModel *copy = [[BeautyModelBeautyModel alloc] init];
    
    if (copy) {

        copy.category = [self.category copyWithZone:zone];
        copy.dataServerUrl = [self.dataServerUrl copyWithZone:zone];
        copy.vip = self.vip;
        copy.useAdview = self.useAdview;
        copy.inReviewAppVer = [self.inReviewAppVer copyWithZone:zone];
        copy.useLsAdMgr = self.useLsAdMgr;
        copy.total = self.total;
        copy.commentsHidden = self.commentsHidden;
        copy.ugcCloseMsg = [self.ugcCloseMsg copyWithZone:zone];
        copy.encrypted = self.encrypted;
        copy.ip = [self.ip copyWithZone:zone];
        copy.items = [self.items copyWithZone:zone];
        copy.page = [self.page copyWithZone:zone];
        copy.pageSize = [self.pageSize copyWithZone:zone];
      //  copy.newCount = [self.newCount copyWithZone:zone];
        copy.luaVersions = [self.luaVersions copyWithZone:zone];
    }
    
    return copy;
}


@end
