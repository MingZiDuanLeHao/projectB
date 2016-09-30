//
//  Huati.m
//
//  Created by   on 2016/9/30
//  Copyright (c) 2016 __MyCompanyName__. All rights reserved.
//

#import "Huati.h"


NSString *const kHuatiTopicId = @"topicId";
NSString *const kHuatiTopicName = @"topicName";


@interface Huati ()

- (id)objectOrNilForKey:(id)aKey fromDictionary:(NSDictionary *)dict;

@end

@implementation Huati

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
            self.topicId = [self objectOrNilForKey:kHuatiTopicId fromDictionary:dict];
            self.topicName = [self objectOrNilForKey:kHuatiTopicName fromDictionary:dict];

    }
    
    return self;
    
}

- (NSDictionary *)dictionaryRepresentation
{
    NSMutableDictionary *mutableDict = [NSMutableDictionary dictionary];
    [mutableDict setValue:self.topicId forKey:kHuatiTopicId];
    [mutableDict setValue:self.topicName forKey:kHuatiTopicName];

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

    self.topicId = [aDecoder decodeObjectForKey:kHuatiTopicId];
    self.topicName = [aDecoder decodeObjectForKey:kHuatiTopicName];
    return self;
}

- (void)encodeWithCoder:(NSCoder *)aCoder
{

    [aCoder encodeObject:_topicId forKey:kHuatiTopicId];
    [aCoder encodeObject:_topicName forKey:kHuatiTopicName];
}

- (id)copyWithZone:(NSZone *)zone
{
    Huati *copy = [[Huati alloc] init];
    
    if (copy) {

        copy.topicId = [self.topicId copyWithZone:zone];
        copy.topicName = [self.topicName copyWithZone:zone];
    }
    
    return copy;
}


@end
