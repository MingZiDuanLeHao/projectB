//
//  MainDetailTopiclistNews.m
//
//  Created by   on 2016/9/30
//  Copyright (c) 2016 __MyCompanyName__. All rights reserved.
//

#import "MainDetailTopiclistNews.h"


NSString *const kMainDetailTopiclistNewsTname = @"tname";
NSString *const kMainDetailTopiclistNewsAlias = @"alias";
NSString *const kMainDetailTopiclistNewsHasCover = @"hasCover";
NSString *const kMainDetailTopiclistNewsSubnum = @"subnum";
NSString *const kMainDetailTopiclistNewsEname = @"ename";
NSString *const kMainDetailTopiclistNewsTid = @"tid";
NSString *const kMainDetailTopiclistNewsCid = @"cid";


@interface MainDetailTopiclistNews ()

- (id)objectOrNilForKey:(id)aKey fromDictionary:(NSDictionary *)dict;

@end

@implementation MainDetailTopiclistNews

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
            self.tname = [self objectOrNilForKey:kMainDetailTopiclistNewsTname fromDictionary:dict];
            self.alias = [self objectOrNilForKey:kMainDetailTopiclistNewsAlias fromDictionary:dict];
            self.hasCover = [[self objectOrNilForKey:kMainDetailTopiclistNewsHasCover fromDictionary:dict] boolValue];
            self.subnum = [self objectOrNilForKey:kMainDetailTopiclistNewsSubnum fromDictionary:dict];
            self.ename = [self objectOrNilForKey:kMainDetailTopiclistNewsEname fromDictionary:dict];
            self.tid = [self objectOrNilForKey:kMainDetailTopiclistNewsTid fromDictionary:dict];
            self.cid = [self objectOrNilForKey:kMainDetailTopiclistNewsCid fromDictionary:dict];

    }
    
    return self;
    
}

- (NSDictionary *)dictionaryRepresentation
{
    NSMutableDictionary *mutableDict = [NSMutableDictionary dictionary];
    [mutableDict setValue:self.tname forKey:kMainDetailTopiclistNewsTname];
    [mutableDict setValue:self.alias forKey:kMainDetailTopiclistNewsAlias];
    [mutableDict setValue:[NSNumber numberWithBool:self.hasCover] forKey:kMainDetailTopiclistNewsHasCover];
    [mutableDict setValue:self.subnum forKey:kMainDetailTopiclistNewsSubnum];
    [mutableDict setValue:self.ename forKey:kMainDetailTopiclistNewsEname];
    [mutableDict setValue:self.tid forKey:kMainDetailTopiclistNewsTid];
    [mutableDict setValue:self.cid forKey:kMainDetailTopiclistNewsCid];

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

    self.tname = [aDecoder decodeObjectForKey:kMainDetailTopiclistNewsTname];
    self.alias = [aDecoder decodeObjectForKey:kMainDetailTopiclistNewsAlias];
    self.hasCover = [aDecoder decodeBoolForKey:kMainDetailTopiclistNewsHasCover];
    self.subnum = [aDecoder decodeObjectForKey:kMainDetailTopiclistNewsSubnum];
    self.ename = [aDecoder decodeObjectForKey:kMainDetailTopiclistNewsEname];
    self.tid = [aDecoder decodeObjectForKey:kMainDetailTopiclistNewsTid];
    self.cid = [aDecoder decodeObjectForKey:kMainDetailTopiclistNewsCid];
    return self;
}

- (void)encodeWithCoder:(NSCoder *)aCoder
{

    [aCoder encodeObject:_tname forKey:kMainDetailTopiclistNewsTname];
    [aCoder encodeObject:_alias forKey:kMainDetailTopiclistNewsAlias];
    [aCoder encodeBool:_hasCover forKey:kMainDetailTopiclistNewsHasCover];
    [aCoder encodeObject:_subnum forKey:kMainDetailTopiclistNewsSubnum];
    [aCoder encodeObject:_ename forKey:kMainDetailTopiclistNewsEname];
    [aCoder encodeObject:_tid forKey:kMainDetailTopiclistNewsTid];
    [aCoder encodeObject:_cid forKey:kMainDetailTopiclistNewsCid];
}

- (id)copyWithZone:(NSZone *)zone
{
    MainDetailTopiclistNews *copy = [[MainDetailTopiclistNews alloc] init];
    
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
