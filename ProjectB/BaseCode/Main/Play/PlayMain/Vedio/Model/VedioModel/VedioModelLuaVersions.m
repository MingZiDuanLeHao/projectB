//
//  VedioModelLuaVersions.m
//
//  Created by   on 2016/10/11
//  Copyright (c) 2016 __MyCompanyName__. All rights reserved.
//

#import "VedioModelLuaVersions.h"


NSString *const kVedioModelLuaVersionsSina = @"sina";
NSString *const kVedioModelLuaVersionsSohu = @"sohu";
NSString *const kVedioModelLuaVersionsYouku = @"youku";
NSString *const kVedioModelLuaVersionsTudou = @"tudou";
NSString *const kVedioModelLuaVersionsFengxing = @"fengxing";
NSString *const kVedioModelLuaVersionsBilibili = @"bilibili";
NSString *const kVedioModelLuaVersionsWeibo = @"weibo";
NSString *const kVedioModelLuaVersionsMiaopai = @"miaopai";
NSString *const kVedioModelLuaVersionsIqiyi = @"iqiyi";
NSString *const kVedioModelLuaVersionsVlook = @"vlook";
NSString *const kVedioModelLuaVersionsQq = @"qq";
NSString *const kVedioModelLuaVersions56 = @"56";
NSString *const kVedioModelLuaVersionsAcfun = @"acfun";


@interface VedioModelLuaVersions ()

- (id)objectOrNilForKey:(id)aKey fromDictionary:(NSDictionary *)dict;

@end

@implementation VedioModelLuaVersions

@synthesize sina = _sina;
@synthesize sohu = _sohu;
@synthesize youku = _youku;
@synthesize tudou = _tudou;
@synthesize fengxing = _fengxing;
@synthesize bilibili = _bilibili;
@synthesize weibo = _weibo;
@synthesize miaopai = _miaopai;
@synthesize iqiyi = _iqiyi;
@synthesize vlook = _vlook;
@synthesize qq = _qq;
@synthesize acfun = _acfun;


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
            self.sina = [[self objectOrNilForKey:kVedioModelLuaVersionsSina fromDictionary:dict] doubleValue];
            self.sohu = [[self objectOrNilForKey:kVedioModelLuaVersionsSohu fromDictionary:dict] doubleValue];
            self.youku = [[self objectOrNilForKey:kVedioModelLuaVersionsYouku fromDictionary:dict] doubleValue];
            self.tudou = [[self objectOrNilForKey:kVedioModelLuaVersionsTudou fromDictionary:dict] doubleValue];
            self.fengxing = [[self objectOrNilForKey:kVedioModelLuaVersionsFengxing fromDictionary:dict] doubleValue];
            self.bilibili = [[self objectOrNilForKey:kVedioModelLuaVersionsBilibili fromDictionary:dict] doubleValue];
            self.weibo = [[self objectOrNilForKey:kVedioModelLuaVersionsWeibo fromDictionary:dict] doubleValue];
            self.miaopai = [[self objectOrNilForKey:kVedioModelLuaVersionsMiaopai fromDictionary:dict] doubleValue];
            self.iqiyi = [[self objectOrNilForKey:kVedioModelLuaVersionsIqiyi fromDictionary:dict] doubleValue];
            self.vlook = [[self objectOrNilForKey:kVedioModelLuaVersionsVlook fromDictionary:dict] doubleValue];
            self.qq = [[self objectOrNilForKey:kVedioModelLuaVersionsQq fromDictionary:dict] doubleValue];
            self.acfun = [[self objectOrNilForKey:kVedioModelLuaVersionsAcfun fromDictionary:dict] doubleValue];

    }
    
    return self;
    
}

- (NSDictionary *)dictionaryRepresentation
{
    NSMutableDictionary *mutableDict = [NSMutableDictionary dictionary];
    [mutableDict setValue:[NSNumber numberWithDouble:self.sina] forKey:kVedioModelLuaVersionsSina];
    [mutableDict setValue:[NSNumber numberWithDouble:self.sohu] forKey:kVedioModelLuaVersionsSohu];
    [mutableDict setValue:[NSNumber numberWithDouble:self.youku] forKey:kVedioModelLuaVersionsYouku];
    [mutableDict setValue:[NSNumber numberWithDouble:self.tudou] forKey:kVedioModelLuaVersionsTudou];
    [mutableDict setValue:[NSNumber numberWithDouble:self.fengxing] forKey:kVedioModelLuaVersionsFengxing];
    [mutableDict setValue:[NSNumber numberWithDouble:self.bilibili] forKey:kVedioModelLuaVersionsBilibili];
    [mutableDict setValue:[NSNumber numberWithDouble:self.weibo] forKey:kVedioModelLuaVersionsWeibo];
    [mutableDict setValue:[NSNumber numberWithDouble:self.miaopai] forKey:kVedioModelLuaVersionsMiaopai];
    [mutableDict setValue:[NSNumber numberWithDouble:self.iqiyi] forKey:kVedioModelLuaVersionsIqiyi];
    [mutableDict setValue:[NSNumber numberWithDouble:self.vlook] forKey:kVedioModelLuaVersionsVlook];
    [mutableDict setValue:[NSNumber numberWithDouble:self.qq] forKey:kVedioModelLuaVersionsQq];
    [mutableDict setValue:[NSNumber numberWithDouble:self.acfun] forKey:kVedioModelLuaVersionsAcfun];

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

    self.sina = [aDecoder decodeDoubleForKey:kVedioModelLuaVersionsSina];
    self.sohu = [aDecoder decodeDoubleForKey:kVedioModelLuaVersionsSohu];
    self.youku = [aDecoder decodeDoubleForKey:kVedioModelLuaVersionsYouku];
    self.tudou = [aDecoder decodeDoubleForKey:kVedioModelLuaVersionsTudou];
    self.fengxing = [aDecoder decodeDoubleForKey:kVedioModelLuaVersionsFengxing];
    self.bilibili = [aDecoder decodeDoubleForKey:kVedioModelLuaVersionsBilibili];
    self.weibo = [aDecoder decodeDoubleForKey:kVedioModelLuaVersionsWeibo];
    self.miaopai = [aDecoder decodeDoubleForKey:kVedioModelLuaVersionsMiaopai];
    self.iqiyi = [aDecoder decodeDoubleForKey:kVedioModelLuaVersionsIqiyi];
    self.vlook = [aDecoder decodeDoubleForKey:kVedioModelLuaVersionsVlook];
    self.qq = [aDecoder decodeDoubleForKey:kVedioModelLuaVersionsQq];
    self.acfun = [aDecoder decodeDoubleForKey:kVedioModelLuaVersionsAcfun];
    return self;
}

- (void)encodeWithCoder:(NSCoder *)aCoder
{

    [aCoder encodeDouble:_sina forKey:kVedioModelLuaVersionsSina];
    [aCoder encodeDouble:_sohu forKey:kVedioModelLuaVersionsSohu];
    [aCoder encodeDouble:_youku forKey:kVedioModelLuaVersionsYouku];
    [aCoder encodeDouble:_tudou forKey:kVedioModelLuaVersionsTudou];
    [aCoder encodeDouble:_fengxing forKey:kVedioModelLuaVersionsFengxing];
    [aCoder encodeDouble:_bilibili forKey:kVedioModelLuaVersionsBilibili];
    [aCoder encodeDouble:_weibo forKey:kVedioModelLuaVersionsWeibo];
    [aCoder encodeDouble:_miaopai forKey:kVedioModelLuaVersionsMiaopai];
    [aCoder encodeDouble:_iqiyi forKey:kVedioModelLuaVersionsIqiyi];
    [aCoder encodeDouble:_vlook forKey:kVedioModelLuaVersionsVlook];
    [aCoder encodeDouble:_qq forKey:kVedioModelLuaVersionsQq];
    [aCoder encodeDouble:_acfun forKey:kVedioModelLuaVersionsAcfun];
}

- (id)copyWithZone:(NSZone *)zone
{
    VedioModelLuaVersions *copy = [[VedioModelLuaVersions alloc] init];
    
    if (copy) {

        copy.sina = self.sina;
        copy.sohu = self.sohu;
        copy.youku = self.youku;
        copy.tudou = self.tudou;
        copy.fengxing = self.fengxing;
        copy.bilibili = self.bilibili;
        copy.weibo = self.weibo;
        copy.miaopai = self.miaopai;
        copy.iqiyi = self.iqiyi;
        copy.vlook = self.vlook;
        copy.qq = self.qq;
        copy.acfun = self.acfun;
    }
    
    return copy;
}


@end
