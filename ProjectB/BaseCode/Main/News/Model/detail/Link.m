//
//  Link.m
//
//  Created by   on 2016/9/30
//  Copyright (c) 2016 __MyCompanyName__. All rights reserved.
//

#import "Link.h"


NSString *const kLinkRef = @"ref";
NSString *const kLinkTitle = @"title";
NSString *const kLinkHref = @"href";


@interface Link ()

- (id)objectOrNilForKey:(id)aKey fromDictionary:(NSDictionary *)dict;

@end

@implementation Link

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
            self.ref = [self objectOrNilForKey:kLinkRef fromDictionary:dict];
            self.title = [self objectOrNilForKey:kLinkTitle fromDictionary:dict];
            self.href = [self objectOrNilForKey:kLinkHref fromDictionary:dict];

    }
    
    return self;
    
}

- (NSDictionary *)dictionaryRepresentation
{
    NSMutableDictionary *mutableDict = [NSMutableDictionary dictionary];
    [mutableDict setValue:self.ref forKey:kLinkRef];
    [mutableDict setValue:self.title forKey:kLinkTitle];
    [mutableDict setValue:self.href forKey:kLinkHref];

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

    self.ref = [aDecoder decodeObjectForKey:kLinkRef];
    self.title = [aDecoder decodeObjectForKey:kLinkTitle];
    self.href = [aDecoder decodeObjectForKey:kLinkHref];
    return self;
}

- (void)encodeWithCoder:(NSCoder *)aCoder
{

    [aCoder encodeObject:_ref forKey:kLinkRef];
    [aCoder encodeObject:_title forKey:kLinkTitle];
    [aCoder encodeObject:_href forKey:kLinkHref];
}

- (id)copyWithZone:(NSZone *)zone
{
    Link *copy = [[Link alloc] init];
    
    if (copy) {

        copy.ref = [self.ref copyWithZone:zone];
        copy.title = [self.title copyWithZone:zone];
        copy.href = [self.href copyWithZone:zone];
    }
    
    return copy;
}


@end
