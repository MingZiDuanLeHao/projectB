//
//  TopiclistNews.m
//
//  Created by   on 2016/9/30
//  Copyright (c) 2016 __MyCompanyName__. All rights reserved.
//

#import "TopiclistNews.h"


NSString *const kTopiclistNewsTname = @"tname";
NSString *const kTopiclistNewsAlias = @"alias";
NSString *const kTopiclistNewsHasCover = @"hasCover";
NSString *const kTopiclistNewsSubnum = @"subnum";
NSString *const kTopiclistNewsEname = @"ename";
NSString *const kTopiclistNewsTid = @"tid";
NSString *const kTopiclistNewsCid = @"cid";


@interface TopiclistNews ()

- (id)objectOrNilForKey:(id)aKey fromDictionary:(NSDictionary *)dict;

@end

@implementation TopiclistNews

@synthesize tname = _tname;
@synthesize alias = _alias;
@synthesize hasCover = _hasCover;
@synthesize subnum = _subnum;
@synthesize ename = _ename;
@synthesize tid = _tid;
@synthesize cid = _cid;


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
            self.tname = [self objectOrNilForKey:kTopiclistNewsTname fromDictionary:dict];
            self.alias = [self objectOrNilForKey:kTopiclistNewsAlias fromDictionary:dict];
            self.hasCover = [[self objectOrNilForKey:kTopiclistNewsHasCover fromDictionary:dict] boolValue];
            self.subnum = [self objectOrNilForKey:kTopiclistNewsSubnum fromDictionary:dict];
            self.ename = [self objectOrNilForKey:kTopiclistNewsEname fromDictionary:dict];
            self.tid = [self objectOrNilForKey:kTopiclistNewsTid fromDictionary:dict];
            self.cid = [self objectOrNilForKey:kTopiclistNewsCid fromDictionary:dict];

    }
    
    return self;
    
}

- (NSDictionary *)dictionaryRepresentation
{
    NSMutableDictionary *mutableDict = [NSMutableDictionary dictionary];
    [mutableDict setValue:self.tname forKey:kTopiclistNewsTname];
    [mutableDict setValue:self.alias forKey:kTopiclistNewsAlias];
    [mutableDict setValue:[NSNumber numberWithBool:self.hasCover] forKey:kTopiclistNewsHasCover];
    [mutableDict setValue:self.subnum forKey:kTopiclistNewsSubnum];
    [mutableDict setValue:self.ename forKey:kTopiclistNewsEname];
    [mutableDict setValue:self.tid forKey:kTopiclistNewsTid];
    [mutableDict setValue:self.cid forKey:kTopiclistNewsCid];

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

    self.tname = [aDecoder decodeObjectForKey:kTopiclistNewsTname];
    self.alias = [aDecoder decodeObjectForKey:kTopiclistNewsAlias];
    self.hasCover = [aDecoder decodeBoolForKey:kTopiclistNewsHasCover];
    self.subnum = [aDecoder decodeObjectForKey:kTopiclistNewsSubnum];
    self.ename = [aDecoder decodeObjectForKey:kTopiclistNewsEname];
    self.tid = [aDecoder decodeObjectForKey:kTopiclistNewsTid];
    self.cid = [aDecoder decodeObjectForKey:kTopiclistNewsCid];
    return self;
}

- (void)encodeWithCoder:(NSCoder *)aCoder
{

    [aCoder encodeObject:_tname forKey:kTopiclistNewsTname];
    [aCoder encodeObject:_alias forKey:kTopiclistNewsAlias];
    [aCoder encodeBool:_hasCover forKey:kTopiclistNewsHasCover];
    [aCoder encodeObject:_subnum forKey:kTopiclistNewsSubnum];
    [aCoder encodeObject:_ename forKey:kTopiclistNewsEname];
    [aCoder encodeObject:_tid forKey:kTopiclistNewsTid];
    [aCoder encodeObject:_cid forKey:kTopiclistNewsCid];
}

- (id)copyWithZone:(NSZone *)zone
{
    TopiclistNews *copy = [[TopiclistNews alloc] init];
    
    if (copy) {

        copy.tname = [self.tname copyWithZone:zone];
        copy.alias = [self.alias copyWithZone:zone];
        copy.hasCover = self.hasCover;
        copy.subnum = [self.subnum copyWithZone:zone];
        copy.ename = [self.ename copyWithZone:zone];
        copy.tid = [self.tid copyWithZone:zone];
        copy.cid = [self.cid copyWithZone:zone];
    }
    
    return copy;
}


@end
