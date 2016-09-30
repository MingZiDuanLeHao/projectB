//
//  BaseClass.m
//
//  Created by   on 2016/9/30
//  Copyright (c) 2016 __MyCompanyName__. All rights reserved.
//

#import "detailBaseClass.h"
#import "C20N3VJE000146BE.h"


NSString *const kBaseClassC20N3VJE000146BE = @"C20N3VJE000146BE";


@interface detailBaseClass ()

- (id)objectOrNilForKey:(id)aKey fromDictionary:(NSDictionary *)dict;

@end

@implementation detailBaseClass

@synthesize c20N3VJE000146BE = _c20N3VJE000146BE;


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
            self.c20N3VJE000146BE = [C20N3VJE000146BE modelObjectWithDictionary:[dict objectForKey:kBaseClassC20N3VJE000146BE]];

    }
    
    return self;
    
}

- (NSDictionary *)dictionaryRepresentation
{
    NSMutableDictionary *mutableDict = [NSMutableDictionary dictionary];
    [mutableDict setValue:[self.c20N3VJE000146BE dictionaryRepresentation] forKey:kBaseClassC20N3VJE000146BE];

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

    self.c20N3VJE000146BE = [aDecoder decodeObjectForKey:kBaseClassC20N3VJE000146BE];
    return self;
}

- (void)encodeWithCoder:(NSCoder *)aCoder
{

    [aCoder encodeObject:_c20N3VJE000146BE forKey:kBaseClassC20N3VJE000146BE];
}

- (id)copyWithZone:(NSZone *)zone
{
    detailBaseClass *copy = [[detailBaseClass alloc] init];
    
    if (copy) {

        copy.c20N3VJE000146BE = [self.c20N3VJE000146BE copyWithZone:zone];
    }
    
    return copy;
}


@end
