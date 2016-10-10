//
//  BeautyModelLuaVersions.m
//
//  Created by   on 2016/10/9
//  Copyright (c) 2016 __MyCompanyName__. All rights reserved.
//

#import "BeautyModelLuaVersions.h"


NSString *const kBeautyModelLuaVersionsSina = @"sina";
NSString *const kBeautyModelLuaVersionsSohu = @"sohu";
NSString *const kBeautyModelLuaVersionsYouku = @"youku";
NSString *const kBeautyModelLuaVersionsTudou = @"tudou";
NSString *const kBeautyModelLuaVersionsFengxing = @"fengxing";
NSString *const kBeautyModelLuaVersionsBilibili = @"bilibili";
NSString *const kBeautyModelLuaVersionsWeibo = @"weibo";
NSString *const kBeautyModelLuaVersionsMiaopai = @"miaopai";
NSString *const kBeautyModelLuaVersionsIqiyi = @"iqiyi";
NSString *const kBeautyModelLuaVersionsVlook = @"vlook";
NSString *const kBeautyModelLuaVersionsQq = @"qq";
NSString *const kBeautyModelLuaVersionsAcfun = @"acfun";


@interface BeautyModelLuaVersions ()

- (id)objectOrNilForKey:(id)aKey fromDictionary:(NSDictionary *)dict;

@end

@implementation BeautyModelLuaVersions

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
            self.sina = [[self objectOrNilForKey:kBeautyModelLuaVersionsSina fromDictionary:dict] doubleValue];
            self.sohu = [[self objectOrNilForKey:kBeautyModelLuaVersionsSohu fromDictionary:dict] doubleValue];
            self.youku = [[self objectOrNilForKey:kBeautyModelLuaVersionsYouku fromDictionary:dict] doubleValue];
            self.tudou = [[self objectOrNilForKey:kBeautyModelLuaVersionsTudou fromDictionary:dict] doubleValue];
            self.fengxing = [[self objectOrNilForKey:kBeautyModelLuaVersionsFengxing fromDictionary:dict] doubleValue];
            self.bilibili = [[self objectOrNilForKey:kBeautyModelLuaVersionsBilibili fromDictionary:dict] doubleValue];
            self.weibo = [[self objectOrNilForKey:kBeautyModelLuaVersionsWeibo fromDictionary:dict] doubleValue];
            self.miaopai = [[self objectOrNilForKey:kBeautyModelLuaVersionsMiaopai fromDictionary:dict] doubleValue];
            self.iqiyi = [[self objectOrNilForKey:kBeautyModelLuaVersionsIqiyi fromDictionary:dict] doubleValue];
            self.vlook = [[self objectOrNilForKey:kBeautyModelLuaVersionsVlook fromDictionary:dict] doubleValue];
            self.qq = [[self objectOrNilForKey:kBeautyModelLuaVersionsQq fromDictionary:dict] doubleValue];
            self.acfun = [[self objectOrNilForKey:kBeautyModelLuaVersionsAcfun fromDictionary:dict] doubleValue];

    }
    
    return self;
    
}

- (NSDictionary *)dictionaryRepresentation
{
    NSMutableDictionary *mutableDict = [NSMutableDictionary dictionary];
    [mutableDict setValue:[NSNumber numberWithDouble:self.sina] forKey:kBeautyModelLuaVersionsSina];
    [mutableDict setValue:[NSNumber numberWithDouble:self.sohu] forKey:kBeautyModelLuaVersionsSohu];
    [mutableDict setValue:[NSNumber numberWithDouble:self.youku] forKey:kBeautyModelLuaVersionsYouku];
    [mutableDict setValue:[NSNumber numberWithDouble:self.tudou] forKey:kBeautyModelLuaVersionsTudou];
    [mutableDict setValue:[NSNumber numberWithDouble:self.fengxing] forKey:kBeautyModelLuaVersionsFengxing];
    [mutableDict setValue:[NSNumber numberWithDouble:self.bilibili] forKey:kBeautyModelLuaVersionsBilibili];
    [mutableDict setValue:[NSNumber numberWithDouble:self.weibo] forKey:kBeautyModelLuaVersionsWeibo];
    [mutableDict setValue:[NSNumber numberWithDouble:self.miaopai] forKey:kBeautyModelLuaVersionsMiaopai];
    [mutableDict setValue:[NSNumber numberWithDouble:self.iqiyi] forKey:kBeautyModelLuaVersionsIqiyi];
    [mutableDict setValue:[NSNumber numberWithDouble:self.vlook] forKey:kBeautyModelLuaVersionsVlook];
    [mutableDict setValue:[NSNumber numberWithDouble:self.qq] forKey:kBeautyModelLuaVersionsQq];
    [mutableDict setValue:[NSNumber numberWithDouble:self.acfun] forKey:kBeautyModelLuaVersionsAcfun];

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

    self.sina = [aDecoder decodeDoubleForKey:kBeautyModelLuaVersionsSina];
    self.sohu = [aDecoder decodeDoubleForKey:kBeautyModelLuaVersionsSohu];
    self.youku = [aDecoder decodeDoubleForKey:kBeautyModelLuaVersionsYouku];
    self.tudou = [aDecoder decodeDoubleForKey:kBeautyModelLuaVersionsTudou];
    self.fengxing = [aDecoder decodeDoubleForKey:kBeautyModelLuaVersionsFengxing];
    self.bilibili = [aDecoder decodeDoubleForKey:kBeautyModelLuaVersionsBilibili];
    self.weibo = [aDecoder decodeDoubleForKey:kBeautyModelLuaVersionsWeibo];
    self.miaopai = [aDecoder decodeDoubleForKey:kBeautyModelLuaVersionsMiaopai];
    self.iqiyi = [aDecoder decodeDoubleForKey:kBeautyModelLuaVersionsIqiyi];
    self.vlook = [aDecoder decodeDoubleForKey:kBeautyModelLuaVersionsVlook];
    self.qq = [aDecoder decodeDoubleForKey:kBeautyModelLuaVersionsQq];
    self.acfun = [aDecoder decodeDoubleForKey:kBeautyModelLuaVersionsAcfun];
    return self;
}

- (void)encodeWithCoder:(NSCoder *)aCoder
{

    [aCoder encodeDouble:_sina forKey:kBeautyModelLuaVersionsSina];
    [aCoder encodeDouble:_sohu forKey:kBeautyModelLuaVersionsSohu];
    [aCoder encodeDouble:_youku forKey:kBeautyModelLuaVersionsYouku];
    [aCoder encodeDouble:_tudou forKey:kBeautyModelLuaVersionsTudou];
    [aCoder encodeDouble:_fengxing forKey:kBeautyModelLuaVersionsFengxing];
    [aCoder encodeDouble:_bilibili forKey:kBeautyModelLuaVersionsBilibili];
    [aCoder encodeDouble:_weibo forKey:kBeautyModelLuaVersionsWeibo];
    [aCoder encodeDouble:_miaopai forKey:kBeautyModelLuaVersionsMiaopai];
    [aCoder encodeDouble:_iqiyi forKey:kBeautyModelLuaVersionsIqiyi];
    [aCoder encodeDouble:_vlook forKey:kBeautyModelLuaVersionsVlook];
    [aCoder encodeDouble:_qq forKey:kBeautyModelLuaVersionsQq];
    [aCoder encodeDouble:_acfun forKey:kBeautyModelLuaVersionsAcfun];
}

- (id)copyWithZone:(NSZone *)zone
{
    BeautyModelLuaVersions *copy = [[BeautyModelLuaVersions alloc] init];
    
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
