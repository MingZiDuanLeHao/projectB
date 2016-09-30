//
//  BaseClass.m
//
//  Created by   on 2016/9/29
//  Copyright (c) 2016 __MyCompanyName__. All rights reserved.
//

#import "BaseClass.h"
#import "T1441074311424.h"


NSString *const kBaseClassT1441074311424 = @"T1441074311424";


@interface BaseClass ()

- (id)objectOrNilForKey:(id)aKey fromDictionary:(NSDictionary *)dict;

@end

@implementation BaseClass

@synthesize t1441074311424 = _t1441074311424;


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
    NSObject *receivedT1441074311424 = [dict objectForKey:kBaseClassT1441074311424];
    NSMutableArray *parsedT1441074311424 = [NSMutableArray array];
    if ([receivedT1441074311424 isKindOfClass:[NSArray class]]) {
        for (NSDictionary *item in (NSArray *)receivedT1441074311424) {
            if ([item isKindOfClass:[NSDictionary class]]) {
                [parsedT1441074311424 addObject:[T1441074311424 modelObjectWithDictionary:item]];
            }
       }
    } else if ([receivedT1441074311424 isKindOfClass:[NSDictionary class]]) {
       [parsedT1441074311424 addObject:[T1441074311424 modelObjectWithDictionary:(NSDictionary *)receivedT1441074311424]];
    }

    self.t1441074311424 = [NSArray arrayWithArray:parsedT1441074311424];

    }
    
    return self;
    
}

- (NSDictionary *)dictionaryRepresentation
{
    NSMutableDictionary *mutableDict = [NSMutableDictionary dictionary];
    NSMutableArray *tempArrayForT1441074311424 = [NSMutableArray array];
    for (NSObject *subArrayObject in self.t1441074311424) {
        if([subArrayObject respondsToSelector:@selector(dictionaryRepresentation)]) {
            // This class is a model object
            [tempArrayForT1441074311424 addObject:[subArrayObject performSelector:@selector(dictionaryRepresentation)]];
        } else {
            // Generic object
            [tempArrayForT1441074311424 addObject:subArrayObject];
        }
    }
    [mutableDict setValue:[NSArray arrayWithArray:tempArrayForT1441074311424] forKey:kBaseClassT1441074311424];

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

    self.t1441074311424 = [aDecoder decodeObjectForKey:kBaseClassT1441074311424];
    return self;
}

- (void)encodeWithCoder:(NSCoder *)aCoder
{

    [aCoder encodeObject:_t1441074311424 forKey:kBaseClassT1441074311424];
}

- (id)copyWithZone:(NSZone *)zone
{
    BaseClass *copy = [[BaseClass alloc] init];
    
    if (copy) {

        copy.t1441074311424 = [self.t1441074311424 copyWithZone:zone];
    }
    
    return copy;
}


@end
