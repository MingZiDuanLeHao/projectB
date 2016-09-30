//
//  RadioDetailListTracks.m
//
//  Created by   on 2016/9/30
//  Copyright (c) 2016 __MyCompanyName__. All rights reserved.
//

#import "RadioDetailListTracks.h"
#import "RadioDetailListList.h"


NSString *const kRadioDetailListTracksMaxPageId = @"maxPageId";
NSString *const kRadioDetailListTracksList = @"list";
NSString *const kRadioDetailListTracksPageId = @"pageId";
NSString *const kRadioDetailListTracksPageSize = @"pageSize";
NSString *const kRadioDetailListTracksTotalCount = @"totalCount";


@interface RadioDetailListTracks ()

- (id)objectOrNilForKey:(id)aKey fromDictionary:(NSDictionary *)dict;

@end

@implementation RadioDetailListTracks

@synthesize maxPageId = _maxPageId;
@synthesize list = _list;
@synthesize pageId = _pageId;
@synthesize pageSize = _pageSize;
@synthesize totalCount = _totalCount;


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
            self.maxPageId = [[self objectOrNilForKey:kRadioDetailListTracksMaxPageId fromDictionary:dict] doubleValue];
    NSObject *receivedRadioDetailListList = [dict objectForKey:kRadioDetailListTracksList];
    NSMutableArray *parsedRadioDetailListList = [NSMutableArray array];
    if ([receivedRadioDetailListList isKindOfClass:[NSArray class]]) {
        for (NSDictionary *item in (NSArray *)receivedRadioDetailListList) {
            if ([item isKindOfClass:[NSDictionary class]]) {
                [parsedRadioDetailListList addObject:[RadioDetailListList modelObjectWithDictionary:item]];
            }
       }
    } else if ([receivedRadioDetailListList isKindOfClass:[NSDictionary class]]) {
       [parsedRadioDetailListList addObject:[RadioDetailListList modelObjectWithDictionary:(NSDictionary *)receivedRadioDetailListList]];
    }

    self.list = [NSArray arrayWithArray:parsedRadioDetailListList];
            self.pageId = [[self objectOrNilForKey:kRadioDetailListTracksPageId fromDictionary:dict] doubleValue];
            self.pageSize = [[self objectOrNilForKey:kRadioDetailListTracksPageSize fromDictionary:dict] doubleValue];
            self.totalCount = [[self objectOrNilForKey:kRadioDetailListTracksTotalCount fromDictionary:dict] doubleValue];

    }
    
    return self;
    
}

- (NSDictionary *)dictionaryRepresentation
{
    NSMutableDictionary *mutableDict = [NSMutableDictionary dictionary];
    [mutableDict setValue:[NSNumber numberWithDouble:self.maxPageId] forKey:kRadioDetailListTracksMaxPageId];
    NSMutableArray *tempArrayForList = [NSMutableArray array];
    for (NSObject *subArrayObject in self.list) {
        if([subArrayObject respondsToSelector:@selector(dictionaryRepresentation)]) {
            // This class is a model object
            [tempArrayForList addObject:[subArrayObject performSelector:@selector(dictionaryRepresentation)]];
        } else {
            // Generic object
            [tempArrayForList addObject:subArrayObject];
        }
    }
    [mutableDict setValue:[NSArray arrayWithArray:tempArrayForList] forKey:kRadioDetailListTracksList];
    [mutableDict setValue:[NSNumber numberWithDouble:self.pageId] forKey:kRadioDetailListTracksPageId];
    [mutableDict setValue:[NSNumber numberWithDouble:self.pageSize] forKey:kRadioDetailListTracksPageSize];
    [mutableDict setValue:[NSNumber numberWithDouble:self.totalCount] forKey:kRadioDetailListTracksTotalCount];

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

    self.maxPageId = [aDecoder decodeDoubleForKey:kRadioDetailListTracksMaxPageId];
    self.list = [aDecoder decodeObjectForKey:kRadioDetailListTracksList];
    self.pageId = [aDecoder decodeDoubleForKey:kRadioDetailListTracksPageId];
    self.pageSize = [aDecoder decodeDoubleForKey:kRadioDetailListTracksPageSize];
    self.totalCount = [aDecoder decodeDoubleForKey:kRadioDetailListTracksTotalCount];
    return self;
}

- (void)encodeWithCoder:(NSCoder *)aCoder
{

    [aCoder encodeDouble:_maxPageId forKey:kRadioDetailListTracksMaxPageId];
    [aCoder encodeObject:_list forKey:kRadioDetailListTracksList];
    [aCoder encodeDouble:_pageId forKey:kRadioDetailListTracksPageId];
    [aCoder encodeDouble:_pageSize forKey:kRadioDetailListTracksPageSize];
    [aCoder encodeDouble:_totalCount forKey:kRadioDetailListTracksTotalCount];
}

- (id)copyWithZone:(NSZone *)zone
{
    RadioDetailListTracks *copy = [[RadioDetailListTracks alloc] init];
    
    if (copy) {

        copy.maxPageId = self.maxPageId;
        copy.list = [self.list copyWithZone:zone];
        copy.pageId = self.pageId;
        copy.pageSize = self.pageSize;
        copy.totalCount = self.totalCount;
    }
    
    return copy;
}


@end
