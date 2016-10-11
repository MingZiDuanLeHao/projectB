//
//  VedioModelVedioModel.m
//
//  Created by   on 2016/10/11
//  Copyright (c) 2016 __MyCompanyName__. All rights reserved.
//

#import "VedioModelVedioModel.h"
#import "VedioModelItems.h"
#import "VedioModelLuaVersions.h"


NSString *const kVedioModelVedioModelCategory = @"category";
NSString *const kVedioModelVedioModelDataServerUrl = @"data_server_url";
NSString *const kVedioModelVedioModelVip = @"vip";
NSString *const kVedioModelVedioModelUseAdview = @"use_adview";
NSString *const kVedioModelVedioModelInReviewAppVer = @"in_review_app_ver";
NSString *const kVedioModelVedioModelUseLsAdMgr = @"use_ls_ad_mgr";
NSString *const kVedioModelVedioModelTotal = @"total";
NSString *const kVedioModelVedioModelCommentsHidden = @"comments_hidden";
NSString *const kVedioModelVedioModelUgcCloseMsg = @"ugc_close_msg";
NSString *const kVedioModelVedioModelEncrypted = @"encrypted";
NSString *const kVedioModelVedioModelIp = @"ip";
NSString *const kVedioModelVedioModelItems = @"items";
NSString *const kVedioModelVedioModelPage = @"page";
NSString *const kVedioModelVedioModelPageSize = @"page_size";
NSString *const kVedioModelVedioModelNewCount = @"new_count";
NSString *const kVedioModelVedioModelLuaVersions = @"lua_versions";


@interface VedioModelVedioModel ()

- (id)objectOrNilForKey:(id)aKey fromDictionary:(NSDictionary *)dict;

@end

@implementation VedioModelVedioModel

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
            self.category = [self objectOrNilForKey:kVedioModelVedioModelCategory fromDictionary:dict];
            self.dataServerUrl = [self objectOrNilForKey:kVedioModelVedioModelDataServerUrl fromDictionary:dict];
            self.vip = [[self objectOrNilForKey:kVedioModelVedioModelVip fromDictionary:dict] doubleValue];
            self.useAdview = [[self objectOrNilForKey:kVedioModelVedioModelUseAdview fromDictionary:dict] doubleValue];
            self.inReviewAppVer = [self objectOrNilForKey:kVedioModelVedioModelInReviewAppVer fromDictionary:dict];
            self.useLsAdMgr = [[self objectOrNilForKey:kVedioModelVedioModelUseLsAdMgr fromDictionary:dict] doubleValue];
            self.total = [[self objectOrNilForKey:kVedioModelVedioModelTotal fromDictionary:dict] doubleValue];
            self.commentsHidden = [[self objectOrNilForKey:kVedioModelVedioModelCommentsHidden fromDictionary:dict] doubleValue];
            self.ugcCloseMsg = [self objectOrNilForKey:kVedioModelVedioModelUgcCloseMsg fromDictionary:dict];
            self.encrypted = [[self objectOrNilForKey:kVedioModelVedioModelEncrypted fromDictionary:dict] doubleValue];
            self.ip = [self objectOrNilForKey:kVedioModelVedioModelIp fromDictionary:dict];
    NSObject *receivedVedioModelItems = [dict objectForKey:kVedioModelVedioModelItems];
    NSMutableArray *parsedVedioModelItems = [NSMutableArray array];
    if ([receivedVedioModelItems isKindOfClass:[NSArray class]]) {
        for (NSDictionary *item in (NSArray *)receivedVedioModelItems) {
            if ([item isKindOfClass:[NSDictionary class]]) {
                [parsedVedioModelItems addObject:[VedioModelItems modelObjectWithDictionary:item]];
            }
       }
    } else if ([receivedVedioModelItems isKindOfClass:[NSDictionary class]]) {
       [parsedVedioModelItems addObject:[VedioModelItems modelObjectWithDictionary:(NSDictionary *)receivedVedioModelItems]];
    }

    self.items = [NSArray arrayWithArray:parsedVedioModelItems];
            self.page = [self objectOrNilForKey:kVedioModelVedioModelPage fromDictionary:dict];
            self.pageSize = [self objectOrNilForKey:kVedioModelVedioModelPageSize fromDictionary:dict];
            self.luaVersions = [VedioModelLuaVersions modelObjectWithDictionary:[dict objectForKey:kVedioModelVedioModelLuaVersions]];

    }
    
    return self;
    
}

- (NSDictionary *)dictionaryRepresentation
{
    NSMutableDictionary *mutableDict = [NSMutableDictionary dictionary];
    [mutableDict setValue:self.category forKey:kVedioModelVedioModelCategory];
    [mutableDict setValue:self.dataServerUrl forKey:kVedioModelVedioModelDataServerUrl];
    [mutableDict setValue:[NSNumber numberWithDouble:self.vip] forKey:kVedioModelVedioModelVip];
    [mutableDict setValue:[NSNumber numberWithDouble:self.useAdview] forKey:kVedioModelVedioModelUseAdview];
    [mutableDict setValue:self.inReviewAppVer forKey:kVedioModelVedioModelInReviewAppVer];
    [mutableDict setValue:[NSNumber numberWithDouble:self.useLsAdMgr] forKey:kVedioModelVedioModelUseLsAdMgr];
    [mutableDict setValue:[NSNumber numberWithDouble:self.total] forKey:kVedioModelVedioModelTotal];
    [mutableDict setValue:[NSNumber numberWithDouble:self.commentsHidden] forKey:kVedioModelVedioModelCommentsHidden];
    [mutableDict setValue:self.ugcCloseMsg forKey:kVedioModelVedioModelUgcCloseMsg];
    [mutableDict setValue:[NSNumber numberWithDouble:self.encrypted] forKey:kVedioModelVedioModelEncrypted];
    [mutableDict setValue:self.ip forKey:kVedioModelVedioModelIp];
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
    [mutableDict setValue:[NSArray arrayWithArray:tempArrayForItems] forKey:kVedioModelVedioModelItems];
    [mutableDict setValue:self.page forKey:kVedioModelVedioModelPage];
    [mutableDict setValue:self.pageSize forKey:kVedioModelVedioModelPageSize];
    [mutableDict setValue:[self.luaVersions dictionaryRepresentation] forKey:kVedioModelVedioModelLuaVersions];

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

    self.category = [aDecoder decodeObjectForKey:kVedioModelVedioModelCategory];
    self.dataServerUrl = [aDecoder decodeObjectForKey:kVedioModelVedioModelDataServerUrl];
    self.vip = [aDecoder decodeDoubleForKey:kVedioModelVedioModelVip];
    self.useAdview = [aDecoder decodeDoubleForKey:kVedioModelVedioModelUseAdview];
    self.inReviewAppVer = [aDecoder decodeObjectForKey:kVedioModelVedioModelInReviewAppVer];
    self.useLsAdMgr = [aDecoder decodeDoubleForKey:kVedioModelVedioModelUseLsAdMgr];
    self.total = [aDecoder decodeDoubleForKey:kVedioModelVedioModelTotal];
    self.commentsHidden = [aDecoder decodeDoubleForKey:kVedioModelVedioModelCommentsHidden];
    self.ugcCloseMsg = [aDecoder decodeObjectForKey:kVedioModelVedioModelUgcCloseMsg];
    self.encrypted = [aDecoder decodeDoubleForKey:kVedioModelVedioModelEncrypted];
    self.ip = [aDecoder decodeObjectForKey:kVedioModelVedioModelIp];
    self.items = [aDecoder decodeObjectForKey:kVedioModelVedioModelItems];
    self.page = [aDecoder decodeObjectForKey:kVedioModelVedioModelPage];
    self.pageSize = [aDecoder decodeObjectForKey:kVedioModelVedioModelPageSize];
    self.luaVersions = [aDecoder decodeObjectForKey:kVedioModelVedioModelLuaVersions];
    return self;
}

- (void)encodeWithCoder:(NSCoder *)aCoder
{

    [aCoder encodeObject:_category forKey:kVedioModelVedioModelCategory];
    [aCoder encodeObject:_dataServerUrl forKey:kVedioModelVedioModelDataServerUrl];
    [aCoder encodeDouble:_vip forKey:kVedioModelVedioModelVip];
    [aCoder encodeDouble:_useAdview forKey:kVedioModelVedioModelUseAdview];
    [aCoder encodeObject:_inReviewAppVer forKey:kVedioModelVedioModelInReviewAppVer];
    [aCoder encodeDouble:_useLsAdMgr forKey:kVedioModelVedioModelUseLsAdMgr];
    [aCoder encodeDouble:_total forKey:kVedioModelVedioModelTotal];
    [aCoder encodeDouble:_commentsHidden forKey:kVedioModelVedioModelCommentsHidden];
    [aCoder encodeObject:_ugcCloseMsg forKey:kVedioModelVedioModelUgcCloseMsg];
    [aCoder encodeDouble:_encrypted forKey:kVedioModelVedioModelEncrypted];
    [aCoder encodeObject:_ip forKey:kVedioModelVedioModelIp];
    [aCoder encodeObject:_items forKey:kVedioModelVedioModelItems];
    [aCoder encodeObject:_page forKey:kVedioModelVedioModelPage];
    [aCoder encodeObject:_pageSize forKey:kVedioModelVedioModelPageSize];
    [aCoder encodeObject:_luaVersions forKey:kVedioModelVedioModelLuaVersions];
}

- (id)copyWithZone:(NSZone *)zone
{
    VedioModelVedioModel *copy = [[VedioModelVedioModel alloc] init];
    
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
        copy.luaVersions = [self.luaVersions copyWithZone:zone];
    }
    
    return copy;
}


@end
