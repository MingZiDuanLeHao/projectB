//
//  PictureModelLuaVersions.m
//
//  Created by   on 2016/10/9
//  Copyright (c) 2016 __MyCompanyName__. All rights reserved.
//

#import "PictureModelLuaVersions.h"


NSString *const kPictureModelLuaVersionsSina = @"sina";
NSString *const kPictureModelLuaVersionsSohu = @"sohu";
NSString *const kPictureModelLuaVersionsYouku = @"youku";
NSString *const kPictureModelLuaVersionsTudou = @"tudou";
NSString *const kPictureModelLuaVersionsFengxing = @"fengxing";
NSString *const kPictureModelLuaVersionsBilibili = @"bilibili";
NSString *const kPictureModelLuaVersionsWeibo = @"weibo";
NSString *const kPictureModelLuaVersionsMiaopai = @"miaopai";
NSString *const kPictureModelLuaVersionsIqiyi = @"iqiyi";
NSString *const kPictureModelLuaVersionsVlook = @"vlook";
NSString *const kPictureModelLuaVersionsQq = @"qq";
NSString *const kPictureModelLuaVersions56 = @"56";
NSString *const kPictureModelLuaVersionsAcfun = @"acfun";


@interface PictureModelLuaVersions ()

- (id)objectOrNilForKey:(id)aKey fromDictionary:(NSDictionary *)dict;

@end

@implementation PictureModelLuaVersions

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
            self.sina = [[self objectOrNilForKey:kPictureModelLuaVersionsSina fromDictionary:dict] doubleValue];
            self.sohu = [[self objectOrNilForKey:kPictureModelLuaVersionsSohu fromDictionary:dict] doubleValue];
            self.youku = [[self objectOrNilForKey:kPictureModelLuaVersionsYouku fromDictionary:dict] doubleValue];
            self.tudou = [[self objectOrNilForKey:kPictureModelLuaVersionsTudou fromDictionary:dict] doubleValue];
            self.fengxing = [[self objectOrNilForKey:kPictureModelLuaVersionsFengxing fromDictionary:dict] doubleValue];
            self.bilibili = [[self objectOrNilForKey:kPictureModelLuaVersionsBilibili fromDictionary:dict] doubleValue];
            self.weibo = [[self objectOrNilForKey:kPictureModelLuaVersionsWeibo fromDictionary:dict] doubleValue];
            self.miaopai = [[self objectOrNilForKey:kPictureModelLuaVersionsMiaopai fromDictionary:dict] doubleValue];
            self.iqiyi = [[self objectOrNilForKey:kPictureModelLuaVersionsIqiyi fromDictionary:dict] doubleValue];
            self.vlook = [[self objectOrNilForKey:kPictureModelLuaVersionsVlook fromDictionary:dict] doubleValue];
            self.qq = [[self objectOrNilForKey:kPictureModelLuaVersionsQq fromDictionary:dict] doubleValue];
            self.acfun = [[self objectOrNilForKey:kPictureModelLuaVersionsAcfun fromDictionary:dict] doubleValue];

    }
    
    return self;
    
}

- (NSDictionary *)dictionaryRepresentation
{
    NSMutableDictionary *mutableDict = [NSMutableDictionary dictionary];
    [mutableDict setValue:[NSNumber numberWithDouble:self.sina] forKey:kPictureModelLuaVersionsSina];
    [mutableDict setValue:[NSNumber numberWithDouble:self.sohu] forKey:kPictureModelLuaVersionsSohu];
    [mutableDict setValue:[NSNumber numberWithDouble:self.youku] forKey:kPictureModelLuaVersionsYouku];
    [mutableDict setValue:[NSNumber numberWithDouble:self.tudou] forKey:kPictureModelLuaVersionsTudou];
    [mutableDict setValue:[NSNumber numberWithDouble:self.fengxing] forKey:kPictureModelLuaVersionsFengxing];
    [mutableDict setValue:[NSNumber numberWithDouble:self.bilibili] forKey:kPictureModelLuaVersionsBilibili];
    [mutableDict setValue:[NSNumber numberWithDouble:self.weibo] forKey:kPictureModelLuaVersionsWeibo];
    [mutableDict setValue:[NSNumber numberWithDouble:self.miaopai] forKey:kPictureModelLuaVersionsMiaopai];
    [mutableDict setValue:[NSNumber numberWithDouble:self.iqiyi] forKey:kPictureModelLuaVersionsIqiyi];
    [mutableDict setValue:[NSNumber numberWithDouble:self.vlook] forKey:kPictureModelLuaVersionsVlook];
    [mutableDict setValue:[NSNumber numberWithDouble:self.qq] forKey:kPictureModelLuaVersionsQq];
    [mutableDict setValue:[NSNumber numberWithDouble:self.acfun] forKey:kPictureModelLuaVersionsAcfun];

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

    self.sina = [aDecoder decodeDoubleForKey:kPictureModelLuaVersionsSina];
    self.sohu = [aDecoder decodeDoubleForKey:kPictureModelLuaVersionsSohu];
    self.youku = [aDecoder decodeDoubleForKey:kPictureModelLuaVersionsYouku];
    self.tudou = [aDecoder decodeDoubleForKey:kPictureModelLuaVersionsTudou];
    self.fengxing = [aDecoder decodeDoubleForKey:kPictureModelLuaVersionsFengxing];
    self.bilibili = [aDecoder decodeDoubleForKey:kPictureModelLuaVersionsBilibili];
    self.weibo = [aDecoder decodeDoubleForKey:kPictureModelLuaVersionsWeibo];
    self.miaopai = [aDecoder decodeDoubleForKey:kPictureModelLuaVersionsMiaopai];
    self.iqiyi = [aDecoder decodeDoubleForKey:kPictureModelLuaVersionsIqiyi];
    self.vlook = [aDecoder decodeDoubleForKey:kPictureModelLuaVersionsVlook];
    self.qq = [aDecoder decodeDoubleForKey:kPictureModelLuaVersionsQq];
    self.acfun = [aDecoder decodeDoubleForKey:kPictureModelLuaVersionsAcfun];
    return self;
}

- (void)encodeWithCoder:(NSCoder *)aCoder
{

    [aCoder encodeDouble:_sina forKey:kPictureModelLuaVersionsSina];
    [aCoder encodeDouble:_sohu forKey:kPictureModelLuaVersionsSohu];
    [aCoder encodeDouble:_youku forKey:kPictureModelLuaVersionsYouku];
    [aCoder encodeDouble:_tudou forKey:kPictureModelLuaVersionsTudou];
    [aCoder encodeDouble:_fengxing forKey:kPictureModelLuaVersionsFengxing];
    [aCoder encodeDouble:_bilibili forKey:kPictureModelLuaVersionsBilibili];
    [aCoder encodeDouble:_weibo forKey:kPictureModelLuaVersionsWeibo];
    [aCoder encodeDouble:_miaopai forKey:kPictureModelLuaVersionsMiaopai];
    [aCoder encodeDouble:_iqiyi forKey:kPictureModelLuaVersionsIqiyi];
    [aCoder encodeDouble:_vlook forKey:kPictureModelLuaVersionsVlook];
    [aCoder encodeDouble:_qq forKey:kPictureModelLuaVersionsQq];
    [aCoder encodeDouble:_acfun forKey:kPictureModelLuaVersionsAcfun];
}

- (id)copyWithZone:(NSZone *)zone
{
    PictureModelLuaVersions *copy = [[PictureModelLuaVersions alloc] init];
    
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
