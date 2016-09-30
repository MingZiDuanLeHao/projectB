//
//  MainDetailBaseClass.m
//
//  Created by   on 2016/9/30
//  Copyright (c) 2016 __MyCompanyName__. All rights reserved.
//

#import "MainDetailBaseClass.h"
#import "MainDetailC20N3VJE000146BE.h"


NSString *const kMainDetailBaseClassC20N3VJE000146BE = @"C20N3VJE000146BE";


@interface MainDetailBaseClass ()

- (id)objectOrNilForKey:(id)aKey fromDictionary:(NSDictionary *)dict;

@end

@implementation MainDetailBaseClass

@synthesize c20N3VJE000146BE = _c20N3VJE000146BE;


+ (instancetype)modelObjectWithDictionary:(NSDictionary *)dict key:(NSString *)key
{
    return [[self alloc] initWithDictionary:dict key:key];
}

- (instancetype)initWithDictionary:(NSDictionary *)dict key:(NSString *)key
{
    self = [super init];
    
    // This check serves to make sure that a non-NSDictionary object
    // passed into the model class doesn't break the parsing.
    if(self && [dict isKindOfClass:[NSDictionary class]]) {
            self.c20N3VJE000146BE = [MainDetailC20N3VJE000146BE modelObjectWithDictionary:[dict objectForKey:key]];

    }
    
    return self;
    
}

- (NSDictionary *)dictionaryRepresentation
{
    NSMutableDictionary *mutableDict = [NSMutableDictionary dictionary];
    [mutableDict setValue:[self.c20N3VJE000146BE dictionaryRepresentation] forKey:kMainDetailBaseClassC20N3VJE000146BE];

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

    self.c20N3VJE000146BE = [aDecoder decodeObjectForKey:kMainDetailBaseClassC20N3VJE000146BE];
    return self;
}

- (void)encodeWithCoder:(NSCoder *)aCoder
{

    [aCoder encodeObject:_c20N3VJE000146BE forKey:kMainDetailBaseClassC20N3VJE000146BE];
}

- (id)copyWithZone:(NSZone *)zone
{
    MainDetailBaseClass *copy = [[MainDetailBaseClass alloc] init];
    
    if (copy) {

        copy.c20N3VJE000146BE = [self.c20N3VJE000146BE copyWithZone:zone];
    }
    
    return copy;
}


@end
