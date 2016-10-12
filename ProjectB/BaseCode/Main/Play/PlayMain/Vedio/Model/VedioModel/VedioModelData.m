//
//  VedioModelData.m
//
//  Created by   on 2016/10/12
//  Copyright (c) 2016 __MyCompanyName__. All rights reserved.
//

#import "VedioModelData.h"


NSString *const kVedioModelDataHasMore = @"has_more";
NSString *const kVedioModelDataData = @"data";
NSString *const kVedioModelDataMinTime = @"min_time";
NSString *const kVedioModelDataMaxTime = @"max_time";
NSString *const kVedioModelDataTip = @"tip";


@interface VedioModelData ()

- (id)objectOrNilForKey:(id)aKey fromDictionary:(NSDictionary *)dict;

@end

@implementation VedioModelData

@synthesize hasMore = _hasMore;
@synthesize data = _data;
@synthesize minTime = _minTime;
@synthesize maxTime = _maxTime;
@synthesize tip = _tip;


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
            self.hasMore = [[self objectOrNilForKey:kVedioModelDataHasMore fromDictionary:dict] boolValue];
            self.data = [self objectOrNilForKey:kVedioModelDataData fromDictionary:dict];
            self.minTime = [[self objectOrNilForKey:kVedioModelDataMinTime fromDictionary:dict] doubleValue];
            self.maxTime = [[self objectOrNilForKey:kVedioModelDataMaxTime fromDictionary:dict] doubleValue];
            self.tip = [self objectOrNilForKey:kVedioModelDataTip fromDictionary:dict];

    }
    
    return self;
    
}

- (NSDictionary *)dictionaryRepresentation
{
    NSMutableDictionary *mutableDict = [NSMutableDictionary dictionary];
    [mutableDict setValue:[NSNumber numberWithBool:self.hasMore] forKey:kVedioModelDataHasMore];
    NSMutableArray *tempArrayForData = [NSMutableArray array];
    for (NSObject *subArrayObject in self.data) {
        if([subArrayObject respondsToSelector:@selector(dictionaryRepresentation)]) {
            // This class is a model object
            [tempArrayForData addObject:[subArrayObject performSelector:@selector(dictionaryRepresentation)]];
        } else {
            // Generic object
            [tempArrayForData addObject:subArrayObject];
        }
    }
    [mutableDict setValue:[NSArray arrayWithArray:tempArrayForData] forKey:kVedioModelDataData];
    [mutableDict setValue:[NSNumber numberWithDouble:self.minTime] forKey:kVedioModelDataMinTime];
    [mutableDict setValue:[NSNumber numberWithDouble:self.maxTime] forKey:kVedioModelDataMaxTime];
    [mutableDict setValue:self.tip forKey:kVedioModelDataTip];

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

    self.hasMore = [aDecoder decodeBoolForKey:kVedioModelDataHasMore];
    self.data = [aDecoder decodeObjectForKey:kVedioModelDataData];
    self.minTime = [aDecoder decodeDoubleForKey:kVedioModelDataMinTime];
    self.maxTime = [aDecoder decodeDoubleForKey:kVedioModelDataMaxTime];
    self.tip = [aDecoder decodeObjectForKey:kVedioModelDataTip];
    return self;
}

- (void)encodeWithCoder:(NSCoder *)aCoder
{

    [aCoder encodeBool:_hasMore forKey:kVedioModelDataHasMore];
    [aCoder encodeObject:_data forKey:kVedioModelDataData];
    [aCoder encodeDouble:_minTime forKey:kVedioModelDataMinTime];
    [aCoder encodeDouble:_maxTime forKey:kVedioModelDataMaxTime];
    [aCoder encodeObject:_tip forKey:kVedioModelDataTip];
}

- (id)copyWithZone:(NSZone *)zone
{
    VedioModelData *copy = [[VedioModelData alloc] init];
    
    if (copy) {

        copy.hasMore = self.hasMore;
        copy.data = [self.data copyWithZone:zone];
        copy.minTime = self.minTime;
        copy.maxTime = self.maxTime;
        copy.tip = [self.tip copyWithZone:zone];
    }
    
    return copy;
}


@end
