//
//  MainDetailLink.m
//
//  Created by   on 2016/9/30
//  Copyright (c) 2016 __MyCompanyName__. All rights reserved.
//

#import "MainDetailLink.h"


NSString *const kMainDetailLinkRef = @"ref";
NSString *const kMainDetailLinkTitle = @"title";
NSString *const kMainDetailLinkHref = @"href";


@interface MainDetailLink ()

- (id)objectOrNilForKey:(id)aKey fromDictionary:(NSDictionary *)dict;

@end

@implementation MainDetailLink

@synthesize ref = _ref;
@synthesize title = _title;
@synthesize href = _href;


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
            self.ref = [self objectOrNilForKey:kMainDetailLinkRef fromDictionary:dict];
            self.title = [self objectOrNilForKey:kMainDetailLinkTitle fromDictionary:dict];
            self.href = [self objectOrNilForKey:kMainDetailLinkHref fromDictionary:dict];

    }
    
    return self;
    
}

- (NSDictionary *)dictionaryRepresentation
{
    NSMutableDictionary *mutableDict = [NSMutableDictionary dictionary];
    [mutableDict setValue:self.ref forKey:kMainDetailLinkRef];
    [mutableDict setValue:self.title forKey:kMainDetailLinkTitle];
    [mutableDict setValue:self.href forKey:kMainDetailLinkHref];

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

    self.ref = [aDecoder decodeObjectForKey:kMainDetailLinkRef];
    self.title = [aDecoder decodeObjectForKey:kMainDetailLinkTitle];
    self.href = [aDecoder decodeObjectForKey:kMainDetailLinkHref];
    return self;
}

- (void)encodeWithCoder:(NSCoder *)aCoder
{

    [aCoder encodeObject:_ref forKey:kMainDetailLinkRef];
    [aCoder encodeObject:_title forKey:kMainDetailLinkTitle];
    [aCoder encodeObject:_href forKey:kMainDetailLinkHref];
}

- (id)copyWithZone:(NSZone *)zone
{
    MainDetailLink *copy = [[MainDetailLink alloc] init];
    
    if (copy) {

        copy.ref = [self.ref copyWithZone:zone];
        copy.title = [self.title copyWithZone:zone];
        copy.href = [self.href copyWithZone:zone];
    }
    
    return copy;
}


@end
