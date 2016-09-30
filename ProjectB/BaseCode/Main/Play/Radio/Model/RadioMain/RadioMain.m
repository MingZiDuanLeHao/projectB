//
//  RadioMain.m
//
//  Created by   on 2016/9/29
//  Copyright (c) 2016 __MyCompanyName__. All rights reserved.
//

#import "RadioMain.h"
#import "List.h"


NSString *const kRadioMainPageSize = @"pageSize";
NSString *const kRadioMainPageId = @"pageId";
NSString *const kRadioMainTotalCount = @"totalCount";
NSString *const kRadioMainTitle = @"title";
NSString *const kRadioMainMsg = @"msg";
NSString *const kRadioMainMaxPageId = @"maxPageId";
NSString *const kRadioMainList = @"list";
NSString *const kRadioMainRet = @"ret";


@interface RadioMain ()

- (id)objectOrNilForKey:(id)aKey fromDictionary:(NSDictionary *)dict;

@end

@implementation RadioMain

@synthesize pageSize = _pageSize;
@synthesize pageId = _pageId;
@synthesize totalCount = _totalCount;
@synthesize title = _title;
@synthesize msg = _msg;
@synthesize maxPageId = _maxPageId;
@synthesize list = _list;
@synthesize ret = _ret;


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
            self.pageSize = [[self objectOrNilForKey:kRadioMainPageSize fromDictionary:dict] doubleValue];
            self.pageId = [[self objectOrNilForKey:kRadioMainPageId fromDictionary:dict] doubleValue];
            self.totalCount = [[self objectOrNilForKey:kRadioMainTotalCount fromDictionary:dict] doubleValue];
            self.title = [self objectOrNilForKey:kRadioMainTitle fromDictionary:dict];
            self.msg = [self objectOrNilForKey:kRadioMainMsg fromDictionary:dict];
            self.maxPageId = [[self objectOrNilForKey:kRadioMainMaxPageId fromDictionary:dict] doubleValue];
    NSObject *receivedList = [dict objectForKey:kRadioMainList];
    NSMutableArray *parsedList = [NSMutableArray array];
    if ([receivedList isKindOfClass:[NSArray class]]) {
        for (NSDictionary *item in (NSArray *)receivedList) {
            if ([item isKindOfClass:[NSDictionary class]]) {
                [parsedList addObject:[List modelObjectWithDictionary:item]];
            }
       }
    } else if ([receivedList isKindOfClass:[NSDictionary class]]) {
       [parsedList addObject:[List modelObjectWithDictionary:(NSDictionary *)receivedList]];
    }

    self.list = [NSArray arrayWithArray:parsedList];
            self.ret = [[self objectOrNilForKey:kRadioMainRet fromDictionary:dict] doubleValue];

    }
    
    return self;
    
}

- (NSDictionary *)dictionaryRepresentation
{
    NSMutableDictionary *mutableDict = [NSMutableDictionary dictionary];
    [mutableDict setValue:[NSNumber numberWithDouble:self.pageSize] forKey:kRadioMainPageSize];
    [mutableDict setValue:[NSNumber numberWithDouble:self.pageId] forKey:kRadioMainPageId];
    [mutableDict setValue:[NSNumber numberWithDouble:self.totalCount] forKey:kRadioMainTotalCount];
    [mutableDict setValue:self.title forKey:kRadioMainTitle];
    [mutableDict setValue:self.msg forKey:kRadioMainMsg];
    [mutableDict setValue:[NSNumber numberWithDouble:self.maxPageId] forKey:kRadioMainMaxPageId];
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
    [mutableDict setValue:[NSArray arrayWithArray:tempArrayForList] forKey:kRadioMainList];
    [mutableDict setValue:[NSNumber numberWithDouble:self.ret] forKey:kRadioMainRet];

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

    self.pageSize = [aDecoder decodeDoubleForKey:kRadioMainPageSize];
    self.pageId = [aDecoder decodeDoubleForKey:kRadioMainPageId];
    self.totalCount = [aDecoder decodeDoubleForKey:kRadioMainTotalCount];
    self.title = [aDecoder decodeObjectForKey:kRadioMainTitle];
    self.msg = [aDecoder decodeObjectForKey:kRadioMainMsg];
    self.maxPageId = [aDecoder decodeDoubleForKey:kRadioMainMaxPageId];
    self.list = [aDecoder decodeObjectForKey:kRadioMainList];
    self.ret = [aDecoder decodeDoubleForKey:kRadioMainRet];
    return self;
}

- (void)encodeWithCoder:(NSCoder *)aCoder
{

    [aCoder encodeDouble:_pageSize forKey:kRadioMainPageSize];
    [aCoder encodeDouble:_pageId forKey:kRadioMainPageId];
    [aCoder encodeDouble:_totalCount forKey:kRadioMainTotalCount];
    [aCoder encodeObject:_title forKey:kRadioMainTitle];
    [aCoder encodeObject:_msg forKey:kRadioMainMsg];
    [aCoder encodeDouble:_maxPageId forKey:kRadioMainMaxPageId];
    [aCoder encodeObject:_list forKey:kRadioMainList];
    [aCoder encodeDouble:_ret forKey:kRadioMainRet];
}

- (id)copyWithZone:(NSZone *)zone
{
    RadioMain *copy = [[RadioMain alloc] init];
    
    if (copy) {

        copy.pageSize = self.pageSize;
        copy.pageId = self.pageId;
        copy.totalCount = self.totalCount;
        copy.title = [self.title copyWithZone:zone];
        copy.msg = [self.msg copyWithZone:zone];
        copy.maxPageId = self.maxPageId;
        copy.list = [self.list copyWithZone:zone];
        copy.ret = self.ret;
    }
    
    return copy;
}


@end
