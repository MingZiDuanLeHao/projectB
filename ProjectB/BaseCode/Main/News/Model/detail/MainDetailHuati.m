//
//  MainDetailHuati.m
//
//  Created by   on 2016/9/30
//  Copyright (c) 2016 __MyCompanyName__. All rights reserved.
//

#import "MainDetailHuati.h"


NSString *const kMainDetailHuatiTopicId = @"topicId";
NSString *const kMainDetailHuatiTopicName = @"topicName";


@interface MainDetailHuati ()

- (id)objectOrNilForKey:(id)aKey fromDictionary:(NSDictionary *)dict;

@end

@implementation MainDetailHuati

@synthesize topicId = _topicId;
@synthesize topicName = _topicName;


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
            self.topicId = [self objectOrNilForKey:kMainDetailHuatiTopicId fromDictionary:dict];
            self.topicName = [self objectOrNilForKey:kMainDetailHuatiTopicName fromDictionary:dict];

    }
    
    return self;
    
}

- (NSDictionary *)dictionaryRepresentation
{
    NSMutableDictionary *mutableDict = [NSMutableDictionary dictionary];
    [mutableDict setValue:self.topicId forKey:kMainDetailHuatiTopicId];
    [mutableDict setValue:self.topicName forKey:kMainDetailHuatiTopicName];

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

    self.topicId = [aDecoder decodeObjectForKey:kMainDetailHuatiTopicId];
    self.topicName = [aDecoder decodeObjectForKey:kMainDetailHuatiTopicName];
    return self;
}

- (void)encodeWithCoder:(NSCoder *)aCoder
{

    [aCoder encodeObject:_topicId forKey:kMainDetailHuatiTopicId];
    [aCoder encodeObject:_topicName forKey:kMainDetailHuatiTopicName];
}

- (id)copyWithZone:(NSZone *)zone
{
    MainDetailHuati *copy = [[MainDetailHuati alloc] init];
    
    if (copy) {

        copy.topicId = [self.topicId copyWithZone:zone];
        copy.topicName = [self.topicName copyWithZone:zone];
    }
    
    return copy;
}


@end
