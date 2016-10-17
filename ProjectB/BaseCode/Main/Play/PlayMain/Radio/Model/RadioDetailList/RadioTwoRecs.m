//
//  RadioTwoRecs.m
//
//  Created by   on 2016/10/10
//  Copyright (c) 2016 __MyCompanyName__. All rights reserved.
//

#import "RadioTwoRecs.h"
#import "RadioTwoList.h"


NSString *const kRadioTwoRecsMaxPageId = @"maxPageId";
NSString *const kRadioTwoRecsList = @"list";
NSString *const kRadioTwoRecsPageId = @"pageId";
NSString *const kRadioTwoRecsPageSize = @"pageSize";
NSString *const kRadioTwoRecsTotalCount = @"totalCount";


@interface RadioTwoRecs ()

- (id)objectOrNilForKey:(id)aKey fromDictionary:(NSDictionary *)dict;

@end

@implementation RadioTwoRecs

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
            self.maxPageId = [[self objectOrNilForKey:kRadioTwoRecsMaxPageId fromDictionary:dict] doubleValue];
    NSObject *receivedRadioTwoList = [dict objectForKey:kRadioTwoRecsList];
    NSMutableArray *parsedRadioTwoList = [NSMutableArray array];
    if ([receivedRadioTwoList isKindOfClass:[NSArray class]]) {
        for (NSDictionary *item in (NSArray *)receivedRadioTwoList) {
            if ([item isKindOfClass:[NSDictionary class]]) {
                [parsedRadioTwoList addObject:[RadioTwoList modelObjectWithDictionary:item]];
            }
       }
    } else if ([receivedRadioTwoList isKindOfClass:[NSDictionary class]]) {
       [parsedRadioTwoList addObject:[RadioTwoList modelObjectWithDictionary:(NSDictionary *)receivedRadioTwoList]];
    }

    self.list = [NSArray arrayWithArray:parsedRadioTwoList];
            self.pageId = [[self objectOrNilForKey:kRadioTwoRecsPageId fromDictionary:dict] doubleValue];
            self.pageSize = [[self objectOrNilForKey:kRadioTwoRecsPageSize fromDictionary:dict] doubleValue];
            self.totalCount = [[self objectOrNilForKey:kRadioTwoRecsTotalCount fromDictionary:dict] doubleValue];

    }
    
    return self;
    
}

- (NSDictionary *)dictionaryRepresentation
{
    NSMutableDictionary *mutableDict = [NSMutableDictionary dictionary];
    [mutableDict setValue:[NSNumber numberWithDouble:self.maxPageId] forKey:kRadioTwoRecsMaxPageId];
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
    [mutableDict setValue:[NSArray arrayWithArray:tempArrayForList] forKey:kRadioTwoRecsList];
    [mutableDict setValue:[NSNumber numberWithDouble:self.pageId] forKey:kRadioTwoRecsPageId];
    [mutableDict setValue:[NSNumber numberWithDouble:self.pageSize] forKey:kRadioTwoRecsPageSize];
    [mutableDict setValue:[NSNumber numberWithDouble:self.totalCount] forKey:kRadioTwoRecsTotalCount];

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

    self.maxPageId = [aDecoder decodeDoubleForKey:kRadioTwoRecsMaxPageId];
    self.list = [aDecoder decodeObjectForKey:kRadioTwoRecsList];
    self.pageId = [aDecoder decodeDoubleForKey:kRadioTwoRecsPageId];
    self.pageSize = [aDecoder decodeDoubleForKey:kRadioTwoRecsPageSize];
    self.totalCount = [aDecoder decodeDoubleForKey:kRadioTwoRecsTotalCount];
    return self;
}

- (void)encodeWithCoder:(NSCoder *)aCoder
{

    [aCoder encodeDouble:_maxPageId forKey:kRadioTwoRecsMaxPageId];
    [aCoder encodeObject:_list forKey:kRadioTwoRecsList];
    [aCoder encodeDouble:_pageId forKey:kRadioTwoRecsPageId];
    [aCoder encodeDouble:_pageSize forKey:kRadioTwoRecsPageSize];
    [aCoder encodeDouble:_totalCount forKey:kRadioTwoRecsTotalCount];
}

- (id)copyWithZone:(NSZone *)zone
{
    RadioTwoRecs *copy = [[RadioTwoRecs alloc] init];
    
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
