//
//  VedioModelLogExtra.m
//
//  Created by   on 2016/10/12
//  Copyright (c) 2016 __MyCompanyName__. All rights reserved.
//

#import "VedioModelLogExtra.h"


NSString *const kVedioModelLogExtraAdPrice = @"ad_price";
NSString *const kVedioModelLogExtraRit = @"rit";
NSString *const kVedioModelLogExtraReqId = @"req_id";
NSString *const kVedioModelLogExtraConvertId = @"convert_id";


@interface VedioModelLogExtra ()

- (id)objectOrNilForKey:(id)aKey fromDictionary:(NSDictionary *)dict;

@end

@implementation VedioModelLogExtra

@synthesize adPrice = _adPrice;
@synthesize rit = _rit;
@synthesize reqId = _reqId;
@synthesize convertId = _convertId;


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
            self.adPrice = [self objectOrNilForKey:kVedioModelLogExtraAdPrice fromDictionary:dict];
            self.rit = [[self objectOrNilForKey:kVedioModelLogExtraRit fromDictionary:dict] doubleValue];
            self.reqId = [self objectOrNilForKey:kVedioModelLogExtraReqId fromDictionary:dict];
            self.convertId = [[self objectOrNilForKey:kVedioModelLogExtraConvertId fromDictionary:dict] doubleValue];

    }
    
    return self;
    
}

- (NSDictionary *)dictionaryRepresentation
{
    NSMutableDictionary *mutableDict = [NSMutableDictionary dictionary];
    [mutableDict setValue:self.adPrice forKey:kVedioModelLogExtraAdPrice];
    [mutableDict setValue:[NSNumber numberWithDouble:self.rit] forKey:kVedioModelLogExtraRit];
    [mutableDict setValue:self.reqId forKey:kVedioModelLogExtraReqId];
    [mutableDict setValue:[NSNumber numberWithDouble:self.convertId] forKey:kVedioModelLogExtraConvertId];

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

    self.adPrice = [aDecoder decodeObjectForKey:kVedioModelLogExtraAdPrice];
    self.rit = [aDecoder decodeDoubleForKey:kVedioModelLogExtraRit];
    self.reqId = [aDecoder decodeObjectForKey:kVedioModelLogExtraReqId];
    self.convertId = [aDecoder decodeDoubleForKey:kVedioModelLogExtraConvertId];
    return self;
}

- (void)encodeWithCoder:(NSCoder *)aCoder
{

    [aCoder encodeObject:_adPrice forKey:kVedioModelLogExtraAdPrice];
    [aCoder encodeDouble:_rit forKey:kVedioModelLogExtraRit];
    [aCoder encodeObject:_reqId forKey:kVedioModelLogExtraReqId];
    [aCoder encodeDouble:_convertId forKey:kVedioModelLogExtraConvertId];
}

- (id)copyWithZone:(NSZone *)zone
{
    VedioModelLogExtra *copy = [[VedioModelLogExtra alloc] init];
    
    if (copy) {

        copy.adPrice = [self.adPrice copyWithZone:zone];
        copy.rit = self.rit;
        copy.reqId = [self.reqId copyWithZone:zone];
        copy.convertId = self.convertId;
    }
    
    return copy;
}


@end
