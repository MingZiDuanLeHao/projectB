//
//  PictureModelPictureModel.m
//
//  Created by   on 2016/10/9
//  Copyright (c) 2016 __MyCompanyName__. All rights reserved.
//

#import "PictureModelPictureModel.h"
#import "PictureModelItems.h"
#import "PictureModelLuaVersions.h"


NSString *const kPictureModelPictureModelCategory = @"category";
NSString *const kPictureModelPictureModelDataServerUrl = @"data_server_url";
NSString *const kPictureModelPictureModelVip = @"vip";
NSString *const kPictureModelPictureModelUseAdview = @"use_adview";
NSString *const kPictureModelPictureModelInReviewAppVer = @"in_review_app_ver";
NSString *const kPictureModelPictureModelUseLsAdMgr = @"use_ls_ad_mgr";
NSString *const kPictureModelPictureModelTotal = @"total";
NSString *const kPictureModelPictureModelCommentsHidden = @"comments_hidden";
NSString *const kPictureModelPictureModelUgcCloseMsg = @"ugc_close_msg";
NSString *const kPictureModelPictureModelEncrypted = @"encrypted";
NSString *const kPictureModelPictureModelIp = @"ip";
NSString *const kPictureModelPictureModelItems = @"items";
NSString *const kPictureModelPictureModelPage = @"page";
NSString *const kPictureModelPictureModelPageSize = @"page_size";
NSString *const kPictureModelPictureModelNewCount = @"new_count";
NSString *const kPictureModelPictureModelLuaVersions = @"lua_versions";


@interface PictureModelPictureModel ()

- (id)objectOrNilForKey:(id)aKey fromDictionary:(NSDictionary *)dict;

@end

@implementation PictureModelPictureModel

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
            self.category = [self objectOrNilForKey:kPictureModelPictureModelCategory fromDictionary:dict];
            self.dataServerUrl = [self objectOrNilForKey:kPictureModelPictureModelDataServerUrl fromDictionary:dict];
            self.vip = [[self objectOrNilForKey:kPictureModelPictureModelVip fromDictionary:dict] doubleValue];
            self.useAdview = [[self objectOrNilForKey:kPictureModelPictureModelUseAdview fromDictionary:dict] doubleValue];
            self.inReviewAppVer = [self objectOrNilForKey:kPictureModelPictureModelInReviewAppVer fromDictionary:dict];
            self.useLsAdMgr = [[self objectOrNilForKey:kPictureModelPictureModelUseLsAdMgr fromDictionary:dict] doubleValue];
            self.total = [[self objectOrNilForKey:kPictureModelPictureModelTotal fromDictionary:dict] doubleValue];
            self.commentsHidden = [[self objectOrNilForKey:kPictureModelPictureModelCommentsHidden fromDictionary:dict] doubleValue];
            self.ugcCloseMsg = [self objectOrNilForKey:kPictureModelPictureModelUgcCloseMsg fromDictionary:dict];
            self.encrypted = [[self objectOrNilForKey:kPictureModelPictureModelEncrypted fromDictionary:dict] doubleValue];
            self.ip = [self objectOrNilForKey:kPictureModelPictureModelIp fromDictionary:dict];
    NSObject *receivedPictureModelItems = [dict objectForKey:kPictureModelPictureModelItems];
    NSMutableArray *parsedPictureModelItems = [NSMutableArray array];
    if ([receivedPictureModelItems isKindOfClass:[NSArray class]]) {
        for (NSDictionary *item in (NSArray *)receivedPictureModelItems) {
            if ([item isKindOfClass:[NSDictionary class]]) {
                [parsedPictureModelItems addObject:[PictureModelItems modelObjectWithDictionary:item]];
            }
       }
    } else if ([receivedPictureModelItems isKindOfClass:[NSDictionary class]]) {
       [parsedPictureModelItems addObject:[PictureModelItems modelObjectWithDictionary:(NSDictionary *)receivedPictureModelItems]];
    }

    self.items = [NSArray arrayWithArray:parsedPictureModelItems];
            self.page = [self objectOrNilForKey:kPictureModelPictureModelPage fromDictionary:dict];
            self.pageSize = [self objectOrNilForKey:kPictureModelPictureModelPageSize fromDictionary:dict];
            self.luaVersions = [PictureModelLuaVersions modelObjectWithDictionary:[dict objectForKey:kPictureModelPictureModelLuaVersions]];

    }
    
    return self;
    
}

- (NSDictionary *)dictionaryRepresentation
{
    NSMutableDictionary *mutableDict = [NSMutableDictionary dictionary];
    [mutableDict setValue:self.category forKey:kPictureModelPictureModelCategory];
    [mutableDict setValue:self.dataServerUrl forKey:kPictureModelPictureModelDataServerUrl];
    [mutableDict setValue:[NSNumber numberWithDouble:self.vip] forKey:kPictureModelPictureModelVip];
    [mutableDict setValue:[NSNumber numberWithDouble:self.useAdview] forKey:kPictureModelPictureModelUseAdview];
    [mutableDict setValue:self.inReviewAppVer forKey:kPictureModelPictureModelInReviewAppVer];
    [mutableDict setValue:[NSNumber numberWithDouble:self.useLsAdMgr] forKey:kPictureModelPictureModelUseLsAdMgr];
    [mutableDict setValue:[NSNumber numberWithDouble:self.total] forKey:kPictureModelPictureModelTotal];
    [mutableDict setValue:[NSNumber numberWithDouble:self.commentsHidden] forKey:kPictureModelPictureModelCommentsHidden];
    [mutableDict setValue:self.ugcCloseMsg forKey:kPictureModelPictureModelUgcCloseMsg];
    [mutableDict setValue:[NSNumber numberWithDouble:self.encrypted] forKey:kPictureModelPictureModelEncrypted];
    [mutableDict setValue:self.ip forKey:kPictureModelPictureModelIp];
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
    [mutableDict setValue:[NSArray arrayWithArray:tempArrayForItems] forKey:kPictureModelPictureModelItems];
    [mutableDict setValue:self.page forKey:kPictureModelPictureModelPage];
    [mutableDict setValue:self.pageSize forKey:kPictureModelPictureModelPageSize];
    [mutableDict setValue:[self.luaVersions dictionaryRepresentation] forKey:kPictureModelPictureModelLuaVersions];

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

    self.category = [aDecoder decodeObjectForKey:kPictureModelPictureModelCategory];
    self.dataServerUrl = [aDecoder decodeObjectForKey:kPictureModelPictureModelDataServerUrl];
    self.vip = [aDecoder decodeDoubleForKey:kPictureModelPictureModelVip];
    self.useAdview = [aDecoder decodeDoubleForKey:kPictureModelPictureModelUseAdview];
    self.inReviewAppVer = [aDecoder decodeObjectForKey:kPictureModelPictureModelInReviewAppVer];
    self.useLsAdMgr = [aDecoder decodeDoubleForKey:kPictureModelPictureModelUseLsAdMgr];
    self.total = [aDecoder decodeDoubleForKey:kPictureModelPictureModelTotal];
    self.commentsHidden = [aDecoder decodeDoubleForKey:kPictureModelPictureModelCommentsHidden];
    self.ugcCloseMsg = [aDecoder decodeObjectForKey:kPictureModelPictureModelUgcCloseMsg];
    self.encrypted = [aDecoder decodeDoubleForKey:kPictureModelPictureModelEncrypted];
    self.ip = [aDecoder decodeObjectForKey:kPictureModelPictureModelIp];
    self.items = [aDecoder decodeObjectForKey:kPictureModelPictureModelItems];
    self.page = [aDecoder decodeObjectForKey:kPictureModelPictureModelPage];
    self.pageSize = [aDecoder decodeObjectForKey:kPictureModelPictureModelPageSize];
    self.luaVersions = [aDecoder decodeObjectForKey:kPictureModelPictureModelLuaVersions];
    return self;
}

- (void)encodeWithCoder:(NSCoder *)aCoder
{

    [aCoder encodeObject:_category forKey:kPictureModelPictureModelCategory];
    [aCoder encodeObject:_dataServerUrl forKey:kPictureModelPictureModelDataServerUrl];
    [aCoder encodeDouble:_vip forKey:kPictureModelPictureModelVip];
    [aCoder encodeDouble:_useAdview forKey:kPictureModelPictureModelUseAdview];
    [aCoder encodeObject:_inReviewAppVer forKey:kPictureModelPictureModelInReviewAppVer];
    [aCoder encodeDouble:_useLsAdMgr forKey:kPictureModelPictureModelUseLsAdMgr];
    [aCoder encodeDouble:_total forKey:kPictureModelPictureModelTotal];
    [aCoder encodeDouble:_commentsHidden forKey:kPictureModelPictureModelCommentsHidden];
    [aCoder encodeObject:_ugcCloseMsg forKey:kPictureModelPictureModelUgcCloseMsg];
    [aCoder encodeDouble:_encrypted forKey:kPictureModelPictureModelEncrypted];
    [aCoder encodeObject:_ip forKey:kPictureModelPictureModelIp];
    [aCoder encodeObject:_items forKey:kPictureModelPictureModelItems];
    [aCoder encodeObject:_page forKey:kPictureModelPictureModelPage];
    [aCoder encodeObject:_pageSize forKey:kPictureModelPictureModelPageSize];
    [aCoder encodeObject:_luaVersions forKey:kPictureModelPictureModelLuaVersions];
}

- (id)copyWithZone:(NSZone *)zone
{
    PictureModelPictureModel *copy = [[PictureModelPictureModel alloc] init];
    
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
