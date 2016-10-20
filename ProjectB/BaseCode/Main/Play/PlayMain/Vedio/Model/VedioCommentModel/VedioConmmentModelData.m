//
//  VedioConmmentModelData.m
//
//  Created by   on 2016/10/14
//  Copyright (c) 2016 __MyCompanyName__. All rights reserved.
//

#import "VedioConmmentModelData.h"
#import "VedioConmmentModelTopComments.h"
#import "VedioConmmentModelRecentComments.h"


NSString *const kVedioConmmentModelDataTopComments = @"top_comments";
NSString *const kVedioConmmentModelDataRecentComments = @"recent_comments";


@interface VedioConmmentModelData ()

- (id)objectOrNilForKey:(id)aKey fromDictionary:(NSDictionary *)dict;

@end

@implementation VedioConmmentModelData

@synthesize topComments = _topComments;
@synthesize recentComments = _recentComments;


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
    NSObject *receivedVedioConmmentModelTopComments = [dict objectForKey:kVedioConmmentModelDataTopComments];
    NSMutableArray *parsedVedioConmmentModelTopComments = [NSMutableArray array];
    if ([receivedVedioConmmentModelTopComments isKindOfClass:[NSArray class]]) {
        for (NSDictionary *item in (NSArray *)receivedVedioConmmentModelTopComments) {
            if ([item isKindOfClass:[NSDictionary class]]) {
                [parsedVedioConmmentModelTopComments addObject:[VedioConmmentModelTopComments modelObjectWithDictionary:item]];
            }
       }
    } else if ([receivedVedioConmmentModelTopComments isKindOfClass:[NSDictionary class]]) {
       [parsedVedioConmmentModelTopComments addObject:[VedioConmmentModelTopComments modelObjectWithDictionary:(NSDictionary *)receivedVedioConmmentModelTopComments]];
    }

    self.topComments = [NSArray arrayWithArray:parsedVedioConmmentModelTopComments];
    NSObject *receivedVedioConmmentModelRecentComments = [dict objectForKey:kVedioConmmentModelDataRecentComments];
    NSMutableArray *parsedVedioConmmentModelRecentComments = [NSMutableArray array];
    if ([receivedVedioConmmentModelRecentComments isKindOfClass:[NSArray class]]) {
        for (NSDictionary *item in (NSArray *)receivedVedioConmmentModelRecentComments) {
            if ([item isKindOfClass:[NSDictionary class]]) {
                [parsedVedioConmmentModelRecentComments addObject:[VedioConmmentModelRecentComments modelObjectWithDictionary:item]];
            }
       }
    } else if ([receivedVedioConmmentModelRecentComments isKindOfClass:[NSDictionary class]]) {
       [parsedVedioConmmentModelRecentComments addObject:[VedioConmmentModelRecentComments modelObjectWithDictionary:(NSDictionary *)receivedVedioConmmentModelRecentComments]];
    }

    self.recentComments = [NSArray arrayWithArray:parsedVedioConmmentModelRecentComments];

    }
    
    return self;
    
}

- (NSDictionary *)dictionaryRepresentation
{
    NSMutableDictionary *mutableDict = [NSMutableDictionary dictionary];
    NSMutableArray *tempArrayForTopComments = [NSMutableArray array];
    for (NSObject *subArrayObject in self.topComments) {
        if([subArrayObject respondsToSelector:@selector(dictionaryRepresentation)]) {
            // This class is a model object
            [tempArrayForTopComments addObject:[subArrayObject performSelector:@selector(dictionaryRepresentation)]];
        } else {
            // Generic object
            [tempArrayForTopComments addObject:subArrayObject];
        }
    }
    [mutableDict setValue:[NSArray arrayWithArray:tempArrayForTopComments] forKey:kVedioConmmentModelDataTopComments];
    NSMutableArray *tempArrayForRecentComments = [NSMutableArray array];
    for (NSObject *subArrayObject in self.recentComments) {
        if([subArrayObject respondsToSelector:@selector(dictionaryRepresentation)]) {
            // This class is a model object
            [tempArrayForRecentComments addObject:[subArrayObject performSelector:@selector(dictionaryRepresentation)]];
        } else {
            // Generic object
            [tempArrayForRecentComments addObject:subArrayObject];
        }
    }
    [mutableDict setValue:[NSArray arrayWithArray:tempArrayForRecentComments] forKey:kVedioConmmentModelDataRecentComments];

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

    self.topComments = [aDecoder decodeObjectForKey:kVedioConmmentModelDataTopComments];
    self.recentComments = [aDecoder decodeObjectForKey:kVedioConmmentModelDataRecentComments];
    return self;
}

- (void)encodeWithCoder:(NSCoder *)aCoder
{

    [aCoder encodeObject:_topComments forKey:kVedioConmmentModelDataTopComments];
    [aCoder encodeObject:_recentComments forKey:kVedioConmmentModelDataRecentComments];
}

- (id)copyWithZone:(NSZone *)zone
{
    VedioConmmentModelData *copy = [[VedioConmmentModelData alloc] init];
    
    if (copy) {

        copy.topComments = [self.topComments copyWithZone:zone];
        copy.recentComments = [self.recentComments copyWithZone:zone];
    }
    
    return copy;
}


@end
